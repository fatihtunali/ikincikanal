import {
  Injectable,
  BadRequestException,
  NotFoundException,
  ForbiddenException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { createHash, randomBytes, timingSafeEqual } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  SendMessageDto,
  SendMessageResponseDto,
  PendingMessagesResponseDto,
  AckMessagesDto,
  AckMessagesResponseDto,
  RequestDeliveryTokenDto,
  DeliveryTokenResponseDto,
  SealedSendDto,
  EnvelopeType,
} from './dto/messages.dto';

@Injectable()
export class MessagesService {
  private readonly defaultTtlDays = 7;
  private readonly maxDeliveryTokensPerUser = 10;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly config: ConfigService,
  ) {}

  // ==========================================================================
  // Send Message
  // ==========================================================================

  async sendMessage(
    fromUserId: string,
    fromDeviceId: string,
    dto: SendMessageDto,
  ): Promise<SendMessageResponseDto[]> {
    // Verify recipient exists
    const recipient = await this.prisma.user.findUnique({
      where: { id: dto.toUserId },
    });
    if (!recipient) {
      throw new NotFoundException('Recipient not found');
    }

    // Verify destination devices exist and belong to recipient
    const deviceIds = dto.destinations.map((d) => d.deviceId);
    const devices = await this.prisma.device.findMany({
      where: {
        id: { in: deviceIds },
        userId: dto.toUserId,
        revokedAt: null,
      },
    });

    if (devices.length !== deviceIds.length) {
      throw new BadRequestException('One or more destination devices not found');
    }

    const expiresAt = new Date(
      Date.now() + this.defaultTtlDays * 24 * 60 * 60 * 1000,
    );
    const sentAt = new Date();
    const results: SendMessageResponseDto[] = [];

    await this.prisma.$transaction(async (tx) => {
      for (const dest of dto.destinations) {
        // Check idempotency
        const existing = await tx.messageQueue.findFirst({
          where: {
            fromDeviceId,
            clientMessageId: dto.clientMessageId,
            toDeviceId: dest.deviceId,
          },
        });

        if (existing) {
          results.push({
            serverMessageId: existing.serverMessageId,
            sentAt: existing.sentAt,
          });
          continue;
        }

        const message = await tx.messageQueue.create({
          data: {
            toUserId: dto.toUserId,
            toDeviceId: dest.deviceId,
            fromUserId,
            fromDeviceId,
            clientMessageId: dto.clientMessageId,
            ciphertext: dest.ciphertext,
            envelopeType: dto.envelopeType,
            sentAt,
            expiresAt,
            disappearingSeconds: dto.disappearingSeconds,
          },
        });

        results.push({
          serverMessageId: message.serverMessageId,
          sentAt: message.sentAt,
        });

        // Notify recipient device via pubsub
        await this.redis.publishMessageArrival(dest.deviceId);
      }
    });

    return results;
  }

  // ==========================================================================
  // Get Pending Messages
  // ==========================================================================

  async getPendingMessages(
    userId: string,
    deviceId: string,
    limit: number = 100,
    waitSeconds: number = 0,
  ): Promise<PendingMessagesResponseDto> {
    // First, try to get messages immediately
    let messages = await this.fetchPendingMessages(userId, deviceId, limit + 1);

    // If no messages and long-poll requested, wait for notification
    if (messages.length === 0 && waitSeconds > 0) {
      const maxWait = Math.min(waitSeconds, 30); // Max 30 seconds

      await new Promise<void>((resolve) => {
        const timeout = setTimeout(resolve, maxWait * 1000);

        this.redis.subscribeToMessages(deviceId, () => {
          clearTimeout(timeout);
          resolve();
        });
      });

      // Try again after notification or timeout
      messages = await this.fetchPendingMessages(userId, deviceId, limit + 1);
    }

    const hasMore = messages.length > limit;
    if (hasMore) {
      messages = messages.slice(0, limit);
    }

    return {
      messages: messages.map((m) => ({
        serverMessageId: m.serverMessageId,
        fromUserId: m.fromUserId || undefined,
        fromDeviceId: m.fromDeviceId || undefined,
        clientMessageId: m.clientMessageId,
        ciphertext: m.ciphertext,
        envelopeType: m.envelopeType,
        sentAt: m.sentAt,
        disappearingSeconds: m.disappearingSeconds || undefined,
      })),
      hasMore,
    };
  }

  private async fetchPendingMessages(
    userId: string,
    deviceId: string,
    limit: number,
  ) {
    return this.prisma.messageQueue.findMany({
      where: {
        toUserId: userId,
        OR: [{ toDeviceId: deviceId }, { toDeviceId: null }],
        expiresAt: { gt: new Date() },
      },
      orderBy: { receivedAt: 'asc' },
      take: limit,
    });
  }

  // ==========================================================================
  // Acknowledge Messages
  // ==========================================================================

  async acknowledgeMessages(
    userId: string,
    deviceId: string,
    dto: AckMessagesDto,
  ): Promise<AckMessagesResponseDto> {
    // Delete acknowledged messages
    const result = await this.prisma.messageQueue.deleteMany({
      where: {
        serverMessageId: { in: dto.serverMessageIds },
        toUserId: userId,
        OR: [{ toDeviceId: deviceId }, { toDeviceId: null }],
      },
    });

    return { acknowledged: result.count };
  }

  // ==========================================================================
  // Delivery Tokens (Sealed Sender)
  // ==========================================================================

  async requestDeliveryToken(
    userId: string,
    dto: RequestDeliveryTokenDto,
  ): Promise<DeliveryTokenResponseDto> {
    // Check existing token count
    const existingCount = await this.prisma.deliveryToken.count({
      where: {
        userId,
        expiresAt: { gt: new Date() },
        usedAt: null,
      },
    });

    if (existingCount >= this.maxDeliveryTokensPerUser) {
      throw new BadRequestException('Maximum delivery tokens reached');
    }

    // Generate token
    const token = randomBytes(32).toString('base64url');
    const tokenHash = this.hashToken(token);
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000); // 7 days

    await this.prisma.deliveryToken.create({
      data: {
        userId,
        tokenHash,
        forSenderType: dto.forSenderType,
        forSenderValue: dto.forSenderValue,
        maxPayloadBytes: dto.maxPayloadBytes || 65536,
        requirePow: dto.requirePow || false,
        expiresAt,
      },
    });

    return {
      token,
      expiresAt,
      maxPayloadBytes: dto.maxPayloadBytes || 65536,
      requirePow: dto.requirePow || false,
    };
  }

  // ==========================================================================
  // Sealed Send (No Auth)
  // ==========================================================================

  async sealedSend(dto: SealedSendDto, ip: string): Promise<SendMessageResponseDto> {
    // Rate limit by IP
    const ipRate = await this.redis.incrementLoginRateByIp(ip);
    if (ipRate > 100) {
      throw new ForbiddenException('Too many requests');
    }

    // Validate token
    const tokenHash = this.hashToken(dto.deliveryToken);
    const token = await this.prisma.deliveryToken.findUnique({
      where: { tokenHash },
      include: { user: true },
    });

    if (!token) {
      throw new ForbiddenException('Invalid delivery token');
    }

    // Check token validity
    if (token.usedAt) {
      throw new ForbiddenException('Token already used');
    }

    if (token.expiresAt < new Date()) {
      throw new ForbiddenException('Token expired');
    }

    // Check payload size
    const payloadSize = Buffer.byteLength(dto.ciphertext, 'base64');
    if (payloadSize > token.maxPayloadBytes) {
      throw new BadRequestException('Payload too large');
    }

    // Verify destination device
    const device = await this.prisma.device.findFirst({
      where: {
        id: dto.toDeviceId,
        userId: token.userId,
        revokedAt: null,
      },
    });

    if (!device) {
      throw new NotFoundException('Destination device not found');
    }

    // Mark token as used
    await this.prisma.deliveryToken.update({
      where: { id: token.id },
      data: { usedAt: new Date() },
    });

    // Create message (sealed sender = no fromUserId/fromDeviceId)
    const expiresAt = new Date(
      Date.now() + this.defaultTtlDays * 24 * 60 * 60 * 1000,
    );
    const sentAt = new Date();

    const message = await this.prisma.messageQueue.create({
      data: {
        toUserId: token.userId,
        toDeviceId: dto.toDeviceId,
        fromUserId: null,
        fromDeviceId: null,
        clientMessageId: dto.clientMessageId,
        ciphertext: dto.ciphertext,
        envelopeType: EnvelopeType.SEALED_SENDER,
        sentAt,
        expiresAt,
      },
    });

    // Notify recipient
    await this.redis.publishMessageArrival(dto.toDeviceId);

    return {
      serverMessageId: message.serverMessageId,
      sentAt: message.sentAt,
    };
  }

  private hashToken(token: string): string {
    return createHash('sha256').update(token).digest('hex');
  }
}
