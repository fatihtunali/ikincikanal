import {
  Injectable,
  NotFoundException,
  ForbiddenException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  DeviceResponseDto,
  DeviceListResponseDto,
  RevocationReason,
  RevokeAllResponseDto,
} from './dto/device.dto';

@Injectable()
export class DevicesService {
  constructor(private readonly prisma: PrismaService) {}

  /**
   * Get all devices for a user
   */
  async getDevices(
    userId: string,
    currentDeviceId: string,
  ): Promise<DeviceListResponseDto> {
    const devices = await this.prisma.device.findMany({
      where: { userId },
      orderBy: { lastActiveAt: 'desc' },
    });

    return {
      devices: devices.map((d) => this.toDeviceResponse(d)),
      currentDeviceId,
    };
  }

  /**
   * Get a specific device
   */
  async getDevice(userId: string, deviceId: string): Promise<DeviceResponseDto> {
    const device = await this.prisma.device.findFirst({
      where: { id: deviceId, userId },
    });

    if (!device) {
      throw new NotFoundException('Device not found');
    }

    return this.toDeviceResponse(device);
  }

  /**
   * Revoke a specific device
   */
  async revokeDevice(
    userId: string,
    deviceId: string,
    currentDeviceId: string,
    reason: RevocationReason = RevocationReason.USER_INITIATED,
  ): Promise<void> {
    // Cannot revoke current device with this endpoint
    if (deviceId === currentDeviceId) {
      throw new ForbiddenException(
        'Cannot revoke current device. Use /devices/revoke-all-including-current instead.',
      );
    }

    const device = await this.prisma.device.findFirst({
      where: { id: deviceId, userId, revokedAt: null },
    });

    if (!device) {
      throw new NotFoundException('Device not found or already revoked');
    }

    await this.prisma.$transaction([
      // Revoke device
      this.prisma.device.update({
        where: { id: deviceId },
        data: {
          revokedAt: new Date(),
          revocationReason: reason,
        },
      }),
      // Revoke all refresh tokens for this device
      this.prisma.refreshToken.updateMany({
        where: { deviceId, revokedAt: null },
        data: { revokedAt: new Date() },
      }),
    ]);
  }

  /**
   * Revoke all other devices (keep current)
   */
  async revokeAllOther(
    userId: string,
    currentDeviceId: string,
  ): Promise<RevokeAllResponseDto> {
    const result = await this.prisma.$transaction(async (tx) => {
      // Get count of devices to revoke
      const devices = await tx.device.findMany({
        where: {
          userId,
          revokedAt: null,
          NOT: { id: currentDeviceId },
        },
        select: { id: true },
      });

      const deviceIds = devices.map((d) => d.id);

      if (deviceIds.length === 0) {
        return 0;
      }

      // Revoke devices
      await tx.device.updateMany({
        where: { id: { in: deviceIds } },
        data: {
          revokedAt: new Date(),
          revocationReason: RevocationReason.USER_INITIATED,
        },
      });

      // Revoke all refresh tokens for these devices
      await tx.refreshToken.updateMany({
        where: { deviceId: { in: deviceIds }, revokedAt: null },
        data: { revokedAt: new Date() },
      });

      return deviceIds.length;
    });

    return {
      revokedCount: result,
      message: `Revoked ${result} device(s)`,
    };
  }

  /**
   * Revoke all devices including current (emergency/nuke)
   */
  async revokeAllIncludingCurrent(
    userId: string,
    reason: RevocationReason = RevocationReason.USER_INITIATED,
  ): Promise<RevokeAllResponseDto> {
    const result = await this.prisma.$transaction(async (tx) => {
      // Get count of active devices
      const count = await tx.device.count({
        where: { userId, revokedAt: null },
      });

      // Revoke all devices
      await tx.device.updateMany({
        where: { userId, revokedAt: null },
        data: {
          revokedAt: new Date(),
          revocationReason: reason,
        },
      });

      // Revoke all refresh tokens
      await tx.refreshToken.updateMany({
        where: { userId, revokedAt: null },
        data: { revokedAt: new Date() },
      });

      return count;
    });

    return {
      revokedCount: result,
      message: `Revoked ${result} device(s) including current`,
    };
  }

  private toDeviceResponse(device: any): DeviceResponseDto {
    return {
      id: device.id,
      deviceName: device.deviceName,
      registrationId: device.registrationId,
      createdAt: device.createdAt,
      lastActiveAt: device.lastActiveAt,
      revokedAt: device.revokedAt || undefined,
      revocationReason: device.revocationReason || undefined,
    };
  }
}
