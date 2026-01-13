import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Query,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { KeysService } from './keys.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { UploadKeysDto } from './dto/keys.dto';

@Controller('keys')
@UseGuards(JwtAuthGuard)
export class KeysController {
  constructor(private readonly keysService: KeysService) {}

  /**
   * POST /keys/upload
   * Upload signed prekey and/or one-time prekeys for current device
   */
  @Post('upload')
  @HttpCode(HttpStatus.NO_CONTENT)
  async uploadKeys(@Request() req: any, @Body() dto: UploadKeysDto) {
    await this.keysService.uploadKeys(req.user.sub, req.user.deviceId, dto);
  }

  /**
   * GET /keys/count
   * Get count of available one-time prekeys for current device
   */
  @Get('count')
  async getKeyCount(@Request() req: any) {
    return this.keysService.getKeyCount(req.user.sub, req.user.deviceId);
  }

  /**
   * GET /keys/prekey-bundle/:userId
   * Get prekey bundle for establishing a session with another user
   * Optionally specify deviceId to get bundle for specific device
   */
  @Get('prekey-bundle/:userId')
  async getPreKeyBundle(
    @Param('userId') userId: string,
    @Query('deviceId') deviceId?: string,
  ) {
    return this.keysService.getPreKeyBundle(userId, deviceId);
  }
}
