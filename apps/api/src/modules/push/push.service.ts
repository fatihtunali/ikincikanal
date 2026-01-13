import { Injectable, NotFoundException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaService } from '../prisma/prisma.service';
import {
  RegisterPushTokenDto,
  PushTokenResponseDto,
  PushPayload,
} from './dto/push.dto';

@Injectable()
export class PushService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly config: ConfigService,
  ) {}

  // ==========================================================================
  // Token Management
  // ==========================================================================

  async registerToken(
    userId: string,
    deviceId: string,
    dto: RegisterPushTokenDto,
  ): Promise<PushTokenResponseDto> {
    // Upsert push token (one per device)
    const pushToken = await this.prisma.pushToken.upsert({
      where: { deviceId },
      create: {
        userId,
        deviceId,
        provider: dto.provider,
        token: dto.token,
        endpoint: dto.endpoint,
        appBundleId: dto.appBundleId,
      },
      update: {
        provider: dto.provider,
        token: dto.token,
        endpoint: dto.endpoint,
        appBundleId: dto.appBundleId,
        updatedAt: new Date(),
      },
    });

    return {
      id: pushToken.id,
      provider: pushToken.provider,
      createdAt: pushToken.createdAt,
      updatedAt: pushToken.updatedAt,
    };
  }

  async deleteToken(userId: string, deviceId: string): Promise<void> {
    const result = await this.prisma.pushToken.deleteMany({
      where: { userId, deviceId },
    });

    if (result.count === 0) {
      throw new NotFoundException('Push token not found');
    }
  }

  async getToken(
    userId: string,
    deviceId: string,
  ): Promise<PushTokenResponseDto | null> {
    const pushToken = await this.prisma.pushToken.findUnique({
      where: { deviceId },
    });

    if (!pushToken || pushToken.userId !== userId) {
      return null;
    }

    return {
      id: pushToken.id,
      provider: pushToken.provider,
      createdAt: pushToken.createdAt,
      updatedAt: pushToken.updatedAt,
    };
  }

  // ==========================================================================
  // Send Notifications (Privacy-Preserving)
  // ==========================================================================

  /**
   * Send push notification to a user's device
   * IMPORTANT: Never includes message content - only wakeup signal
   */
  async sendPushNotification(
    userId: string,
    deviceId: string,
    payload: PushPayload,
  ): Promise<boolean> {
    const pushToken = await this.prisma.pushToken.findUnique({
      where: { deviceId },
    });

    if (!pushToken || pushToken.userId !== userId) {
      return false;
    }

    // In production, integrate with actual push services:
    // - FCM: Firebase Admin SDK
    // - APNS: Apple Push Notification Service
    // - UnifiedPush: HTTP POST to endpoint

    switch (pushToken.provider) {
      case 'fcm':
        return this.sendFcmNotification(pushToken.token, payload);
      case 'apns':
        return this.sendApnsNotification(pushToken.token, payload);
      case 'unified_push':
        return this.sendUnifiedPushNotification(
          pushToken.endpoint!,
          pushToken.token,
          payload,
        );
      default:
        return false;
    }
  }

  /**
   * Send push to all devices of a user
   */
  async sendPushToUser(userId: string, payload: PushPayload): Promise<number> {
    const tokens = await this.prisma.pushToken.findMany({
      where: { userId },
      include: { device: true },
    });

    let successCount = 0;

    for (const token of tokens) {
      if (token.device.revokedAt) continue;

      const success = await this.sendPushNotification(
        userId,
        token.deviceId,
        payload,
      );
      if (success) successCount++;
    }

    return successCount;
  }

  // ==========================================================================
  // Provider-Specific Implementations (Stubs)
  // ==========================================================================

  private async sendFcmNotification(
    token: string,
    payload: PushPayload,
  ): Promise<boolean> {
    // TODO: Implement FCM using Firebase Admin SDK
    // Important: Use data-only messages, no notification payload
    // This ensures content-free silent notifications
    console.log(`[FCM] Sending to ${token.slice(0, 20)}...`, payload.type);

    // Example implementation:
    // const message = {
    //   token,
    //   data: { type: payload.type },
    //   android: { priority: 'high' },
    // };
    // await admin.messaging().send(message);

    return true; // Stub
  }

  private async sendApnsNotification(
    token: string,
    payload: PushPayload,
  ): Promise<boolean> {
    // TODO: Implement APNS
    // Use content-available: 1 for silent background notifications
    console.log(`[APNS] Sending to ${token.slice(0, 20)}...`, payload.type);

    // Example implementation:
    // const notification = {
    //   aps: { 'content-available': 1 },
    //   type: payload.type,
    // };

    return true; // Stub
  }

  private async sendUnifiedPushNotification(
    endpoint: string,
    token: string,
    payload: PushPayload,
  ): Promise<boolean> {
    // UnifiedPush: POST to endpoint with minimal payload
    try {
      console.log(`[UnifiedPush] Sending to ${endpoint}`, payload.type);

      // Example implementation:
      // await fetch(endpoint, {
      //   method: 'POST',
      //   headers: { 'Content-Type': 'application/octet-stream' },
      //   body: JSON.stringify({ type: payload.type }),
      // });

      return true;
    } catch {
      return false;
    }
  }
}
