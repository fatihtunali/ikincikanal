import {
  IsString,
  IsOptional,
  IsArray,
  MaxLength,
  MinLength,
  Matches,
} from 'class-validator';

/**
 * Resolve user request
 */
export class ResolveUserDto {
  @IsString()
  @MinLength(3)
  @MaxLength(128)
  handle: string; // Can be "username" or "username@server.com"
}

/**
 * Resolved user info (public)
 */
export class ResolvedUserDto {
  userId: string;
  handle: string;
  fullHandle: string;
  displayName?: string;
  homeServer: string;
  isLocal: boolean;
}

/**
 * Batch resolve request
 */
export class BatchResolveDto {
  @IsArray()
  @IsString({ each: true })
  handles: string[];
}

/**
 * Batch resolve response
 */
export class BatchResolveResponseDto {
  resolved: ResolvedUserDto[];
  notFound: string[];
}

/**
 * User profile (own profile)
 */
export class UserProfileDto {
  userId: string;
  handle: string;
  fullHandle: string;
  displayName?: string;
  homeServer: string;
  status: string;
  createdAt: Date;
  settings: Record<string, any>;
  acceptedPrivacyVersion?: string;
}

/**
 * Update profile request
 */
export class UpdateProfileDto {
  @IsString()
  @IsOptional()
  @MaxLength(64)
  displayName?: string;

  @IsOptional()
  settings?: Record<string, any>;

  @IsString()
  @IsOptional()
  @MaxLength(20)
  acceptedPrivacyVersion?: string;
}

/**
 * Change password request
 */
export class ChangePasswordDto {
  @IsString()
  @MinLength(1)
  currentPassword: string;

  @IsString()
  @MinLength(8)
  newPassword: string;
}
