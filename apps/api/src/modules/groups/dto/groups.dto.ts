import {
  IsString,
  IsNotEmpty,
  IsArray,
  IsUUID,
  IsOptional,
  IsInt,
  ValidateNested,
  Min,
  Max,
  IsEnum,
} from 'class-validator';
import { Type } from 'class-transformer';

// =============================================================================
// Enums
// =============================================================================

export enum GroupRole {
  ADMIN = 'admin',
  MEMBER = 'member',
}

export enum MlsContentType {
  APPLICATION = 'application',
  PROPOSAL = 'proposal',
  COMMIT = 'commit',
  WELCOME = 'welcome',
}

// =============================================================================
// Key Packages
// =============================================================================

export class KeyPackageDto {
  @IsString()
  @IsNotEmpty()
  keyPackage: string; // Base64 serialized MLS KeyPackage

  @IsString()
  @IsNotEmpty()
  keyPackageRef: string; // Hash for deduplication
}

export class UploadKeyPackagesDto {
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => KeyPackageDto)
  keyPackages: KeyPackageDto[];
}

export class KeyPackageResponseDto {
  keyPackageRef: string;
  keyPackage: string;
  userId: string;
  deviceId: string;
}

// =============================================================================
// Group CRUD
// =============================================================================

export class CreateGroupDto {
  @IsString()
  @IsNotEmpty()
  groupId: string; // MLS group_id (Base64, client-generated)

  @IsString()
  @IsOptional()
  name?: string; // Encrypted group name

  @IsInt()
  @Min(1)
  @Max(65535)
  cipherSuite: number; // MLS cipher suite ID

  @IsArray()
  @IsUUID('4', { each: true })
  initialMemberUserIds: string[]; // Initial members to add
}

export class GroupResponseDto {
  id: string;
  groupId: string;
  name?: string;
  creatorUserId: string;
  epoch: number;
  cipherSuite: number;
  createdAt: Date;
  updatedAt: Date;
  memberCount: number;
}

export class GroupDetailResponseDto extends GroupResponseDto {
  members: GroupMemberResponseDto[];
}

export class GroupMemberResponseDto {
  userId: string;
  deviceId: string;
  leafNodeIndex: number;
  role: GroupRole;
  joinedAt: Date;
}

// =============================================================================
// Member Management
// =============================================================================

export class WelcomeMessageDto {
  @IsUUID('4')
  userId: string;

  @IsUUID('4')
  deviceId: string;

  @IsString()
  @IsNotEmpty()
  welcome: string; // Base64 MLS Welcome message
}

export class AddMembersDto {
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => MemberKeyPackageRefDto)
  members: MemberKeyPackageRefDto[];

  @IsString()
  @IsNotEmpty()
  commit: string; // Base64 MLS Commit message

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => WelcomeMessageDto)
  welcomes: WelcomeMessageDto[];

  @IsInt()
  newEpoch: number;
}

export class MemberKeyPackageRefDto {
  @IsUUID('4')
  userId: string;

  @IsString()
  @IsNotEmpty()
  keyPackageRef: string;
}

export class RemoveMemberDto {
  @IsString()
  @IsNotEmpty()
  commit: string; // Base64 MLS Commit message

  @IsInt()
  newEpoch: number;
}

// =============================================================================
// Group Messaging
// =============================================================================

export class SendGroupMessageDto {
  @IsString()
  @IsNotEmpty()
  ciphertext: string; // Base64 MLS message

  @IsEnum(MlsContentType)
  contentType: MlsContentType;

  @IsInt()
  epoch: number;

  @IsString()
  @IsNotEmpty()
  clientMessageId: string; // For idempotency
}

export class GroupMessageResponseDto {
  serverMessageId: string;
  groupId: string;
  epoch: number;
  contentType: MlsContentType;
  senderUserId?: string;
  senderDeviceId?: string;
  ciphertext: string;
  sentAt: Date;
  receivedAt: Date;
}

export class PendingGroupMessagesResponseDto {
  messages: GroupMessageResponseDto[];
  hasMore: boolean;
}

export class AckGroupMessagesDto {
  @IsArray()
  @IsUUID('4', { each: true })
  serverMessageIds: string[];
}

// =============================================================================
// Query Parameters
// =============================================================================

export class GetPendingMessagesQueryDto {
  @IsOptional()
  @IsInt()
  @Min(1)
  @Max(100)
  @Type(() => Number)
  limit?: number = 100;

  @IsOptional()
  @IsInt()
  @Min(0)
  @Max(30)
  @Type(() => Number)
  waitSeconds?: number = 0;
}
