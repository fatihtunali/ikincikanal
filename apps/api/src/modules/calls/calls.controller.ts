import {
  Controller,
  Get,
  Post,
  Body,
  Query,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { CallsService } from './calls.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  CallInviteDto,
  CallSignalDto,
  AckCallEventsDto,
} from './dto/calls.dto';

@Controller('calls')
@UseGuards(JwtAuthGuard)
export class CallsController {
  constructor(private readonly callsService: CallsService) {}

  /**
   * GET /calls/turn-credentials
   * Get ephemeral TURN credentials for WebRTC
   * Rate limited: 10 requests per hour
   */
  @Get('turn-credentials')
  async getTurnCredentials(@Request() req: any) {
    return this.callsService.getTurnCredentials(req.user.sub);
  }

  /**
   * POST /calls/invite
   * Send a call invitation to a user
   */
  @Post('invite')
  @HttpCode(HttpStatus.CREATED)
  async createCallInvite(@Request() req: any, @Body() dto: CallInviteDto) {
    return this.callsService.createCallInvite(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  /**
   * POST /calls/signal
   * Send call signaling data (answer, ICE candidates, hangup, etc.)
   */
  @Post('signal')
  @HttpCode(HttpStatus.CREATED)
  async sendCallSignal(@Request() req: any, @Body() dto: CallSignalDto) {
    return this.callsService.sendCallSignal(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  /**
   * GET /calls/events/pending
   * Get pending call events for current device
   * Supports long-polling with waitSeconds parameter
   */
  @Get('events/pending')
  async getPendingCallEvents(
    @Request() req: any,
    @Query('limit') limit?: string,
    @Query('waitSeconds') waitSeconds?: string,
  ) {
    return this.callsService.getPendingCallEvents(
      req.user.sub,
      req.user.deviceId,
      limit ? parseInt(limit, 10) : 50,
      waitSeconds ? parseInt(waitSeconds, 10) : 0,
    );
  }

  /**
   * POST /calls/events/ack
   * Acknowledge received call events
   */
  @Post('events/ack')
  @HttpCode(HttpStatus.OK)
  async acknowledgeCallEvents(
    @Request() req: any,
    @Body() dto: AckCallEventsDto,
  ) {
    return this.callsService.acknowledgeCallEvents(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }
}
