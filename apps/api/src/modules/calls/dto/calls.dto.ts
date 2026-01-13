import {
  IsString,
  IsUUID,
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsArray,
} from 'class-validator';

export enum CallEventType {
  INVITE = 'invite',
  ANSWER = 'answer',
  ICE = 'ice',
  HANGUP = 'hangup',
  REJECT = 'reject',
  BUSY = 'busy',
}

/**
 * TURN credentials response
 */
export class TurnCredentialsResponseDto {
  username: string;
  password: string;
  ttl: number;
  urls: string[];
}

/**
 * Call invite request
 */
export class CallInviteDto {
  @IsUUID()
  toUserId: string;

  @IsUUID()
  @IsOptional()
  toDeviceId?: string;

  @IsString()
  @IsNotEmpty()
  encryptedOffer: string; // Encrypted SDP offer
}

/**
 * Call signal request (ICE, answer, etc.)
 */
export class CallSignalDto {
  @IsUUID()
  callId: string;

  @IsUUID()
  toUserId: string;

  @IsUUID()
  @IsOptional()
  toDeviceId?: string;

  @IsEnum(CallEventType)
  eventType: CallEventType;

  @IsString()
  @IsNotEmpty()
  encryptedPayload: string;
}

/**
 * Pending call event
 */
export class PendingCallEventDto {
  eventId: string;
  callId: string;
  fromUserId: string;
  fromDeviceId: string;
  eventType: string;
  encryptedPayload: string;
  createdAt: Date;
  expiresAt: Date;
}

/**
 * Pending call events response
 */
export class PendingCallEventsResponseDto {
  events: PendingCallEventDto[];
  hasMore: boolean;
}

/**
 * Acknowledge call events request
 */
export class AckCallEventsDto {
  @IsArray()
  @IsUUID('4', { each: true })
  eventIds: string[];
}

/**
 * Acknowledge call events response
 */
export class AckCallEventsResponseDto {
  acknowledged: number;
}

/**
 * Call invite response
 */
export class CallInviteResponseDto {
  callId: string;
  eventId: string;
}
