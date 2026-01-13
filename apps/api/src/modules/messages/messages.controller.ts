import {
  Controller,
  Get,
  Post,
  Delete,
  Body,
  Param,
  Query,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
  Ip,
} from '@nestjs/common';
import { MessagesService } from './messages.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  SendMessageDto,
  AckMessagesDto,
  RequestDeliveryTokenDto,
  SealedSendDto,
  AddReactionDto,
  RemoveReactionDto,
} from './dto/messages.dto';

@Controller('messages')
export class MessagesController {
  constructor(private readonly messagesService: MessagesService) {}

  /**
   * POST /messages/send
   * Send an encrypted message to one or more devices
   */
  @Post('send')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.CREATED)
  async sendMessage(@Request() req: any, @Body() dto: SendMessageDto) {
    return this.messagesService.sendMessage(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  /**
   * GET /messages/pending
   * Get pending messages for current device
   * Supports long-polling with waitSeconds parameter
   */
  @Get('pending')
  @UseGuards(JwtAuthGuard)
  async getPendingMessages(
    @Request() req: any,
    @Query('limit') limit?: string,
    @Query('waitSeconds') waitSeconds?: string,
  ) {
    return this.messagesService.getPendingMessages(
      req.user.sub,
      req.user.deviceId,
      limit ? parseInt(limit, 10) : 100,
      waitSeconds ? parseInt(waitSeconds, 10) : 0,
    );
  }

  /**
   * POST /messages/ack
   * Acknowledge and delete received messages
   */
  @Post('ack')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async acknowledgeMessages(@Request() req: any, @Body() dto: AckMessagesDto) {
    return this.messagesService.acknowledgeMessages(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
  }

  /**
   * POST /messages/delivery-token
   * Request a delivery token for sealed sender messaging
   */
  @Post('delivery-token')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.CREATED)
  async requestDeliveryToken(
    @Request() req: any,
    @Body() dto: RequestDeliveryTokenDto,
  ) {
    return this.messagesService.requestDeliveryToken(req.user.sub, dto);
  }

  /**
   * POST /messages/send-sealed
   * Send a sealed sender message (no authentication required)
   * Uses delivery token for authorization
   */
  @Post('send-sealed')
  @HttpCode(HttpStatus.CREATED)
  async sealedSend(@Body() dto: SealedSendDto, @Ip() ip: string) {
    return this.messagesService.sealedSend(dto, ip);
  }

  // ==========================================================================
  // Reactions
  // ==========================================================================

  /**
   * POST /messages/reactions
   * Add or update a reaction to a message
   */
  @Post('reactions')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.CREATED)
  async addReaction(@Request() req: any, @Body() dto: AddReactionDto) {
    return this.messagesService.addReaction(req.user.sub, dto);
  }

  /**
   * DELETE /messages/reactions
   * Remove a reaction from a message
   */
  @Delete('reactions')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async removeReaction(@Request() req: any, @Body() dto: RemoveReactionDto) {
    return this.messagesService.removeReaction(req.user.sub, dto);
  }

  /**
   * GET /messages/:messageId/reactions
   * Get all reactions for a message
   */
  @Get(':messageId/reactions')
  @UseGuards(JwtAuthGuard)
  async getReactions(@Param('messageId') messageId: string) {
    return this.messagesService.getReactions(messageId);
  }
}
