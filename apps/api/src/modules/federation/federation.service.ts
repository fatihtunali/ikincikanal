import {
  Injectable,
  BadRequestException,
  ForbiddenException,
  NotFoundException,
  ConflictException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { createHash, createSign, createVerify, randomBytes } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  ServerDiscoveryDto,
  FederationInboxDto,
  FederationPayloadType,
  FederationHeaders,
} from './dto/federation.dto';

@Injectable()
export class FederationService {
  private readonly homeServer: string;
  private readonly baseUrl: string;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly config: ConfigService,
  ) {
    this.homeServer = this.config.get('HOME_SERVER', 'ikincikanal.com');
    this.baseUrl = this.config.get(
      'BASE_URL',
      `https://api.${this.homeServer}`,
    );
  }

  // ==========================================================================
  // Server Discovery
  // ==========================================================================

  async getServerDiscovery(): Promise<ServerDiscoveryDto> {
    // Get own server record
    const server = await this.prisma.federationServer.findUnique({
      where: { handle: `@${this.homeServer}` },
      include: { keys: true },
    });

    if (!server) {
      throw new NotFoundException('Server not configured');
    }

    return {
      serverHandle: server.handle,
      baseUrl: this.baseUrl,
      preferredKeyId: server.preferredKeyId || server.keys[0]?.keyId || '',
      publicKeys: server.keys.map((k) => ({
        keyId: k.keyId,
        publicKey: k.publicKey,
        status: k.status as 'active' | 'deprecated',
        notBefore: k.notBefore?.toISOString(),
        notAfter: k.notAfter?.toISOString(),
      })),
      supportedVersions: ['1.0'],
    };
  }

  // ==========================================================================
  // Inbox (Receive S2S Messages)
  // ==========================================================================

  async processInbox(
    dto: FederationInboxDto,
    headers: FederationHeaders,
    body: string,
  ): Promise<{ accepted: boolean; envelopeId?: string }> {
    // 1. Validate timestamp (±5 minutes)
    const timestamp = parseInt(headers['x-timestamp']);
    const now = Date.now();
    const skew = 5 * 60 * 1000; // 5 minutes

    if (Math.abs(now - timestamp) > skew) {
      throw new ForbiddenException('Timestamp outside acceptable range');
    }

    // 2. Check nonce for replay
    const nonce = headers['x-nonce'];
    const serverOrigin = headers['x-server-origin'];

    if (nonce.length < 16 || nonce.length > 64) {
      throw new BadRequestException('Invalid nonce length');
    }

    const isReplay = await this.redis.isNonceReplay(serverOrigin, nonce);
    if (isReplay) {
      throw new ConflictException('Nonce replay detected');
    }

    // 3. Verify signature
    const keyId = headers['x-key-id'];
    const signature = headers['x-signature'];

    const isValid = await this.verifySignature(
      serverOrigin,
      keyId,
      signature,
      headers,
      body,
    );

    if (!isValid) {
      throw new ForbiddenException('Invalid signature');
    }

    // 4. Store nonce to prevent replay
    await this.redis.storeNonce(serverOrigin, nonce);

    // 5. Process payload based on type
    switch (dto.payloadType) {
      case FederationPayloadType.MESSAGE:
        await this.processIncomingMessage(dto.payload, serverOrigin);
        break;
      case FederationPayloadType.USER_DELETED:
        await this.processUserDeleted(dto.payload, serverOrigin);
        break;
      case FederationPayloadType.KEY_REQUEST:
        // Handle key request (return keys for user)
        break;
      default:
        throw new BadRequestException('Unknown payload type');
    }

    return {
      accepted: true,
      envelopeId: dto.envelopeId,
    };
  }

  // ==========================================================================
  // Signature Verification
  // ==========================================================================

  private async verifySignature(
    serverOrigin: string,
    keyId: string,
    signature: string,
    headers: FederationHeaders,
    body: string,
  ): Promise<boolean> {
    // Get server's public key
    const server = await this.prisma.federationServer.findUnique({
      where: { handle: serverOrigin },
      include: { keys: true },
    });

    if (!server) {
      // Unknown server - try to discover
      // For now, reject unknown servers
      return false;
    }

    const key = server.keys.find(
      (k) => k.keyId === keyId && k.status === 'active',
    );
    if (!key) {
      return false;
    }

    // Build canonical request string
    const canonical = this.buildCanonicalString(headers, body);

    // Verify Ed25519 signature
    try {
      const verify = createVerify('Ed25519');
      verify.update(canonical);
      return verify.verify(
        Buffer.from(key.publicKey, 'base64'),
        Buffer.from(signature, 'base64'),
      );
    } catch {
      return false;
    }
  }

  private buildCanonicalString(
    headers: FederationHeaders,
    body: string,
  ): string {
    // Canonical format:
    // timestamp\n
    // nonce\n
    // server-origin\n
    // body-hash (SHA256)
    const bodyHash = createHash('sha256').update(body).digest('hex');

    return [
      headers['x-timestamp'],
      headers['x-nonce'],
      headers['x-server-origin'],
      bodyHash,
    ].join('\n');
  }

  // ==========================================================================
  // Process Incoming Federation Messages
  // ==========================================================================

  private async processIncomingMessage(
    payload: string,
    fromServer: string,
  ): Promise<void> {
    // Parse message payload
    const message = JSON.parse(payload);

    // Find local recipient
    const { handle } = this.parseFullHandle(message.toFullHandle);
    const user = await this.prisma.user.findUnique({
      where: { handle },
    });

    if (!user) {
      throw new NotFoundException('Recipient not found');
    }

    // Store in message queue
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000);

    await this.prisma.messageQueue.create({
      data: {
        toUserId: user.id,
        toDeviceId: message.toDeviceId || null,
        fromUserId: null, // Federated messages don't have local sender
        fromDeviceId: null,
        clientMessageId: message.clientMessageId,
        ciphertext: message.ciphertext,
        envelopeType: message.envelopeType,
        sentAt: new Date(),
        expiresAt,
        idempotencyKey: `fed:${fromServer}:${message.clientMessageId}`,
      },
    });
  }

  private async processUserDeleted(
    payload: string,
    fromServer: string,
  ): Promise<void> {
    const data = JSON.parse(payload);

    // Log deletion for audit
    console.log(
      `[Federation] User deleted: ${data.fullHandle} at ${data.deletedAt}`,
    );

    // Could clean up any cached data for this user
    // Implementation depends on what data we cache
  }

  // ==========================================================================
  // Outbound Federation
  // ==========================================================================

  async sendToRemoteServer(
    targetServer: string,
    payloadType: FederationPayloadType,
    payload: any,
  ): Promise<boolean> {
    // Get target server info
    const server = await this.prisma.federationServer.findUnique({
      where: { handle: targetServer },
    });

    if (!server) {
      throw new NotFoundException('Unknown federation server');
    }

    // Build request
    const body = JSON.stringify({
      payloadType,
      payload: JSON.stringify(payload),
      envelopeId: randomBytes(16).toString('hex'),
    });

    const timestamp = Date.now().toString();
    const nonce = randomBytes(32).toString('base64url');

    // Get our signing key
    const ourServer = await this.prisma.federationServer.findUnique({
      where: { handle: `@${this.homeServer}` },
      include: { keys: { where: { status: 'active' }, take: 1 } },
    });

    if (!ourServer || ourServer.keys.length === 0) {
      throw new Error('No signing key available');
    }

    const signingKey = ourServer.keys[0];

    // Create signature
    const headers: FederationHeaders = {
      'x-server-origin': ourServer.handle,
      'x-timestamp': timestamp,
      'x-nonce': nonce,
      'x-key-id': signingKey.keyId,
      'x-signature': '', // Will be filled
    };

    const canonical = this.buildCanonicalString(headers, body);
    const signature = this.signMessage(canonical, signingKey.publicKey); // Need private key
    headers['x-signature'] = signature;

    // Send request
    try {
      const response = await fetch(`${server.baseUrl}/federation/inbox`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...headers,
        },
        body,
      });

      return response.ok;
    } catch {
      // Update server status
      await this.prisma.federationServer.update({
        where: { id: server.id },
        data: {
          status: 'unreachable',
          lastError: 'Connection failed',
          updatedAt: new Date(),
        },
      });
      return false;
    }
  }

  private signMessage(message: string, privateKeyBase64: string): string {
    // Note: In production, private key should be stored securely
    // This is a placeholder - actual implementation needs private key management
    const sign = createSign('Ed25519');
    sign.update(message);
    return sign.sign(Buffer.from(privateKeyBase64, 'base64')).toString('base64');
  }

  // ==========================================================================
  // Get Keys for Remote User
  // ==========================================================================

  async getKeysForUser(fullHandle: string): Promise<any> {
    const { handle, server } = this.parseFullHandle(fullHandle);

    if (server === this.homeServer) {
      // Local user
      const user = await this.prisma.user.findUnique({
        where: { handle },
        include: {
          devices: {
            where: { revokedAt: null },
            include: {
              signedPrekeys: { orderBy: { createdAt: 'desc' }, take: 1 },
            },
          },
        },
      });

      if (!user) {
        throw new NotFoundException('User not found');
      }

      return {
        userId: user.id,
        fullHandle: user.fullHandle,
        devices: user.devices.map((d) => ({
          deviceId: d.id,
          registrationId: d.registrationId,
          identityKeyPub: d.identityKeyPub,
          signedPreKey: d.signedPrekeys[0]
            ? {
                keyId: d.signedPrekeys[0].keyId,
                publicKey: d.signedPrekeys[0].publicKey,
                signature: d.signedPrekeys[0].signature,
              }
            : null,
        })),
      };
    } else {
      // Remote user - would need to make federation request
      throw new BadRequestException(
        'Remote key lookup requires federation request',
      );
    }
  }

  // ==========================================================================
  // Broadcast User Deleted
  // ==========================================================================

  async broadcastUserDeleted(
    fullHandle: string,
    targetServers?: string[],
  ): Promise<{ notified: string[]; failed: string[] }> {
    const notified: string[] = [];
    const failed: string[] = [];

    // Get list of federated servers to notify
    let servers: { handle: string }[];

    if (targetServers && targetServers.length > 0) {
      servers = targetServers.map(h => ({ handle: h }));
    } else {
      // Notify all known active federated servers
      servers = await this.prisma.federationServer.findMany({
        where: {
          status: 'active',
          handle: { not: `@${this.homeServer}` }, // Don't notify ourselves
        },
        select: { handle: true },
      });
    }

    const payload = {
      fullHandle,
      deletedAt: new Date().toISOString(),
    };

    // Send to each server
    for (const server of servers) {
      try {
        const success = await this.sendToRemoteServer(
          server.handle,
          FederationPayloadType.USER_DELETED,
          payload,
        );

        if (success) {
          notified.push(server.handle);
        } else {
          failed.push(server.handle);
        }
      } catch (error) {
        console.error(
          `[Federation] Failed to notify ${server.handle} of user deletion:`,
          error,
        );
        failed.push(server.handle);
      }
    }

    console.log(
      `[Federation] User deletion broadcast for ${fullHandle}: ` +
      `${notified.length} notified, ${failed.length} failed`,
    );

    return { notified, failed };
  }

  // ==========================================================================
  // Helpers
  // ==========================================================================

  private parseFullHandle(fullHandle: string): {
    handle: string;
    server: string;
  } {
    const clean = fullHandle.startsWith('@')
      ? fullHandle.slice(1)
      : fullHandle;
    const [handle, server] = clean.split('@');
    return { handle, server };
  }
}
