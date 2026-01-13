import {
  IsString,
  IsUUID,
  IsNotEmpty,
  IsOptional,
  IsArray,
  ValidateNested,
  IsEnum,
  IsUrl,
} from 'class-validator';
import { Type } from 'class-transformer';

/**
 * Server discovery response (/.well-known/ikincikanal-server)
 */
export class ServerDiscoveryDto {
  @IsString()
  serverHandle: string; // @server.com

  @IsUrl()
  baseUrl: string;

  @IsString()
  preferredKeyId: string;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ServerKeyDto)
  publicKeys: ServerKeyDto[];

  @IsArray()
  @IsString({ each: true })
  supportedVersions: string[];
}

export class ServerKeyDto {
  @IsString()
  keyId: string;

  @IsString()
  publicKey: string; // Base64 Ed25519

  @IsEnum(['active', 'deprecated'])
  status: 'active' | 'deprecated';

  @IsString()
  @IsOptional()
  notBefore?: string;

  @IsString()
  @IsOptional()
  notAfter?: string;
}

/**
 * Federation inbox payload types
 */
export enum FederationPayloadType {
  MESSAGE = 'message',
  KEY_REQUEST = 'key_request',
  KEY_RESPONSE = 'key_response',
  USER_DELETED = 'user_deleted',
  DELIVERY_RECEIPT = 'delivery_receipt',
}

/**
 * Federation inbox request
 */
export class FederationInboxDto {
  @IsEnum(FederationPayloadType)
  payloadType: FederationPayloadType;

  @IsString()
  @IsNotEmpty()
  payload: string; // Encrypted or signed payload

  @IsString()
  @IsOptional()
  envelopeId?: string; // For idempotency
}

/**
 * Federation message envelope
 */
export class FederationMessageDto {
  @IsString()
  toFullHandle: string;

  @IsUUID()
  @IsOptional()
  toDeviceId?: string;

  @IsString()
  ciphertext: string;

  @IsString()
  envelopeType: string;

  @IsUUID()
  clientMessageId: string;
}

/**
 * Federation user deleted notification
 */
export class FederationUserDeletedDto {
  @IsString()
  fullHandle: string;

  @IsString()
  deletedAt: string;
}

/**
 * Federation key request
 */
export class FederationKeyRequestDto {
  @IsString()
  fullHandle: string;

  @IsUUID()
  @IsOptional()
  deviceId?: string;
}

/**
 * Federation signature headers
 */
export interface FederationHeaders {
  'x-server-origin': string;
  'x-timestamp': string;
  'x-nonce': string;
  'x-key-id': string;
  'x-signature': string;
}
