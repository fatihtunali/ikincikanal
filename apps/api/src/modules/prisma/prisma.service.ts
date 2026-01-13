import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  async onModuleInit() {
    await this.$connect();
  }

  async onModuleDestroy() {
    await this.$disconnect();
  }

  /**
   * Clean expired messages from queue
   * Should be called by a cron job every minute
   */
  async cleanExpiredMessages() {
    return this.messageQueue.deleteMany({
      where: { expiresAt: { lt: new Date() } },
    });
  }

  /**
   * Clean expired call events
   * Should be called by a cron job every minute
   */
  async cleanExpiredCallEvents() {
    return this.callEvent.deleteMany({
      where: { expiresAt: { lt: new Date() } },
    });
  }

  /**
   * Clean expired delivery tokens
   * Should be called by a cron job every 5 minutes
   */
  async cleanExpiredDeliveryTokens() {
    return this.deliveryToken.deleteMany({
      where: { expiresAt: { lt: new Date() } },
    });
  }

  /**
   * Clean consumed one-time prekeys older than 24 hours
   * Should be called by a cron job every hour
   */
  async cleanConsumedPrekeys() {
    const cutoff = new Date(Date.now() - 24 * 60 * 60 * 1000);
    return this.oneTimePrekey.deleteMany({
      where: {
        consumedAt: { lt: cutoff },
      },
    });
  }

  /**
   * Clean expired refresh tokens
   * Should be called by a cron job every hour
   */
  async cleanExpiredRefreshTokens() {
    return this.refreshToken.deleteMany({
      where: { expiresAt: { lt: new Date() } },
    });
  }
}
