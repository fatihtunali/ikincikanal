import {
  IsString,
  IsOptional,
  ValidateNested,
  IsNotEmpty,
  MinLength,
  MaxLength,
  IsUUID,
  ValidateIf,
} from 'class-validator';
import { Type } from 'class-transformer';
import { NewDeviceDto, NewDeviceKeysDto } from './register.dto';

/**
 * Passkey assertion from WebAuthn authentication
 */
export class PasskeyAssertionDto {
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
  @Type(() => AssertionResponseDto)
  response: AssertionResponseDto;
}

export class AssertionResponseDto {
  @IsString()
  @IsNotEmpty()
  clientDataJSON: string;

  @IsString()
  @IsNotEmpty()
  authenticatorData: string;

  @IsString()
  @IsNotEmpty()
  signature: string;

  @IsString()
  @IsOptional()
  userHandle?: string;
}

/**
 * Passkey login options request
 */
export class PasskeyOptionsRequestDto {
  @IsString()
  @MinLength(3)
  @MaxLength(32)
  handle: string;
}

/**
 * Passkey login verify request
 */
export class PasskeyVerifyRequestDto {
  @IsString()
  @MinLength(3)
  @MaxLength(32)
  handle: string;

  @ValidateNested()
  @Type(() => PasskeyAssertionDto)
  assertion: PasskeyAssertionDto;

  // Existing device login
  @ValidateIf((o) => !o.newDevice)
  @IsUUID()
  deviceId?: string;

  // New device login
  @ValidateIf((o) => !o.deviceId)
  @ValidateNested()
  @Type(() => NewDeviceDto)
  newDevice?: NewDeviceDto;

  @ValidateIf((o) => !o.deviceId)
  @ValidateNested()
  @Type(() => NewDeviceKeysDto)
  newDeviceKeys?: NewDeviceKeysDto;
}

/**
 * Password login request - oneOf: existing device OR new device
 */
export class PasswordLoginRequestDto {
  @IsString()
  @MinLength(3)
  @MaxLength(32)
  handle: string;

  @IsString()
  @IsNotEmpty()
  password: string;

  // Existing device login
  @ValidateIf((o) => !o.newDevice)
  @IsUUID()
  deviceId?: string;

  // New device login
  @ValidateIf((o) => !o.deviceId)
  @ValidateNested()
  @Type(() => NewDeviceDto)
  newDevice?: NewDeviceDto;

  @ValidateIf((o) => !o.deviceId)
  @ValidateNested()
  @Type(() => NewDeviceKeysDto)
  newDeviceKeys?: NewDeviceKeysDto;
}

/**
 * Refresh token request
 */
export class RefreshTokenRequestDto {
  @IsString()
  @IsNotEmpty()
  refreshToken: string;
}

/**
 * Authentication response (login/register success)
 */
export class AuthResponseDto {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  tokenType: string;
  userId: string;
  deviceId: string;
}
