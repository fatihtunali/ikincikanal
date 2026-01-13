import {
  IsString,
  IsEnum,
  IsOptional,
  IsNotEmpty,
  MaxLength,
} from 'class-validator';

export enum PushProvider {
  FCM = 'fcm',
  APNS = 'apns',
  UNIFIED_PUSH = 'unified_push',
}

/**
 * Register push token request
 */
export class RegisterPushTokenDto {
  @IsEnum(PushProvider)
  provider: PushProvider;

  @IsString()
  @IsNotEmpty()
  token: string;

  @IsString()
  @IsOptional()
  endpoint?: string; // For UnifiedPush

  @IsString()
  @IsOptional()
  @MaxLength(255)
  appBundleId?: string;
}

/**
 * Push token response
 */
export class PushTokenResponseDto {
  id: string;
  provider: string;
  createdAt: Date;
  updatedAt: Date;
}

/**
 * Push notification payload (internal, never contains message content)
 */
export interface PushPayload {
  type: 'message' | 'call' | 'sync';
  // No content - client must fetch from server
}
