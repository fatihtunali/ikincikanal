import { IsString, IsOptional, IsEnum, IsBoolean } from 'class-validator';

/**
 * Export format options
 */
export enum ExportFormat {
  JSON = 'json',
  ZIP = 'zip',
}

/**
 * Request data export
 */
export class RequestExportDto {
  @IsEnum(ExportFormat)
  @IsOptional()
  format?: ExportFormat = ExportFormat.JSON;
}

/**
 * Export status response
 */
export class ExportStatusDto {
  exportId: string;
  status: 'pending' | 'processing' | 'ready' | 'expired' | 'failed';
  format: ExportFormat;
  requestedAt: Date;
  completedAt?: Date;
  expiresAt?: Date;
  downloadUrl?: string;
  errorMessage?: string;
}

/**
 * Account deletion request (standard 7-day grace period)
 */
export class DeleteAccountDto {
  @IsString()
  confirmation: string; // Must be "DELETE MY ACCOUNT"
}

/**
 * Nuke account request - Two modes:
 * 1. Standard: token + 30 second confirm window
 * 2. Instant: deviceKeySignature for immediate deletion
 */
export class NukeAccountDto {
  @IsBoolean()
  @IsOptional()
  instant?: boolean; // If true, use instant mode with deviceKeySignature

  @IsString()
  @IsOptional()
  deviceKeySignature?: string; // Ed25519 signature over "NUKE:{userId}:{timestamp}"

  @IsString()
  @IsOptional()
  nukeToken?: string; // Token from initiate step (for standard mode)

  @IsString()
  @IsOptional()
  timestamp?: string; // ISO timestamp for signature verification
}

/**
 * Nuke initiation response (standard mode)
 */
export class NukeInitiationDto {
  nukeToken: string;
  expiresAt: Date; // 30 seconds from now
  confirmationRequired: true;
}

/**
 * Account deletion status
 */
export class DeletionStatusDto {
  status: 'scheduled' | 'processing' | 'completed' | 'cancelled';
  scheduledAt: Date;
  executeAt: Date; // 7-day grace period
  canCancel: boolean;
}

/**
 * Privacy settings
 */
export class PrivacySettingsDto {
  @IsOptional()
  allowAnalytics?: boolean;

  @IsOptional()
  allowCrashReports?: boolean;

  @IsOptional()
  shareProfileWithFederation?: boolean;
}

/**
 * Data categories included in export
 */
export interface ExportData {
  account: {
    userId: string;
    handle: string;
    fullHandle: string;
    displayName: string | null;
    createdAt: Date;
  };
  devices: Array<{
    deviceId: string;
    name: string;
    platform: string;
    registeredAt: Date;
    lastActiveAt: Date | null;
  }>;
  keys: {
    identityKeys: number;
    signedPreKeys: number;
    oneTimePreKeys: number;
  };
  contacts: Array<{
    contactId: string;
    fullHandle: string;
    nickname: string | null;
    addedAt: Date;
  }>;
  messageStats: {
    totalSent: number;
    totalReceived: number;
    // Note: Actual message content is never stored on server
  };
  exportedAt: Date;
}
