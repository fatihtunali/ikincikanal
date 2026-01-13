import {
  Injectable,
  ForbiddenException,
  NotFoundException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { createHmac, randomBytes, randomUUID } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  TurnCredentialsResponseDto,
  CallInviteDto,
  CallSignalDto,
  CallEventType,
  PendingCallEventsResponseDto,
  AckCallEventsDto,
  AckCallEventsResponseDto,
  CallInviteResponseDto,
} from './dto/calls.dto';

@Injectable()
export class CallsService {
  private readonly turnSecret: string;
  private readonly turnServers: string[];
  private readonly callEventTtlMinutes = 5;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly config: ConfigService,
  ) {
    this.turnSecret = this.config.get('TURN_SECRET', 'change-me');
    this.turnServers = this.config
      .get('TURN_SERVERS', 'turn:turn.ikincikanal.com:3478')
      .split(',');
  }

  // ==========================================================================
  // TURN Credentials
  // ==========================================================================

  async getTurnCredentials(userId: string): Promise<TurnCredentialsResponseDto> {
    // Rate limit: 10 requests per hour per user
    const rate = await this.redis.incrementTurnRate(userId);
    if (rate > 10) {
      throw new ForbiddenException('TURN credential rate limit exceeded');
    }

    // Generate ephemeral credentials
    // Format: timestamp:username
    const ttl = 86400; // 24 hours
    const timestamp = Math.floor(Date.now() / 1000) + ttl;
    const username = `${timestamp}:${userId}`;

    // HMAC-SHA1 password (coturn compatible)
    const password = createHmac('sha1', this.turnSecret)
      .update(username)
      .digest('base64');

    return {
      username,
      password,
      ttl,
      urls: this.turnServers,
    };
  }

  // ==========================================================================
  // Call Signaling
  // ==========================================================================

  async createCallInvite(
    fromUserId: string,
    fromDeviceId: string,
    dto: CallInviteDto,
  ): Promise<CallInviteResponseDto> {
    // Verify recipient exists
    const recipient = await this.prisma.user.findUnique({
      where: { id: dto.toUserId },
    });
    if (!recipient) {
      throw new NotFoundException('Recipient not found');
    }

    const callId = randomUUID();
    const expiresAt = new Date(Date.now() + this.callEventTtlMinutes * 60 * 1000);

    // Create call event for all devices or specific device
    const event = await this.prisma.callEvent.create({
      data: {
        callId,
        fromUserId,
        fromDeviceId,
        toUserId: dto.toUserId,
        toDeviceId: dto.toDeviceId || null,
        eventType: CallEventType.INVITE,
        encryptedPayload: dto.encryptedOffer,
        expiresAt,
      },
    });

    // Notify recipient via pubsub
    if (dto.toDeviceId) {
      await this.redis.publishCallEvent(dto.toDeviceId);
    } else {
      // Notify all devices
      const devices = await this.prisma.device.findMany({
        where: { userId: dto.toUserId, revokedAt: null },
        select: { id: true },
      });
      for (const device of devices) {
        await this.redis.publishCallEvent(device.id);
      }
    }

    return {
      callId,
      eventId: event.eventId,
    };
  }

  async sendCallSignal(
    fromUserId: string,
    fromDeviceId: string,
    dto: CallSignalDto,
  ): Promise<{ eventId: string }> {
    // Verify recipient exists
    const recipient = await this.prisma.user.findUnique({
      where: { id: dto.toUserId },
    });
    if (!recipient) {
      throw new NotFoundException('Recipient not found');
    }

    const expiresAt = new Date(Date.now() + this.callEventTtlMinutes * 60 * 1000);

    const event = await this.prisma.callEvent.create({
      data: {
        callId: dto.callId,
        fromUserId,
        fromDeviceId,
        toUserId: dto.toUserId,
        toDeviceId: dto.toDeviceId || null,
        eventType: dto.eventType,
        encryptedPayload: dto.encryptedPayload,
        expiresAt,
      },
    });

    // Notify recipient
    if (dto.toDeviceId) {
      await this.redis.publishCallEvent(dto.toDeviceId);
    } else {
      const devices = await this.prisma.device.findMany({
        where: { userId: dto.toUserId, revokedAt: null },
        select: { id: true },
      });
      for (const device of devices) {
        await this.redis.publishCallEvent(device.id);
      }
    }

    return { eventId: event.eventId };
  }

  // ==========================================================================
  // Get Pending Events
  // ==========================================================================

  async getPendingCallEvents(
    userId: string,
    deviceId: string,
    limit: number = 50,
    waitSeconds: number = 0,
  ): Promise<PendingCallEventsResponseDto> {
    // First try to get events immediately
    let events = await this.fetchPendingEvents(userId, deviceId, limit + 1);

    // Long-poll if no events
    if (events.length === 0 && waitSeconds > 0) {
      const maxWait = Math.min(waitSeconds, 30);

      await new Promise<void>((resolve) => {
        const timeout = setTimeout(resolve, maxWait * 1000);

        this.redis.subscribeToCallEvents(deviceId, () => {
          clearTimeout(timeout);
          resolve();
        });
      });

      events = await this.fetchPendingEvents(userId, deviceId, limit + 1);
    }

    const hasMore = events.length > limit;
    if (hasMore) {
      events = events.slice(0, limit);
    }

    return {
      events: events.map((e) => ({
        eventId: e.eventId,
        callId: e.callId,
        fromUserId: e.fromUserId,
        fromDeviceId: e.fromDeviceId,
        eventType: e.eventType,
        encryptedPayload: e.encryptedPayload,
        createdAt: e.createdAt,
        expiresAt: e.expiresAt,
      })),
      hasMore,
    };
  }

  private async fetchPendingEvents(
    userId: string,
    deviceId: string,
    limit: number,
  ) {
    return this.prisma.callEvent.findMany({
      where: {
        toUserId: userId,
        OR: [{ toDeviceId: deviceId }, { toDeviceId: null }],
        expiresAt: { gt: new Date() },
        ackedAt: null,
      },
      orderBy: { createdAt: 'asc' },
      take: limit,
    });
  }

  // ==========================================================================
  // Acknowledge Events
  // ==========================================================================

  async acknowledgeCallEvents(
    userId: string,
    deviceId: string,
    dto: AckCallEventsDto,
  ): Promise<AckCallEventsResponseDto> {
    const result = await this.prisma.callEvent.updateMany({
      where: {
        eventId: { in: dto.eventIds },
        toUserId: userId,
        OR: [{ toDeviceId: deviceId }, { toDeviceId: null }],
      },
      data: { ackedAt: new Date() },
    });

    return { acknowledged: result.count };
  }
}
