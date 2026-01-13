import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  UploadKeysDto,
  KeyCountResponseDto,
  PreKeyBundleResponseDto,
  DeviceBundlesResponseDto,
} from './dto/keys.dto';

@Injectable()
export class KeysService {
  constructor(private readonly prisma: PrismaService) {}

  /**
   * Upload keys for a device
   * Can upload new signed prekey and/or one-time prekeys
   */
  async uploadKeys(
    userId: string,
    deviceId: string,
    dto: UploadKeysDto,
  ): Promise<void> {
    // Verify device belongs to user and is active
    const device = await this.prisma.device.findFirst({
      where: { id: deviceId, userId, revokedAt: null },
    });

    if (!device) {
      throw new NotFoundException('Device not found or revoked');
    }

    await this.prisma.$transaction(async (tx) => {
      // Update signed prekey if provided
      if (dto.signedPreKey) {
        // Delete existing signed prekey (only one active at a time)
        await tx.signedPrekey.deleteMany({
          where: { deviceId },
        });

        // Create new signed prekey
        await tx.signedPrekey.create({
          data: {
            deviceId,
            keyId: dto.signedPreKey.keyId,
            publicKey: dto.signedPreKey.publicKey,
            signature: dto.signedPreKey.signature,
          },
        });
      }

      // Add one-time prekeys if provided
      if (dto.oneTimePreKeys && dto.oneTimePreKeys.length > 0) {
        await tx.oneTimePrekey.createMany({
          data: dto.oneTimePreKeys.map((pk) => ({
            deviceId,
            keyId: pk.keyId,
            publicKey: pk.publicKey,
          })),
          skipDuplicates: true, // Ignore duplicates
        });
      }
    });
  }

  /**
   * Get count of available one-time prekeys for a device
   */
  async getKeyCount(
    userId: string,
    deviceId: string,
  ): Promise<KeyCountResponseDto> {
    // Verify device belongs to user
    const device = await this.prisma.device.findFirst({
      where: { id: deviceId, userId, revokedAt: null },
    });

    if (!device) {
      throw new NotFoundException('Device not found or revoked');
    }

    const count = await this.prisma.oneTimePrekey.count({
      where: { deviceId, consumedAt: null },
    });

    return { count, deviceId };
  }

  /**
   * Get prekey bundle for a specific device
   * Consumes one one-time prekey atomically
   */
  async getPreKeyBundle(
    targetUserId: string,
    targetDeviceId?: string,
  ): Promise<DeviceBundlesResponseDto> {
    // Get all active devices for the user (or specific device)
    const devices = await this.prisma.device.findMany({
      where: {
        userId: targetUserId,
        revokedAt: null,
        ...(targetDeviceId ? { id: targetDeviceId } : {}),
      },
      include: {
        signedPrekeys: {
          orderBy: { createdAt: 'desc' },
          take: 1,
        },
      },
    });

    if (devices.length === 0) {
      throw new NotFoundException('No active devices found for user');
    }

    const bundles: PreKeyBundleResponseDto[] = [];

    for (const device of devices) {
      if (device.signedPrekeys.length === 0) {
        continue; // Skip devices without signed prekey
      }

      const signedPreKey = device.signedPrekeys[0];

      // Try to consume a one-time prekey atomically
      const oneTimePreKey = await this.consumeOneTimePreKey(device.id);

      bundles.push({
        userId: targetUserId,
        deviceId: device.id,
        registrationId: device.registrationId,
        identityKeyPub: device.identityKeyPub,
        signedPreKey: {
          keyId: signedPreKey.keyId,
          publicKey: signedPreKey.publicKey,
          signature: signedPreKey.signature,
        },
        oneTimePreKey: oneTimePreKey
          ? {
              keyId: oneTimePreKey.keyId,
              publicKey: oneTimePreKey.publicKey,
            }
          : undefined,
      });
    }

    if (bundles.length === 0) {
      throw new NotFoundException('No devices with valid keys found');
    }

    return {
      userId: targetUserId,
      bundles,
    };
  }

  /**
   * Consume a one-time prekey atomically
   * Uses SELECT ... FOR UPDATE SKIP LOCKED for concurrency
   */
  private async consumeOneTimePreKey(deviceId: string): Promise<{
    keyId: number;
    publicKey: string;
  } | null> {
    // Use raw query for atomic consumption with SKIP LOCKED
    const result = await this.prisma.$queryRaw<
      { id: string; key_id: number; public_key: string }[]
    >`
      UPDATE one_time_prekeys
      SET consumed_at = NOW()
      WHERE id = (
        SELECT id FROM one_time_prekeys
        WHERE device_id = ${deviceId}::uuid
          AND consumed_at IS NULL
        ORDER BY created_at ASC
        LIMIT 1
        FOR UPDATE SKIP LOCKED
      )
      RETURNING id, key_id, public_key
    `;

    if (result.length === 0) {
      return null;
    }

    return {
      keyId: result[0].key_id,
      publicKey: result[0].public_key,
    };
  }
}
