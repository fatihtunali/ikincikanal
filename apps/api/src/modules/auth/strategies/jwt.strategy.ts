import { Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { RedisService } from '../../redis/redis.service';
import { PrismaService } from '../../prisma/prisma.service';

export interface JwtPayload {
  sub: string; // userId
  deviceId: string;
  jti: string;
  iat: number;
  exp: number;
}

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private readonly config: ConfigService,
    private readonly redis: RedisService,
    private readonly prisma: PrismaService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: config.get('JWT_SECRET', 'change-me-in-production'),
    });
  }

  async validate(payload: JwtPayload): Promise<JwtPayload> {
    // Check if JWT is blacklisted (logout)
    const isBlacklisted = await this.redis.isJtiBlacklisted(payload.jti);
    if (isBlacklisted) {
      throw new UnauthorizedException('Token has been revoked');
    }

    // Verify device is not revoked
    const device = await this.prisma.device.findFirst({
      where: {
        id: payload.deviceId,
        userId: payload.sub,
        revokedAt: null,
      },
    });

    if (!device) {
      throw new UnauthorizedException('Device revoked or not found');
    }

    // Update last active timestamp (fire and forget)
    this.prisma.device
      .update({
        where: { id: payload.deviceId },
        data: { lastActiveAt: new Date() },
      })
      .catch(() => {}); // Ignore errors

    return payload;
  }
}
