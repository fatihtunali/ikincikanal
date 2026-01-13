import {
  Controller,
  Get,
  Post,
  Put,
  Body,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
  Ip,
  Query,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  ResolveUserDto,
  BatchResolveDto,
  UpdateProfileDto,
  ChangePasswordDto,
} from './dto/users.dto';
import { PrivacyService } from '../privacy/privacy.service';
import { NukeAccountDto, ExportFormat } from '../privacy/dto/privacy.dto';

@Controller()
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
    private readonly privacyService: PrivacyService,
  ) {}

  /**
   * POST /users/resolve
   * Resolve a user handle to user info
   * Rate limited: 10/min by IP, 100/min by user
   */
  @Post('users/resolve')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async resolveUser(
    @Body() dto: ResolveUserDto,
    @Request() req: any,
    @Ip() ip: string,
  ) {
    return this.usersService.resolveUser(dto, req.user.sub, ip);
  }

  /**
   * POST /users/resolve/batch
   * Batch resolve multiple handles
   */
  @Post('users/resolve/batch')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async batchResolve(
    @Body() dto: BatchResolveDto,
    @Request() req: any,
    @Ip() ip: string,
  ) {
    return this.usersService.batchResolve(dto, req.user.sub, ip);
  }

  /**
   * GET /me
   * Get current user's profile
   */
  @Get('me')
  @UseGuards(JwtAuthGuard)
  async getProfile(@Request() req: any) {
    return this.usersService.getProfile(req.user.sub);
  }

  /**
   * PUT /me
   * Update current user's profile
   */
  @Put('me')
  @UseGuards(JwtAuthGuard)
  async updateProfile(@Request() req: any, @Body() dto: UpdateProfileDto) {
    return this.usersService.updateProfile(req.user.sub, dto);
  }

  /**
   * POST /me/password
   * Change current user's password
   */
  @Post('me/password')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.NO_CONTENT)
  async changePassword(@Request() req: any, @Body() dto: ChangePasswordDto) {
    await this.usersService.changePassword(req.user.sub, dto);
  }

  // ==========================================================================
  // Account Nuke (POST /me/nuke)
  // ==========================================================================

  /**
   * POST /me/nuke
   * Initiate or execute account nuke (immediate deletion)
   *
   * Two modes:
   * 1. Standard mode:
   *    - First call: Returns nukeToken (valid 30 seconds)
   *    - Second call: Pass nukeToken to confirm deletion
   *
   * 2. Instant mode:
   *    - Pass instant=true with deviceKeySignature and timestamp
   *    - Signature format: Ed25519 sign "NUKE:{userId}:{timestamp}"
   */
  @Post('me/nuke')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async nukeAccount(@Request() req: any, @Body() dto: NukeAccountDto) {
    // If no token and not instant mode, initiate nuke (return token)
    if (!dto.nukeToken && !dto.instant) {
      return this.privacyService.initiateNuke(req.user.sub);
    }

    // Otherwise, execute nuke
    return this.privacyService.executeNuke(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  // ==========================================================================
  // Data Export (GET /me/export)
  // ==========================================================================

  /**
   * GET /me/export
   * Request and get data export status
   * Returns metadata and message stats (no plaintext content)
   */
  @Get('me/export')
  @UseGuards(JwtAuthGuard)
  async getExport(
    @Request() req: any,
    @Query('format') format?: ExportFormat,
  ) {
    // Request a new export if none exists, or return existing status
    try {
      return await this.privacyService.requestExport(req.user.sub, {
        format: format || ExportFormat.JSON,
      });
    } catch (error: any) {
      // If export already in progress, return that status
      if (error?.status === 409) {
        // Get pending export status
        const pending = await this.privacyService.getExportStatus(
          req.user.sub,
          'pending',
        ).catch(() => null);
        if (pending) return pending;
      }
      throw error;
    }
  }
}
