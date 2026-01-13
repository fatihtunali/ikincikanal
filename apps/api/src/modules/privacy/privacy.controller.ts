import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Param,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
  Res,
} from '@nestjs/common';
import type { Response } from 'express';
import { PrivacyService } from './privacy.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  RequestExportDto,
  DeleteAccountDto,
  PrivacySettingsDto,
} from './dto/privacy.dto';

@Controller('privacy')
@UseGuards(JwtAuthGuard)
export class PrivacyController {
  constructor(private readonly privacyService: PrivacyService) {}

  // ==========================================================================
  // Data Export
  // ==========================================================================

  /**
   * POST /privacy/export
   * Request data export (GDPR Article 20)
   */
  @Post('export')
  @HttpCode(HttpStatus.ACCEPTED)
  async requestExport(@Request() req: any, @Body() dto: RequestExportDto) {
    return this.privacyService.requestExport(req.user.sub, dto);
  }

  /**
   * GET /privacy/export/:exportId
   * Get export status
   */
  @Get('export/:exportId')
  async getExportStatus(
    @Request() req: any,
    @Param('exportId') exportId: string,
  ) {
    return this.privacyService.getExportStatus(req.user.sub, exportId);
  }

  /**
   * GET /privacy/export/:exportId/download
   * Download completed export
   */
  @Get('export/:exportId/download')
  async downloadExport(
    @Request() req: any,
    @Param('exportId') exportId: string,
    @Res() res: Response,
  ) {
    const { data, format } = await this.privacyService.downloadExport(
      req.user.sub,
      exportId,
    );

    if (format === 'json') {
      res.setHeader('Content-Type', 'application/json');
      res.setHeader(
        'Content-Disposition',
        `attachment; filename="ikincikanal-export-${exportId}.json"`,
      );
      res.send(JSON.stringify(data, null, 2));
    } else {
      // For ZIP format, would create a ZIP archive
      // For now, return JSON
      res.setHeader('Content-Type', 'application/json');
      res.setHeader(
        'Content-Disposition',
        `attachment; filename="ikincikanal-export-${exportId}.json"`,
      );
      res.send(JSON.stringify(data, null, 2));
    }
  }

  // ==========================================================================
  // Account Deletion
  // ==========================================================================

  /**
   * POST /privacy/delete-account
   * Request account deletion (GDPR Article 17)
   * Has 7-day grace period before execution
   */
  @Post('delete-account')
  @HttpCode(HttpStatus.ACCEPTED)
  async requestDeletion(
    @Request() req: any,
    @Body() dto: DeleteAccountDto,
  ) {
    return this.privacyService.requestAccountDeletion(req.user.sub, dto);
  }

  /**
   * GET /privacy/delete-account
   * Get deletion status
   */
  @Get('delete-account')
  async getDeletionStatus(@Request() req: any) {
    const status = await this.privacyService.getDeletionStatus(req.user.sub);
    if (!status) {
      return { scheduled: false };
    }
    return status;
  }

  /**
   * DELETE /privacy/delete-account
   * Cancel scheduled deletion (within grace period)
   */
  @Delete('delete-account')
  @HttpCode(HttpStatus.OK)
  async cancelDeletion(@Request() req: any) {
    return this.privacyService.cancelAccountDeletion(req.user.sub);
  }

  // ==========================================================================
  // Privacy Settings
  // ==========================================================================

  /**
   * GET /privacy/settings
   * Get current privacy settings
   */
  @Get('settings')
  async getSettings(@Request() req: any) {
    return this.privacyService.getPrivacySettings(req.user.sub);
  }

  /**
   * PUT /privacy/settings
   * Update privacy settings
   */
  @Put('settings')
  async updateSettings(
    @Request() req: any,
    @Body() dto: PrivacySettingsDto,
  ) {
    return this.privacyService.updatePrivacySettings(req.user.sub, dto);
  }
}
