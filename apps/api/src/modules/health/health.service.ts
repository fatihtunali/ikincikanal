import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import { MessagesGateway } from '../messages/messages.gateway';

export interface HealthStatus {
  status: 'ok' | 'degraded' | 'error';
  timestamp: string;
  version: string;
  uptime: number;
  checks?: Record<string, { status: string; latency?: number; error?: string }>;
}

export interface Metrics {
  timestamp: string;
  uptime: number;
  memory: {
    heapUsed: number;
    heapTotal: number;
    external: number;
    rss: number;
  };
  connections: {
    websocket: number;
  };
}

@Injectable()
export class HealthService {
  private readonly startTime = Date.now();
  private readonly version = process.env.npm_package_version || '0.0.1';

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly messagesGateway: MessagesGateway,
  ) {}

  async check(): Promise<HealthStatus> {
    return {
      status: 'ok',
      timestamp: new Date().toISOString(),
      version: this.version,
      uptime: this.getUptime(),
    };
  }

  async checkReadiness(): Promise<HealthStatus> {
    const checks: Record<string, { status: string; latency?: number; error?: string }> = {};
    let overallStatus: 'ok' | 'degraded' | 'error' = 'ok';

    // Check PostgreSQL
    const dbCheck = await this.checkDatabase();
    checks.database = dbCheck;
    if (dbCheck.status !== 'ok') {
      overallStatus = 'error';
    }

    // Check Redis
    const redisCheck = await this.checkRedis();
    checks.redis = redisCheck;
    if (redisCheck.status !== 'ok') {
      overallStatus = overallStatus === 'error' ? 'error' : 'degraded';
    }

    return {
      status: overallStatus,
      timestamp: new Date().toISOString(),
      version: this.version,
      uptime: this.getUptime(),
      checks,
    };
  }

  private async checkDatabase(): Promise<{ status: string; latency?: number; error?: string }> {
    const start = Date.now();
    try {
      await this.prisma.$queryRaw`SELECT 1`;
      return { status: 'ok', latency: Date.now() - start };
    } catch (error) {
      return { status: 'error', error: (error as Error).message };
    }
  }

  private async checkRedis(): Promise<{ status: string; latency?: number; error?: string }> {
    const start = Date.now();
    try {
      await this.redis.ping();
      return { status: 'ok', latency: Date.now() - start };
    } catch (error) {
      return { status: 'error', error: (error as Error).message };
    }
  }

  async getMetrics(): Promise<Metrics> {
    const memoryUsage = process.memoryUsage();

    return {
      timestamp: new Date().toISOString(),
      uptime: this.getUptime(),
      memory: {
        heapUsed: memoryUsage.heapUsed,
        heapTotal: memoryUsage.heapTotal,
        external: memoryUsage.external,
        rss: memoryUsage.rss,
      },
      connections: {
        websocket: this.messagesGateway.getOnlineDeviceCount(),
      },
    };
  }

  private getUptime(): number {
    return Math.floor((Date.now() - this.startTime) / 1000);
  }
}
