import {
  Injectable,
  BadRequestException,
  NotFoundException,
  ConflictException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  RequestExportDto,
  ExportStatusDto,
  ExportFormat,
  DeleteAccountDto,
  DeletionStatusDto,
  ExportData,
} from './dto/privacy.dto';
import { randomBytes } from 'crypto';

@Injectable()
export class PrivacyService {
  private readonly homeServer: string;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly config: ConfigService,
  ) {
    this.homeServer = this.config.get('HOME_SERVER', 'ikincikanal.com');
  }

  // ==========================================================================
  // Data Export (GDPR Article 20 - Right to Data Portability)
  // ==========================================================================

  async requestExport(
    userId: string,
    dto: RequestExportDto,
  ): Promise<ExportStatusDto> {
    // Check for existing pending export
    const existingExport = await this.redis.get(`export:pending:${userId}`);
    if (existingExport) {
      throw new ConflictException(
        'Export already in progress. Please wait for it to complete.',
      );
    }

    const exportId = randomBytes(16).toString('hex');
    const now = new Date();

    // Store export request
    const exportRequest = {
      exportId,
      userId,
      status: 'pending',
      format: dto.format || ExportFormat.JSON,
      requestedAt: now.toISOString(),
    };

    await this.redis.setex(
      `export:pending:${userId}`,
      3600, // 1 hour TTL
      JSON.stringify(exportRequest),
    );

    // Queue export job (in production, this would be a background job)
    // For now, we'll process immediately
    this.processExport(userId, exportId, dto.format || ExportFormat.JSON);

    return {
      exportId,
      status: 'pending',
      format: dto.format || ExportFormat.JSON,
      requestedAt: now,
    };
  }

  async getExportStatus(
    userId: string,
    exportId: string,
  ): Promise<ExportStatusDto> {
    // Check pending
    const pending = await this.redis.get(`export:pending:${userId}`);
    if (pending) {
      const data = JSON.parse(pending);
      if (data.exportId === exportId) {
        return {
          exportId: data.exportId,
          status: data.status,
          format: data.format,
          requestedAt: new Date(data.requestedAt),
          completedAt: data.completedAt ? new Date(data.completedAt) : undefined,
          expiresAt: data.expiresAt ? new Date(data.expiresAt) : undefined,
          downloadUrl: data.downloadUrl,
        };
      }
    }

    // Check completed
    const completed = await this.redis.get(
      `export:ready:${userId}:${exportId}`,
    );
    if (completed) {
      const data = JSON.parse(completed);
      return {
        exportId: data.exportId,
        status: 'ready',
        format: data.format,
        requestedAt: new Date(data.requestedAt),
        completedAt: new Date(data.completedAt),
        expiresAt: new Date(data.expiresAt),
        downloadUrl: data.downloadUrl,
      };
    }

    throw new NotFoundException('Export not found');
  }

  private async processExport(
    userId: string,
    exportId: string,
    format: ExportFormat,
  ): Promise<void> {
    try {
      // Update status to processing
      const pendingKey = `export:pending:${userId}`;
      const pendingData = await this.redis.get(pendingKey);
      if (pendingData) {
        const data = JSON.parse(pendingData);
        data.status = 'processing';
        await this.redis.setex(pendingKey, 3600, JSON.stringify(data));
      }

      // Gather user data
      const exportData = await this.gatherUserData(userId);

      // In production, this would:
      // 1. Write to S3/MinIO with signed URL
      // 2. Encrypt with user's public key
      // For now, we'll store in Redis temporarily

      const now = new Date();
      const expiresAt = new Date(now.getTime() + 24 * 60 * 60 * 1000); // 24 hours

      const completedExport = {
        exportId,
        userId,
        status: 'ready',
        format,
        requestedAt: pendingData
          ? JSON.parse(pendingData).requestedAt
          : now.toISOString(),
        completedAt: now.toISOString(),
        expiresAt: expiresAt.toISOString(),
        downloadUrl: `/privacy/export/${exportId}/download`,
        data: exportData,
      };

      // Store completed export (24 hour TTL)
      await this.redis.setex(
        `export:ready:${userId}:${exportId}`,
        86400,
        JSON.stringify(completedExport),
      );

      // Remove pending marker
      await this.redis.del(pendingKey);
    } catch (error) {
      console.error(`[Privacy] Export failed for user ${userId}:`, error);

      // Mark as failed
      const pendingKey = `export:pending:${userId}`;
      const pendingData = await this.redis.get(pendingKey);
      if (pendingData) {
        const data = JSON.parse(pendingData);
        data.status = 'failed';
        data.errorMessage = 'Export processing failed';
        await this.redis.setex(pendingKey, 3600, JSON.stringify(data));
      }
    }
  }

  private async gatherUserData(userId: string): Promise<ExportData> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      include: {
        devices: {
          select: {
            id: true,
            deviceName: true,
            createdAt: true,
            lastActiveAt: true,
            revokedAt: true,
          },
        },
      },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    // Count keys (don't export actual key material)
    const [identityKeys, signedPreKeys, oneTimePreKeys] = await Promise.all([
      this.prisma.device.count({ where: { userId } }),
      this.prisma.signedPrekey.count({
        where: { device: { userId } },
      }),
      this.prisma.oneTimePrekey.count({
        where: { device: { userId } },
      }),
    ]);

    // Count messages (we don't store content, just metadata for delivery)
    const [sentCount, receivedCount] = await Promise.all([
      this.prisma.messageQueue.count({ where: { fromUserId: userId } }),
      this.prisma.messageQueue.count({ where: { toUserId: userId } }),
    ]);

    return {
      account: {
        userId: user.id,
        handle: user.handle,
        fullHandle: user.fullHandle,
        displayName: user.displayName,
        createdAt: user.createdAt,
      },
      devices: user.devices
        .filter((d) => !d.revokedAt)
        .map((d) => ({
          deviceId: d.id,
          name: d.deviceName,
          platform: 'unknown', // Platform not stored in schema
          registeredAt: d.createdAt,
          lastActiveAt: d.lastActiveAt,
        })),
      keys: {
        identityKeys,
        signedPreKeys,
        oneTimePreKeys,
      },
      contacts: [], // Contacts not implemented in current schema
      messageStats: {
        totalSent: sentCount,
        totalReceived: receivedCount,
      },
      exportedAt: new Date(),
    };
  }

  async downloadExport(
    userId: string,
    exportId: string,
  ): Promise<{ data: ExportData; format: ExportFormat }> {
    const completed = await this.redis.get(
      `export:ready:${userId}:${exportId}`,
    );

    if (!completed) {
      throw new NotFoundException('Export not found or expired');
    }

    const exportData = JSON.parse(completed);
    return {
      data: exportData.data,
      format: exportData.format,
    };
  }

  // ==========================================================================
  // Account Deletion (GDPR Article 17 - Right to Erasure)
  // ==========================================================================

  async requestAccountDeletion(
    userId: string,
    dto: DeleteAccountDto,
  ): Promise<DeletionStatusDto> {
    // Verify confirmation phrase
    if (dto.confirmation !== 'DELETE MY ACCOUNT') {
      throw new BadRequestException(
        'Invalid confirmation. Please type "DELETE MY ACCOUNT" exactly.',
      );
    }

    // Check for existing deletion request
    const existingDeletion = await this.redis.get(
      `deletion:scheduled:${userId}`,
    );
    if (existingDeletion) {
      const data = JSON.parse(existingDeletion);
      return {
        status: 'scheduled',
        scheduledAt: new Date(data.scheduledAt),
        executeAt: new Date(data.executeAt),
        canCancel: true,
      };
    }

    const now = new Date();
    const executeAt = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000); // 7 days grace period

    const deletionRequest = {
      userId,
      status: 'scheduled',
      scheduledAt: now.toISOString(),
      executeAt: executeAt.toISOString(),
    };

    // Store deletion request (8 days TTL - 7 days grace + 1 day buffer)
    await this.redis.setex(
      `deletion:scheduled:${userId}`,
      8 * 24 * 60 * 60,
      JSON.stringify(deletionRequest),
    );

    // In production, queue a job to execute deletion after grace period
    console.log(
      `[Privacy] Account deletion scheduled for user ${userId} at ${executeAt}`,
    );

    return {
      status: 'scheduled',
      scheduledAt: now,
      executeAt,
      canCancel: true,
    };
  }

  async getDeletionStatus(userId: string): Promise<DeletionStatusDto | null> {
    const scheduled = await this.redis.get(`deletion:scheduled:${userId}`);

    if (!scheduled) {
      return null;
    }

    const data = JSON.parse(scheduled);
    const executeAt = new Date(data.executeAt);
    const canCancel = executeAt > new Date();

    return {
      status: data.status,
      scheduledAt: new Date(data.scheduledAt),
      executeAt,
      canCancel,
    };
  }

  async cancelAccountDeletion(userId: string): Promise<{ cancelled: boolean }> {
    const scheduled = await this.redis.get(`deletion:scheduled:${userId}`);

    if (!scheduled) {
      throw new NotFoundException('No deletion request found');
    }

    const data = JSON.parse(scheduled);
    const executeAt = new Date(data.executeAt);

    if (executeAt <= new Date()) {
      throw new BadRequestException(
        'Deletion can no longer be cancelled. Grace period has expired.',
      );
    }

    await this.redis.del(`deletion:scheduled:${userId}`);

    console.log(`[Privacy] Account deletion cancelled for user ${userId}`);

    return { cancelled: true };
  }

  async executeAccountDeletion(userId: string): Promise<void> {
    console.log(`[Privacy] Executing account deletion for user ${userId}`);

    // Get user info for federation notification
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
    });

    if (!user) {
      return; // Already deleted
    }

    // Delete in order (respecting foreign keys)
    await this.prisma.$transaction(async (tx) => {
      // 1. Delete push tokens
      await tx.pushToken.deleteMany({ where: { userId } });

      // 2. Delete one-time prekeys
      await tx.oneTimePrekey.deleteMany({
        where: { device: { userId } },
      });

      // 3. Delete signed prekeys
      await tx.signedPrekey.deleteMany({
        where: { device: { userId } },
      });

      // 4. Delete devices
      await tx.device.deleteMany({ where: { userId } });

      // 5. Delete refresh tokens
      await tx.refreshToken.deleteMany({ where: { userId } });

      // 6. Delete message queue entries
      await tx.messageQueue.deleteMany({
        where: { OR: [{ toUserId: userId }, { fromUserId: userId }] },
      });

      // 7. Delete passkeys
      await tx.passkey.deleteMany({ where: { userId } });

      // 8. Delete delivery tokens
      await tx.deliveryToken.deleteMany({ where: { userId } });

      // 9. Delete call events
      await tx.callEvent.deleteMany({
        where: { OR: [{ fromUserId: userId }, { toUserId: userId }] },
      });

      // 10. Delete the user
      await tx.user.delete({ where: { id: userId } });
    });

    // Clean up Redis
    await Promise.all([
      this.redis.del(`deletion:scheduled:${userId}`),
      this.redis.del(`export:pending:${userId}`),
    ]);

    console.log(`[Privacy] Account deletion completed for user ${userId}`);

    // In production, notify federated servers about deletion
    // await this.federationService.broadcastUserDeleted(user.fullHandle);
  }

  // ==========================================================================
  // Privacy Settings
  // ==========================================================================

  async getPrivacySettings(userId: string): Promise<any> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: {
        id: true,
        settings: true,
      },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    // Extract privacy settings from user settings JSON
    const settings = (user.settings as Record<string, unknown>) || {};

    return {
      allowAnalytics: settings.allowAnalytics ?? false,
      allowCrashReports: settings.allowCrashReports ?? false,
      shareProfileWithFederation: settings.shareProfileWithFederation ?? true,
    };
  }

  async updatePrivacySettings(userId: string, settings: any): Promise<any> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { settings: true },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    const currentSettings = (user.settings as Record<string, unknown>) || {};
    const updatedSettings = {
      ...currentSettings,
      allowAnalytics: settings.allowAnalytics ?? currentSettings.allowAnalytics,
      allowCrashReports:
        settings.allowCrashReports ?? currentSettings.allowCrashReports,
      shareProfileWithFederation:
        settings.shareProfileWithFederation ??
        currentSettings.shareProfileWithFederation,
    };

    await this.prisma.user.update({
      where: { id: userId },
      data: { settings: updatedSettings },
    });

    return {
      ...settings,
      updatedAt: new Date(),
    };
  }
}
