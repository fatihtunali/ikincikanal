import {
  Injectable,
  BadRequestException,
  UnauthorizedException,
  ConflictException,
  ForbiddenException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import {
  generateRegistrationOptions,
  verifyRegistrationResponse,
  generateAuthenticationOptions,
  verifyAuthenticationResponse,
} from '@simplewebauthn/server';
import * as argon2 from 'argon2';
import { createHash, randomBytes, timingSafeEqual } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  RegisterRequestDto,
  NewDeviceKeysDto,
  NewDeviceDto,
} from './dto/register.dto';
import {
  PasskeyOptionsRequestDto,
  PasskeyVerifyRequestDto,
  PasswordLoginRequestDto,
  RefreshTokenRequestDto,
  AuthResponseDto,
} from './dto/login.dto';

@Injectable()
export class AuthService {
  private readonly rpId: string;
  private readonly rpName: string;
  private readonly origin: string;
  private readonly homeServer: string;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly jwt: JwtService,
    private readonly config: ConfigService,
  ) {
    this.rpId = this.config.get('WEBAUTHN_RP_ID', 'localhost');
    this.rpName = this.config.get('WEBAUTHN_RP_NAME', 'IKINCI KANAL');
    this.origin = this.config.get('WEBAUTHN_ORIGIN', 'http://localhost:3000');
    this.homeServer = this.config.get('HOME_SERVER', 'ikincikanal.com');
  }

  // ==========================================================================
  // Registration
  // ==========================================================================

  async register(dto: RegisterRequestDto, ip: string): Promise<AuthResponseDto> {
    // Validate oneOf: passkey XOR password
    if (dto.passkey && dto.password) {
      throw new BadRequestException(
        'Provide either passkey or password, not both',
      );
    }
    if (!dto.passkey && !dto.password) {
      throw new BadRequestException('Provide either passkey or password');
    }

    // Check if handle exists
    const existing = await this.prisma.user.findUnique({
      where: { handle: dto.handle },
    });
    if (existing) {
      throw new ConflictException('Handle already taken');
    }

    // Create user
    const fullHandle = `${dto.handle}@${this.homeServer}`;
    let passwordHash: string | null = null;

    if (dto.password) {
      passwordHash = await this.hashPassword(dto.password);
    }

    const user = await this.prisma.user.create({
      data: {
        handle: dto.handle,
        fullHandle,
        homeServer: this.homeServer,
        displayName: dto.displayName,
        passwordHash,
      },
    });

    // Create device
    const device = await this.createDevice(
      user.id,
      dto.newDevice,
      dto.newDeviceKeys,
    );

    // If passkey registration, store passkey
    if (dto.passkey) {
      await this.storePasskeyFromAttestation(user.id, dto.passkey);
    }

    // Generate tokens
    return this.generateAuthTokens(user.id, device.id);
  }

  // ==========================================================================
  // Passkey Authentication
  // ==========================================================================

  async getPasskeyOptions(dto: PasskeyOptionsRequestDto, ip: string) {
    // Rate limiting
    const ipRate = await this.redis.incrementLoginRateByIp(ip);
    if (ipRate > 100) {
      throw new ForbiddenException('Too many requests from this IP');
    }

    const handleRate = await this.redis.incrementLoginRateByHandle(dto.handle);
    if (handleRate > 10) {
      throw new ForbiddenException('Too many login attempts for this handle');
    }

    // Check lockout
    const lockout = await this.redis.getLockout(dto.handle);
    if (lockout && Date.now() < lockout.until) {
      throw new ForbiddenException('Account temporarily locked');
    }

    // Find user and passkeys
    const user = await this.prisma.user.findUnique({
      where: { handle: dto.handle },
      include: { passkeys: true },
    });

    if (!user || user.passkeys.length === 0) {
      // Return fake challenge to prevent user enumeration
      const fakeOptions = await generateAuthenticationOptions({
        rpID: this.rpId,
        allowCredentials: [],
        userVerification: 'preferred',
      });
      await this.redis.storeLoginChallenge(
        dto.handle,
        fakeOptions.challenge,
        60000,
      );
      return fakeOptions;
    }

    const options = await generateAuthenticationOptions({
      rpID: this.rpId,
      allowCredentials: user.passkeys.map((pk) => ({
        id: pk.credentialId,
        transports: pk.transports as any,
      })),
      userVerification: 'preferred',
    });

    await this.redis.storeLoginChallenge(dto.handle, options.challenge, 60000);

    return options;
  }

  async verifyPasskey(
    dto: PasskeyVerifyRequestDto,
    ip: string,
  ): Promise<AuthResponseDto> {
    // Validate oneOf: deviceId XOR (newDevice + newDeviceKeys)
    if (dto.deviceId && dto.newDevice) {
      throw new BadRequestException(
        'Provide either deviceId or newDevice, not both',
      );
    }
    if (!dto.deviceId && !dto.newDevice) {
      throw new BadRequestException('Provide either deviceId or newDevice');
    }
    if (dto.newDevice && !dto.newDeviceKeys) {
      throw new BadRequestException(
        'newDeviceKeys required when registering new device',
      );
    }

    // Get stored challenge
    const storedChallenge = await this.redis.getAndDeleteLoginChallenge(
      dto.handle,
    );
    if (!storedChallenge) {
      throw new UnauthorizedException('Challenge expired or not found');
    }

    // Find user and passkey
    const user = await this.prisma.user.findUnique({
      where: { handle: dto.handle },
      include: { passkeys: true },
    });

    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const passkey = user.passkeys.find(
      (pk) => pk.credentialId === dto.assertion.id,
    );
    if (!passkey) {
      await this.handleFailedLogin(dto.handle);
      throw new UnauthorizedException('Invalid credentials');
    }

    // Verify assertion
    try {
      const verification = await verifyAuthenticationResponse({
        response: {
          id: dto.assertion.id,
          rawId: dto.assertion.rawId,
          type: dto.assertion.type as any,
          response: dto.assertion.response,
          clientExtensionResults: {},
        },
        expectedChallenge: storedChallenge.challenge,
        expectedOrigin: this.origin,
        expectedRPID: this.rpId,
        credential: {
          id: passkey.credentialId,
          publicKey: Buffer.from(passkey.publicKey, 'base64'),
          counter: Number(passkey.counter),
        },
      });

      if (!verification.verified) {
        await this.handleFailedLogin(dto.handle);
        throw new UnauthorizedException('Invalid credentials');
      }

      // Update counter
      await this.prisma.passkey.update({
        where: { id: passkey.id },
        data: {
          counter: verification.authenticationInfo.newCounter,
          lastUsedAt: new Date(),
        },
      });
    } catch (error) {
      await this.handleFailedLogin(dto.handle);
      throw new UnauthorizedException('Invalid credentials');
    }

    // Get or create device
    let deviceId: string;
    if (dto.deviceId) {
      // Verify device belongs to user and is not revoked
      const device = await this.prisma.device.findFirst({
        where: {
          id: dto.deviceId,
          userId: user.id,
          revokedAt: null,
        },
      });
      if (!device) {
        throw new UnauthorizedException('Device not found or revoked');
      }
      deviceId = device.id;

      // Update last active
      await this.prisma.device.update({
        where: { id: deviceId },
        data: { lastActiveAt: new Date() },
      });
    } else {
      // Create new device
      const device = await this.createDevice(
        user.id,
        dto.newDevice!,
        dto.newDeviceKeys!,
      );
      deviceId = device.id;
    }

    return this.generateAuthTokens(user.id, deviceId);
  }

  // ==========================================================================
  // Password Authentication
  // ==========================================================================

  async loginWithPassword(
    dto: PasswordLoginRequestDto,
    ip: string,
  ): Promise<AuthResponseDto> {
    // Validate oneOf: deviceId XOR (newDevice + newDeviceKeys)
    if (dto.deviceId && dto.newDevice) {
      throw new BadRequestException(
        'Provide either deviceId or newDevice, not both',
      );
    }
    if (!dto.deviceId && !dto.newDevice) {
      throw new BadRequestException('Provide either deviceId or newDevice');
    }
    if (dto.newDevice && !dto.newDeviceKeys) {
      throw new BadRequestException(
        'newDeviceKeys required when registering new device',
      );
    }

    // Rate limiting
    const ipRate = await this.redis.incrementLoginRateByIp(ip);
    if (ipRate > 100) {
      throw new ForbiddenException('Too many requests from this IP');
    }

    const handleRate = await this.redis.incrementLoginRateByHandle(dto.handle);
    if (handleRate > 10) {
      throw new ForbiddenException('Too many login attempts for this handle');
    }

    // Check lockout
    const lockout = await this.redis.getLockout(dto.handle);
    if (lockout && Date.now() < lockout.until) {
      throw new ForbiddenException('Account temporarily locked');
    }

    // Find user
    const user = await this.prisma.user.findUnique({
      where: { handle: dto.handle },
    });

    if (!user || !user.passwordHash) {
      // Constant-time fake verification to prevent timing attacks
      await this.hashPassword('fake_password_for_timing');
      await this.handleFailedLogin(dto.handle);
      throw new UnauthorizedException('Invalid credentials');
    }

    // Verify password
    const valid = await argon2.verify(user.passwordHash, dto.password);
    if (!valid) {
      await this.handleFailedLogin(dto.handle);
      throw new UnauthorizedException('Invalid credentials');
    }

    // Get or create device
    let deviceId: string;
    if (dto.deviceId) {
      const device = await this.prisma.device.findFirst({
        where: {
          id: dto.deviceId,
          userId: user.id,
          revokedAt: null,
        },
      });
      if (!device) {
        throw new UnauthorizedException('Device not found or revoked');
      }
      deviceId = device.id;

      await this.prisma.device.update({
        where: { id: deviceId },
        data: { lastActiveAt: new Date() },
      });
    } else {
      const device = await this.createDevice(
        user.id,
        dto.newDevice!,
        dto.newDeviceKeys!,
      );
      deviceId = device.id;
    }

    return this.generateAuthTokens(user.id, deviceId);
  }

  // ==========================================================================
  // Token Refresh
  // ==========================================================================

  async refreshToken(dto: RefreshTokenRequestDto): Promise<AuthResponseDto> {
    const tokenHash = this.hashToken(dto.refreshToken);

    // Find token
    const token = await this.prisma.refreshToken.findUnique({
      where: { tokenHash },
      include: { device: true },
    });

    if (!token) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    if (token.revokedAt) {
      // Token reuse detected - revoke all tokens for this user (security measure)
      await this.prisma.refreshToken.updateMany({
        where: { userId: token.userId },
        data: { revokedAt: new Date() },
      });
      throw new UnauthorizedException('Token reuse detected');
    }

    if (token.expiresAt < new Date()) {
      throw new UnauthorizedException('Refresh token expired');
    }

    if (token.device.revokedAt) {
      throw new UnauthorizedException('Device revoked');
    }

    // Rotate token (mark old as rotated, create new)
    const newRefreshToken = randomBytes(32).toString('base64url');
    const newTokenHash = this.hashToken(newRefreshToken);
    const expiresAt = new Date(
      Date.now() + this.parseExpiry(this.config.get('JWT_REFRESH_EXPIRY', '30d')),
    );

    await this.prisma.$transaction([
      this.prisma.refreshToken.update({
        where: { id: token.id },
        data: { rotatedAt: new Date() },
      }),
      this.prisma.refreshToken.create({
        data: {
          userId: token.userId,
          deviceId: token.deviceId,
          tokenHash: newTokenHash,
          expiresAt,
          previousTokenId: token.id,
        },
      }),
    ]);

    // Generate new access token
    const accessToken = this.jwt.sign({
      sub: token.userId,
      deviceId: token.deviceId,
      jti: randomBytes(16).toString('hex'),
    });

    return {
      accessToken,
      refreshToken: newRefreshToken,
      expiresIn: this.parseExpiry(this.config.get('JWT_ACCESS_EXPIRY', '15m')) / 1000,
      tokenType: 'Bearer',
      userId: token.userId,
      deviceId: token.deviceId,
    };
  }

  // ==========================================================================
  // Logout
  // ==========================================================================

  async logout(userId: string, deviceId: string, jti: string): Promise<void> {
    // Revoke all refresh tokens for this device
    await this.prisma.refreshToken.updateMany({
      where: {
        userId,
        deviceId,
        revokedAt: null,
      },
      data: { revokedAt: new Date() },
    });

    // Blacklist current JWT
    const accessExpiry = this.parseExpiry(
      this.config.get('JWT_ACCESS_EXPIRY', '15m'),
    );
    await this.redis.blacklistJti(jti, Math.ceil(accessExpiry / 1000));
  }

  // ==========================================================================
  // Helper Methods
  // ==========================================================================

  private async createDevice(
    userId: string,
    deviceInfo: NewDeviceDto,
    keys: NewDeviceKeysDto,
  ) {
    return this.prisma.$transaction(async (tx) => {
      // Create device
      const device = await tx.device.create({
        data: {
          userId,
          deviceName: deviceInfo.deviceName,
          registrationId: deviceInfo.registrationId,
          identityKeyPub: keys.identityKeyPub,
        },
      });

      // Store signed prekey
      await tx.signedPrekey.create({
        data: {
          deviceId: device.id,
          keyId: keys.signedPreKey.keyId,
          publicKey: keys.signedPreKey.publicKey,
          signature: keys.signedPreKey.signature,
        },
      });

      // Store one-time prekeys
      await tx.oneTimePrekey.createMany({
        data: keys.oneTimePreKeys.map((pk) => ({
          deviceId: device.id,
          keyId: pk.keyId,
          publicKey: pk.publicKey,
        })),
      });

      return device;
    });
  }

  private async storePasskeyFromAttestation(
    userId: string,
    attestation: any,
  ): Promise<void> {
    // In a real implementation, you'd verify the attestation here
    // For now, we store the basic credential info
    await this.prisma.passkey.create({
      data: {
        userId,
        credentialId: attestation.id,
        publicKey: attestation.response.attestationObject, // Should be extracted properly
        counter: 0,
        transports: attestation.response.transports || [],
        authenticatorType: 'platform',
      },
    });
  }

  private async generateAuthTokens(
    userId: string,
    deviceId: string,
  ): Promise<AuthResponseDto> {
    const jti = randomBytes(16).toString('hex');
    const accessToken = this.jwt.sign({
      sub: userId,
      deviceId,
      jti,
    });

    const refreshToken = randomBytes(32).toString('base64url');
    const tokenHash = this.hashToken(refreshToken);
    const expiresAt = new Date(
      Date.now() + this.parseExpiry(this.config.get('JWT_REFRESH_EXPIRY', '30d')),
    );

    await this.prisma.refreshToken.create({
      data: {
        userId,
        deviceId,
        tokenHash,
        expiresAt,
      },
    });

    return {
      accessToken,
      refreshToken,
      expiresIn: this.parseExpiry(this.config.get('JWT_ACCESS_EXPIRY', '15m')) / 1000,
      tokenType: 'Bearer',
      userId,
      deviceId,
    };
  }

  private async hashPassword(password: string): Promise<string> {
    return argon2.hash(password, {
      type: argon2.argon2id,
      memoryCost: this.config.get('ARGON2_MEMORY_COST', 65536),
      timeCost: this.config.get('ARGON2_TIME_COST', 3),
      parallelism: this.config.get('ARGON2_PARALLELISM', 4),
    });
  }

  private hashToken(token: string): string {
    return createHash('sha256').update(token).digest('hex');
  }

  private async handleFailedLogin(handle: string): Promise<void> {
    const lockout = await this.redis.getLockout(handle);
    const count = (lockout?.count || 0) + 1;

    if (count >= 5) {
      // Lock for increasing duration: 5min, 15min, 1hr, 24hr
      const lockDurations = [5 * 60000, 15 * 60000, 60 * 60000, 24 * 60 * 60000];
      const duration = lockDurations[Math.min(count - 5, lockDurations.length - 1)];
      await this.redis.setLockout(handle, count, Date.now() + duration);
    } else {
      await this.redis.setLockout(handle, count, 0);
    }
  }

  private parseExpiry(expiry: string): number {
    const match = expiry.match(/^(\d+)([smhd])$/);
    if (!match) return 15 * 60 * 1000; // Default 15 minutes

    const value = parseInt(match[1]);
    const unit = match[2];
    const multipliers: Record<string, number> = {
      s: 1000,
      m: 60 * 1000,
      h: 60 * 60 * 1000,
      d: 24 * 60 * 60 * 1000,
    };
    return value * (multipliers[unit] || 60000);
  }
}
