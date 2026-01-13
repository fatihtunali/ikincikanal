import {
  Injectable,
  NotFoundException,
  ForbiddenException,
  BadRequestException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as argon2 from 'argon2';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  ResolveUserDto,
  ResolvedUserDto,
  BatchResolveDto,
  BatchResolveResponseDto,
  UserProfileDto,
  UpdateProfileDto,
  ChangePasswordDto,
} from './dto/users.dto';

@Injectable()
export class UsersService {
  private readonly homeServer: string;

  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
    private readonly config: ConfigService,
  ) {
    this.homeServer = this.config.get('HOME_SERVER', 'ikincikanal.com');
  }

  // ==========================================================================
  // User Resolution
  // ==========================================================================

  async resolveUser(
    dto: ResolveUserDto,
    requesterId: string | null,
    ip: string,
  ): Promise<ResolvedUserDto> {
    // Rate limiting
    const ipRate = await this.redis.incrementResolveRateByIp(ip);
    if (ipRate > 10) {
      throw new ForbiddenException('Rate limit exceeded');
    }

    if (requesterId) {
      const userRate = await this.redis.incrementResolveRateByUser(requesterId);
      if (userRate > 100) {
        throw new ForbiddenException('Rate limit exceeded');
      }
    }

    // Parse handle
    const { handle, server } = this.parseHandle(dto.handle);

    // Check if local or remote
    const isLocal = !server || server === this.homeServer;

    if (isLocal) {
      const user = await this.prisma.user.findUnique({
        where: { handle },
        select: {
          id: true,
          handle: true,
          fullHandle: true,
          displayName: true,
          homeServer: true,
        },
      });

      if (!user) {
        throw new NotFoundException('User not found');
      }

      return {
        userId: user.id,
        handle: user.handle,
        fullHandle: user.fullHandle,
        displayName: user.displayName || undefined,
        homeServer: user.homeServer,
        isLocal: true,
      };
    } else {
      // For remote users, we would need to query the federation server
      // For now, return a placeholder that indicates federation needed
      throw new BadRequestException(
        `Federation lookup required for ${server}. Use federation endpoints.`,
      );
    }
  }

  async batchResolve(
    dto: BatchResolveDto,
    requesterId: string | null,
    ip: string,
  ): Promise<BatchResolveResponseDto> {
    // Rate limiting
    const ipRate = await this.redis.incrementResolveRateByIp(ip);
    if (ipRate > 10) {
      throw new ForbiddenException('Rate limit exceeded');
    }

    // Limit batch size
    if (dto.handles.length > 50) {
      throw new BadRequestException('Maximum 50 handles per batch');
    }

    const resolved: ResolvedUserDto[] = [];
    const notFound: string[] = [];

    // Separate local and remote handles
    const localHandles: string[] = [];
    const remoteHandles: string[] = [];

    for (const h of dto.handles) {
      const { handle, server } = this.parseHandle(h);
      if (!server || server === this.homeServer) {
        localHandles.push(handle);
      } else {
        remoteHandles.push(h);
      }
    }

    // Resolve local users
    if (localHandles.length > 0) {
      const users = await this.prisma.user.findMany({
        where: { handle: { in: localHandles } },
        select: {
          id: true,
          handle: true,
          fullHandle: true,
          displayName: true,
          homeServer: true,
        },
      });

      const foundHandles = new Set(users.map((u) => u.handle));

      for (const user of users) {
        resolved.push({
          userId: user.id,
          handle: user.handle,
          fullHandle: user.fullHandle,
          displayName: user.displayName || undefined,
          homeServer: user.homeServer,
          isLocal: true,
        });
      }

      for (const h of localHandles) {
        if (!foundHandles.has(h)) {
          notFound.push(h);
        }
      }
    }

    // Remote handles need federation (mark as not found for now)
    notFound.push(...remoteHandles);

    return { resolved, notFound };
  }

  // ==========================================================================
  // User Profile
  // ==========================================================================

  async getProfile(userId: string): Promise<UserProfileDto> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    return {
      userId: user.id,
      handle: user.handle,
      fullHandle: user.fullHandle,
      displayName: user.displayName || undefined,
      homeServer: user.homeServer,
      status: user.status,
      createdAt: user.createdAt,
      settings: user.settings as Record<string, any>,
      acceptedPrivacyVersion: user.acceptedPrivacyVersion || undefined,
    };
  }

  async updateProfile(
    userId: string,
    dto: UpdateProfileDto,
  ): Promise<UserProfileDto> {
    const updateData: any = {};

    if (dto.displayName !== undefined) {
      updateData.displayName = dto.displayName;
    }
    if (dto.settings !== undefined) {
      updateData.settings = dto.settings;
    }
    if (dto.acceptedPrivacyVersion !== undefined) {
      updateData.acceptedPrivacyVersion = dto.acceptedPrivacyVersion;
    }

    const user = await this.prisma.user.update({
      where: { id: userId },
      data: updateData,
    });

    return {
      userId: user.id,
      handle: user.handle,
      fullHandle: user.fullHandle,
      displayName: user.displayName || undefined,
      homeServer: user.homeServer,
      status: user.status,
      createdAt: user.createdAt,
      settings: user.settings as Record<string, any>,
      acceptedPrivacyVersion: user.acceptedPrivacyVersion || undefined,
    };
  }

  async changePassword(userId: string, dto: ChangePasswordDto): Promise<void> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
    });

    if (!user) {
      throw new NotFoundException('User not found');
    }

    if (!user.passwordHash) {
      throw new BadRequestException(
        'Cannot change password for passkey-only account',
      );
    }

    // Verify current password
    const valid = await argon2.verify(user.passwordHash, dto.currentPassword);
    if (!valid) {
      throw new ForbiddenException('Current password is incorrect');
    }

    // Hash new password
    const newHash = await argon2.hash(dto.newPassword, {
      type: argon2.argon2id,
      memoryCost: this.config.get('ARGON2_MEMORY_COST', 65536),
      timeCost: this.config.get('ARGON2_TIME_COST', 3),
      parallelism: this.config.get('ARGON2_PARALLELISM', 4),
    });

    await this.prisma.user.update({
      where: { id: userId },
      data: { passwordHash: newHash },
    });
  }

  // ==========================================================================
  // Helper Methods
  // ==========================================================================

  private parseHandle(input: string): { handle: string; server: string | null } {
    // Remove leading @ if present
    const clean = input.startsWith('@') ? input.slice(1) : input;

    if (clean.includes('@')) {
      const [handle, server] = clean.split('@');
      return { handle, server };
    }

    return { handle: clean, server: null };
  }
}
