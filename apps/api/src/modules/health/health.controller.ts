import { Controller, Get } from '@nestjs/common';
import { HealthService, HealthStatus, Metrics } from './health.service';

@Controller('health')
export class HealthController {
  constructor(private readonly healthService: HealthService) {}

  /**
   * GET /health
   * Basic health check
   */
  @Get()
  async check(): Promise<HealthStatus> {
    return this.healthService.check();
  }

  /**
   * GET /health/ready
   * Readiness probe - checks all dependencies
   */
  @Get('ready')
  async ready(): Promise<HealthStatus> {
    return this.healthService.checkReadiness();
  }

  /**
   * GET /health/live
   * Liveness probe - just confirms process is running
   */
  @Get('live')
  async live(): Promise<{ status: string; timestamp: string }> {
    return { status: 'ok', timestamp: new Date().toISOString() };
  }

  /**
   * GET /health/metrics
   * Basic metrics for monitoring
   */
  @Get('metrics')
  async metrics(): Promise<Metrics> {
    return this.healthService.getMetrics();
  }
}
