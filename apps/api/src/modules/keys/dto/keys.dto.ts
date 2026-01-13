import {
  IsArray,
  IsInt,
  IsString,
  IsNotEmpty,
  ValidateNested,
  Min,
  ArrayMinSize,
} from 'class-validator';
import { Type } from 'class-transformer';

export class SignedPreKeyDto {
  @IsInt()
  @Min(0)
  keyId: number;

  @IsString()
  @IsNotEmpty()
  publicKey: string; // Base64 X25519

  @IsString()
  @IsNotEmpty()
  signature: string; // Base64 Ed25519 signature
}

export class OneTimePreKeyDto {
  @IsInt()
  @Min(0)
  keyId: number;

  @IsString()
  @IsNotEmpty()
  publicKey: string; // Base64 X25519
}

/**
 * Upload keys request
 */
export class UploadKeysDto {
  @ValidateNested()
  @Type(() => SignedPreKeyDto)
  signedPreKey?: SignedPreKeyDto;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => OneTimePreKeyDto)
  @ArrayMinSize(0)
  oneTimePreKeys?: OneTimePreKeyDto[];
}

/**
 * Key count response
 */
export class KeyCountResponseDto {
  count: number;
  deviceId: string;
}

/**
 * PreKey bundle for establishing a session
 */
export class PreKeyBundleResponseDto {
  userId: string;
  deviceId: string;
  registrationId: number;
  identityKeyPub: string; // Base64 Ed25519

  signedPreKey: {
    keyId: number;
    publicKey: string; // Base64 X25519
    signature: string; // Base64 Ed25519
  };

  oneTimePreKey?: {
    keyId: number;
    publicKey: string; // Base64 X25519
  };
}

/**
 * Multiple device bundles
 */
export class DeviceBundlesResponseDto {
  userId: string;
  bundles: PreKeyBundleResponseDto[];
}
