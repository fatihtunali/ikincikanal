import {
  IsString,
  IsUUID,
  IsOptional,
  IsInt,
  IsEnum,
  IsNotEmpty,
  IsArray,
  ValidateNested,
  Min,
  Max,
} from 'class-validator';
import { Type } from 'class-transformer';

export enum EnvelopeType {
  PREKEY_MESSAGE = 'prekey_message',
  SIGNAL_MESSAGE = 'signal_message',
  SEALED_SENDER = 'sealed_sender',
}

/**
 * Message destination
 */
export class MessageDestinationDto {
  @IsUUID()
  deviceId: string;

  @IsString()
  @IsNotEmpty()
  ciphertext: string; // Base64 encrypted content
}

/**
 * Send message request
 */
export class SendMessageDto {
  @IsUUID()
  toUserId: string;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => MessageDestinationDto)
  destinations: MessageDestinationDto[];

  @IsUUID()
  clientMessageId: string;

  @IsEnum(EnvelopeType)
  envelopeType: EnvelopeType;

  @IsInt()
  @IsOptional()
  @Min(0)
  disappearingSeconds?: number;
}

/**
 * Send message response
 */
export class SendMessageResponseDto {
  serverMessageId: string;
  sentAt: Date;
}

/**
 * Pending message
 */
export class PendingMessageDto {
  serverMessageId: string;
  fromUserId?: string;
  fromDeviceId?: string;
  clientMessageId: string;
  ciphertext: string;
  envelopeType: string;
  sentAt: Date;
  disappearingSeconds?: number;
}

/**
 * Pending messages response
 */
export class PendingMessagesResponseDto {
  messages: PendingMessageDto[];
  hasMore: boolean;
}

/**
 * Acknowledge messages request
 */
export class AckMessagesDto {
  @IsArray()
  @IsUUID('4', { each: true })
  serverMessageIds: string[];
}

/**
 * Acknowledge messages response
 */
export class AckMessagesResponseDto {
  acknowledged: number;
}

/**
 * Request delivery token
 */
export class RequestDeliveryTokenDto {
  @IsString()
  @IsNotEmpty()
  forSenderType: 'user_id' | 'handle' | 'server_domain';

  @IsString()
  @IsNotEmpty()
  forSenderValue: string;

  @IsInt()
  @IsOptional()
  @Min(1024)
  @Max(1048576) // 1MB max
  maxPayloadBytes?: number;

  @IsOptional()
  requirePow?: boolean;
}

/**
 * Delivery token response
 */
export class DeliveryTokenResponseDto {
  token: string;
  expiresAt: Date;
  maxPayloadBytes: number;
  requirePow: boolean;
}

/**
 * Sealed send request (no auth)
 */
export class SealedSendDto {
  @IsString()
  @IsNotEmpty()
  deliveryToken: string;

  @IsUUID()
  toDeviceId: string;

  @IsString()
  @IsNotEmpty()
  ciphertext: string;

  @IsUUID()
  clientMessageId: string;
}
