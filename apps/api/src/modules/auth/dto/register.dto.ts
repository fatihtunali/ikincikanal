import {
  IsString,
  IsOptional,
  ValidateNested,
  IsNotEmpty,
  Matches,
  MinLength,
  MaxLength,
  IsArray,
  IsInt,
  Min,
  Max,
  ValidateIf,
} from 'class-validator';
import { Type } from 'class-transformer';

/**
 * Passkey attestation from WebAuthn registration
 */
export class PasskeyAttestationDto {
  @IsString()
  @IsNotEmpty()
  id: string;

  @IsString()
  @IsNotEmpty()
  rawId: string;

  @IsString()
  @IsNotEmpty()
  type: string;

  @ValidateNested()
  @Type(() => AttestationResponseDto)
  response: AttestationResponseDto;
}

export class AttestationResponseDto {
  @IsString()
  @IsNotEmpty()
  clientDataJSON: string;

  @IsString()
  @IsNotEmpty()
  attestationObject: string;

  @IsArray()
  @IsOptional()
  transports?: string[];
}

/**
 * Device key material for Signal Protocol
 */
export class NewDeviceKeysDto {
  @IsString()
  @IsNotEmpty()
  identityKeyPub: string; // Base64 Ed25519 public key

  @ValidateNested()
  @Type(() => SignedPreKeyDto)
  signedPreKey: SignedPreKeyDto;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => OneTimePreKeyDto)
  oneTimePreKeys: OneTimePreKeyDto[];
}

export class SignedPreKeyDto {
  @IsInt()
  @Min(0)
  keyId: number;

  @IsString()
  @IsNotEmpty()
  publicKey: string; // Base64 X25519 public key

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
  publicKey: string; // Base64 X25519 public key
}

/**
 * New device information
 */
export class NewDeviceDto {
  @IsString()
  @MinLength(1)
  @MaxLength(64)
  deviceName: string;

  @IsInt()
  @Min(1)
  @Max(2147483647)
  registrationId: number;
}

/**
 * Registration request - oneOf: passkey OR password (not both)
 */
export class RegisterRequestDto {
  @IsString()
  @Matches(/^[a-zA-Z][a-zA-Z0-9_]{2,31}$/, {
    message: 'Handle must be 3-32 characters, start with letter, alphanumeric + underscore only',
  })
  handle: string;

  @IsString()
  @IsOptional()
  @MaxLength(64)
  displayName?: string;

  // Passkey-based registration
  @ValidateIf((o) => !o.password)
  @ValidateNested()
  @Type(() => PasskeyAttestationDto)
  passkey?: PasskeyAttestationDto;

  // Password-based registration
  @ValidateIf((o) => !o.passkey)
  @IsString()
  @MinLength(8)
  password?: string;

  @ValidateNested()
  @Type(() => NewDeviceDto)
  newDevice: NewDeviceDto;

  @ValidateNested()
  @Type(() => NewDeviceKeysDto)
  newDeviceKeys: NewDeviceKeysDto;
}
