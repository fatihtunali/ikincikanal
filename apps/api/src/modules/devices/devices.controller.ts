import {
  Controller,
  Get,
  Delete,
  Post,
  Param,
  Body,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { DevicesService } from './devices.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RevokeDeviceDto } from './dto/device.dto';

@Controller('devices')
@UseGuards(JwtAuthGuard)
export class DevicesController {
  constructor(private readonly devicesService: DevicesService) {}

  /**
   * GET /devices
   * List all devices for the authenticated user
   */
  @Get()
  async getDevices(@Request() req: any) {
    return this.devicesService.getDevices(req.user.sub, req.user.deviceId);
  }

  /**
   * GET /devices/:deviceId
   * Get details of a specific device
   */
  @Get(':deviceId')
  async getDevice(@Request() req: any, @Param('deviceId') deviceId: string) {
    return this.devicesService.getDevice(req.user.sub, deviceId);
  }

  /**
   * DELETE /devices/:deviceId
   * Revoke a specific device (cannot be current device)
   */
  @Delete(':deviceId')
  @HttpCode(HttpStatus.NO_CONTENT)
  async revokeDevice(
    @Request() req: any,
    @Param('deviceId') deviceId: string,
    @Body() dto: RevokeDeviceDto,
  ) {
    await this.devicesService.revokeDevice(
      req.user.sub,
      deviceId,
      req.user.deviceId,
      dto.reason,
    );
  }

  /**
   * POST /devices/revoke-all
   * Revoke all devices except current
   */
  @Post('revoke-all')
  @HttpCode(HttpStatus.OK)
  async revokeAllOther(@Request() req: any) {
    return this.devicesService.revokeAllOther(req.user.sub, req.user.deviceId);
  }

  /**
   * POST /devices/revoke-all-including-current
   * Revoke all devices including current (emergency action)
   */
  @Post('revoke-all-including-current')
  @HttpCode(HttpStatus.OK)
  async revokeAllIncludingCurrent(@Request() req: any) {
    return this.devicesService.revokeAllIncludingCurrent(req.user.sub);
  }
}
