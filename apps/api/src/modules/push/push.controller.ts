import {
  Controller,
  Get,
  Put,
  Delete,
  Body,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { PushService } from './push.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RegisterPushTokenDto } from './dto/push.dto';

@Controller('push')
@UseGuards(JwtAuthGuard)
export class PushController {
  constructor(private readonly pushService: PushService) {}

  /**
   * PUT /push/token
   * Register or update push token for current device
   */
  @Put('token')
  @HttpCode(HttpStatus.OK)
  async registerToken(@Request() req: any, @Body() dto: RegisterPushTokenDto) {
    return this.pushService.registerToken(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  /**
   * GET /push/token
   * Get current device's push token status
   */
  @Get('token')
  async getToken(@Request() req: any) {
    const token = await this.pushService.getToken(
      req.user.sub,
      req.user.deviceId,
    );
    return token || { registered: false };
  }

  /**
   * DELETE /push/token
   * Remove push token for current device
   */
  @Delete('token')
  @HttpCode(HttpStatus.NO_CONTENT)
  async deleteToken(@Request() req: any) {
    await this.pushService.deleteToken(req.user.sub, req.user.deviceId);
  }
}
