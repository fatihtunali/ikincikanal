import { IsString, IsOptional, MaxLength, IsEnum } from 'class-validator';

export enum RevocationReason {
  USER_INITIATED = 'user_initiated',
  ADMIN_SECURITY = 'admin_security',
  NUKE = 'nuke',
}

export class DeviceResponseDto {
  id: string;
  deviceName: string;
  registrationId: number;
  createdAt: Date;
  lastActiveAt: Date;
  revokedAt?: Date;
  revocationReason?: string;
}

export class DeviceListResponseDto {
  devices: DeviceResponseDto[];
  currentDeviceId: string;
}

export class RevokeDeviceDto {
  @IsString()
  @IsOptional()
  @IsEnum(RevocationReason)
  reason?: RevocationReason;
}

export class RevokeAllResponseDto {
  revokedCount: number;
  message: string;
}
