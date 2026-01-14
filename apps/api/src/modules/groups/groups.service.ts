import {
  Injectable,
  NotFoundException,
  ForbiddenException,
  BadRequestException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { RedisService } from '../redis/redis.service';
import {
  CreateGroupDto,
  UploadKeyPackagesDto,
  AddMembersDto,
  RemoveMemberDto,
  SendGroupMessageDto,
  AckGroupMessagesDto,
  GetPendingMessagesQueryDto,
  GroupResponseDto,
  GroupDetailResponseDto,
  KeyPackageResponseDto,
  GroupMessageResponseDto,
  PendingGroupMessagesResponseDto,
  GroupRole,
  MlsContentType,
} from './dto/groups.dto';

@Injectable()
export class GroupsService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly redis: RedisService,
  ) {}

  // ==========================================================================
  // Key Packages
  // ==========================================================================

  async uploadKeyPackages(
    userId: string,
    deviceId: string,
    dto: UploadKeyPackagesDto,
  ): Promise<number> {
    // Verify device belongs to user
    const device = await this.prisma.device.findFirst({
      where: { id: deviceId, userId, revokedAt: null },
    });
    if (!device) {
      throw new ForbiddenException('Device not found or revoked');
    }

    // Upload key packages
    const result = await this.prisma.mlsKeyPackage.createMany({
      data: dto.keyPackages.map((kp) => ({
        userId,
        deviceId,
        keyPackage: kp.keyPackage,
        keyPackageRef: kp.keyPackageRef,
      })),
      skipDuplicates: true,
    });

    return result.count;
  }

  async getKeyPackages(userId: string): Promise<KeyPackageResponseDto[]> {
    const keyPackages = await this.prisma.mlsKeyPackage.findMany({
      where: {
        userId,
        consumedAt: null,
      },
      orderBy: { createdAt: 'asc' },
      take: 10, // Limit to 10 per request
    });

    return keyPackages.map((kp) => ({
      keyPackageRef: kp.keyPackageRef,
      keyPackage: kp.keyPackage,
      userId: kp.userId,
      deviceId: kp.deviceId,
    }));
  }

  // ==========================================================================
  // Group CRUD
  // ==========================================================================

  async createGroup(
    userId: string,
    deviceId: string,
    dto: CreateGroupDto,
  ): Promise<GroupResponseDto> {
    // Create group in transaction
    const group = await this.prisma.$transaction(async (tx) => {
      // Create the group
      const newGroup = await tx.mlsGroup.create({
        data: {
          groupId: dto.groupId,
          name: dto.name,
          creatorUserId: userId,
          cipherSuite: dto.cipherSuite,
          epoch: 0,
        },
      });

      // Add creator as admin
      await tx.mlsGroupMember.create({
        data: {
          groupId: newGroup.id,
          userId,
          deviceId,
          leafNodeIndex: 0,
          role: GroupRole.ADMIN,
        },
      });

      return newGroup;
    });

    return {
      id: group.id,
      groupId: group.groupId,
      name: group.name ?? undefined,
      creatorUserId: group.creatorUserId,
      epoch: Number(group.epoch),
      cipherSuite: group.cipherSuite,
      createdAt: group.createdAt,
      updatedAt: group.updatedAt,
      memberCount: 1,
    };
  }

  async listGroups(userId: string): Promise<GroupResponseDto[]> {
    const memberships = await this.prisma.mlsGroupMember.findMany({
      where: {
        userId,
        removedAt: null,
      },
      include: {
        group: {
          include: {
            _count: {
              select: { members: { where: { removedAt: null } } },
            },
          },
        },
      },
    });

    return memberships.map((m) => ({
      id: m.group.id,
      groupId: m.group.groupId,
      name: m.group.name ?? undefined,
      creatorUserId: m.group.creatorUserId,
      epoch: Number(m.group.epoch),
      cipherSuite: m.group.cipherSuite,
      createdAt: m.group.createdAt,
      updatedAt: m.group.updatedAt,
      memberCount: m.group._count.members,
    }));
  }

  async getGroup(userId: string, groupId: string): Promise<GroupDetailResponseDto> {
    // Verify user is a member
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
      },
      include: {
        group: {
          include: {
            members: {
              where: { removedAt: null },
            },
          },
        },
      },
    });

    if (!membership) {
      throw new NotFoundException('Group not found or you are not a member');
    }

    const group = membership.group;

    return {
      id: group.id,
      groupId: group.groupId,
      name: group.name ?? undefined,
      creatorUserId: group.creatorUserId,
      epoch: Number(group.epoch),
      cipherSuite: group.cipherSuite,
      createdAt: group.createdAt,
      updatedAt: group.updatedAt,
      memberCount: group.members.length,
      members: group.members.map((m) => ({
        userId: m.userId,
        deviceId: m.deviceId,
        leafNodeIndex: m.leafNodeIndex,
        role: m.role as GroupRole,
        joinedAt: m.joinedAt,
      })),
    };
  }

  async leaveGroup(userId: string, deviceId: string, groupId: string): Promise<void> {
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        deviceId,
        removedAt: null,
      },
    });

    if (!membership) {
      throw new NotFoundException('Not a member of this group');
    }

    await this.prisma.mlsGroupMember.update({
      where: { id: membership.id },
      data: { removedAt: new Date() },
    });
  }

  // ==========================================================================
  // Member Management
  // ==========================================================================

  async addMembers(
    userId: string,
    deviceId: string,
    groupId: string,
    dto: AddMembersDto,
  ): Promise<number> {
    // Verify user is admin
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
        role: GroupRole.ADMIN,
      },
      include: { group: true },
    });

    if (!membership) {
      throw new ForbiddenException('Not authorized to add members');
    }

    const group = membership.group;

    // Process in transaction
    await this.prisma.$transaction(async (tx) => {
      // Update group epoch
      await tx.mlsGroup.update({
        where: { id: group.id },
        data: { epoch: dto.newEpoch },
      });

      // Consume key packages and add members
      for (const member of dto.members) {
        const keyPackage = await tx.mlsKeyPackage.findUnique({
          where: { keyPackageRef: member.keyPackageRef },
        });

        if (!keyPackage || keyPackage.consumedAt) {
          throw new BadRequestException(`Invalid key package: ${member.keyPackageRef}`);
        }

        // Mark key package as consumed
        await tx.mlsKeyPackage.update({
          where: { id: keyPackage.id },
          data: {
            consumedAt: new Date(),
            consumedByGroup: group.id,
          },
        });

        // Add member
        await tx.mlsGroupMember.create({
          data: {
            groupId: group.id,
            userId: keyPackage.userId,
            deviceId: keyPackage.deviceId,
            leafNodeIndex: 0, // Would be calculated from MLS tree
            role: GroupRole.MEMBER,
          },
        });
      }

      // Store welcome messages for delivery
      for (const welcome of dto.welcomes) {
        await tx.mlsGroupMessage.create({
          data: {
            groupId: group.id,
            epoch: BigInt(dto.newEpoch),
            senderUserId: userId,
            senderDeviceId: deviceId,
            contentType: MlsContentType.WELCOME,
            ciphertext: welcome.welcome,
            sentAt: new Date(),
            expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000), // 7 days
          },
        });
      }

      // Store commit message
      await tx.mlsGroupMessage.create({
        data: {
          groupId: group.id,
          epoch: BigInt(dto.newEpoch),
          senderUserId: userId,
          senderDeviceId: deviceId,
          contentType: MlsContentType.COMMIT,
          ciphertext: dto.commit,
          sentAt: new Date(),
          expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
        },
      });
    });

    return dto.members.length;
  }

  async removeMember(
    userId: string,
    deviceId: string,
    groupId: string,
    targetUserId: string,
    dto: RemoveMemberDto,
  ): Promise<void> {
    // Verify user is admin
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
        role: GroupRole.ADMIN,
      },
      include: { group: true },
    });

    if (!membership) {
      throw new ForbiddenException('Not authorized to remove members');
    }

    await this.prisma.$transaction(async (tx) => {
      // Update group epoch
      await tx.mlsGroup.update({
        where: { id: membership.group.id },
        data: { epoch: dto.newEpoch },
      });

      // Mark members as removed
      await tx.mlsGroupMember.updateMany({
        where: {
          groupId: membership.group.id,
          userId: targetUserId,
          removedAt: null,
        },
        data: { removedAt: new Date() },
      });

      // Store commit message
      await tx.mlsGroupMessage.create({
        data: {
          groupId: membership.group.id,
          epoch: BigInt(dto.newEpoch),
          senderUserId: userId,
          senderDeviceId: deviceId,
          contentType: MlsContentType.COMMIT,
          ciphertext: dto.commit,
          sentAt: new Date(),
          expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
        },
      });
    });
  }

  // ==========================================================================
  // Group Messaging
  // ==========================================================================

  async sendMessage(
    userId: string,
    deviceId: string,
    groupId: string,
    dto: SendGroupMessageDto,
  ): Promise<GroupMessageResponseDto> {
    // Verify user is a member
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
      },
      include: { group: true },
    });

    if (!membership) {
      throw new ForbiddenException('Not a member of this group');
    }

    // Create message
    const message = await this.prisma.mlsGroupMessage.create({
      data: {
        groupId: membership.group.id,
        epoch: BigInt(dto.epoch),
        senderUserId: userId,
        senderDeviceId: deviceId,
        contentType: dto.contentType,
        ciphertext: dto.ciphertext,
        sentAt: new Date(),
        expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
      },
    });

    // TODO: Notify members via WebSocket

    return {
      serverMessageId: message.serverMessageId,
      groupId: membership.group.groupId,
      epoch: Number(message.epoch),
      contentType: message.contentType as MlsContentType,
      senderUserId: message.senderUserId ?? undefined,
      senderDeviceId: message.senderDeviceId ?? undefined,
      ciphertext: message.ciphertext,
      sentAt: message.sentAt,
      receivedAt: message.receivedAt,
    };
  }

  async getPendingMessages(
    userId: string,
    deviceId: string,
    groupId: string,
    query: GetPendingMessagesQueryDto,
  ): Promise<PendingGroupMessagesResponseDto> {
    // Verify user is a member
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
      },
      include: { group: true },
    });

    if (!membership) {
      throw new ForbiddenException('Not a member of this group');
    }

    const limit = query.limit ?? 100;

    // Get messages not yet delivered to this device
    const messages = await this.prisma.mlsGroupMessage.findMany({
      where: {
        groupId: membership.group.id,
        expiresAt: { gt: new Date() },
        // Exclude messages already delivered to this device
        NOT: {
          id: {
            in: (
              await this.prisma.mlsGroupMessageDelivery.findMany({
                where: { toDeviceId: deviceId, deliveredAt: { not: null } },
                select: { messageId: true },
              })
            ).map((d) => d.messageId),
          },
        },
      },
      orderBy: { receivedAt: 'asc' },
      take: limit + 1,
    });

    const hasMore = messages.length > limit;
    const returnMessages = hasMore ? messages.slice(0, limit) : messages;

    return {
      messages: returnMessages.map((m) => ({
        serverMessageId: m.serverMessageId,
        groupId: membership.group.groupId,
        epoch: Number(m.epoch),
        contentType: m.contentType as MlsContentType,
        senderUserId: m.senderUserId ?? undefined,
        senderDeviceId: m.senderDeviceId ?? undefined,
        ciphertext: m.ciphertext,
        sentAt: m.sentAt,
        receivedAt: m.receivedAt,
      })),
      hasMore,
    };
  }

  async acknowledgeMessages(
    userId: string,
    deviceId: string,
    groupId: string,
    dto: AckGroupMessagesDto,
  ): Promise<void> {
    // Verify user is a member
    const membership = await this.prisma.mlsGroupMember.findFirst({
      where: {
        group: { groupId },
        userId,
        removedAt: null,
      },
    });

    if (!membership) {
      throw new ForbiddenException('Not a member of this group');
    }

    // Mark messages as delivered
    await this.prisma.mlsGroupMessageDelivery.createMany({
      data: dto.serverMessageIds.map((messageId) => ({
        messageId,
        toUserId: userId,
        toDeviceId: deviceId,
        deliveredAt: new Date(),
      })),
      skipDuplicates: true,
    });
  }
}
