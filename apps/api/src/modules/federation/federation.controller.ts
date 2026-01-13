import {
  Controller,
  Get,
  Post,
  Body,
  Headers,
  Req,
  Query,
  UseGuards,
} from '@nestjs/common';
import type { RawBodyRequest } from '@nestjs/common';
import { FederationService } from './federation.service';
import {
  FederationInboxDto,
  FederationHeaders,
  ServerDiscoveryDto,
} from './dto/federation.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import type { Request } from 'express';

@Controller()
export class FederationController {
  constructor(private readonly federationService: FederationService) {}

  // ==========================================================================
  // Server Discovery (Public)
  // ==========================================================================

  /**
   * GET /.well-known/ikincikanal-server
   * Public endpoint for server discovery
   */
  @Get('.well-known/ikincikanal-server')
  async getServerDiscovery(): Promise<ServerDiscoveryDto> {
    return this.federationService.getServerDiscovery();
  }

  // ==========================================================================
  // Federation Inbox (S2S)
  // ==========================================================================

  /**
   * POST /federation/inbox
   * Receive messages from other federated servers
   * Protected by signature verification (not JWT)
   */
  @Post('federation/inbox')
  async receiveInbox(
    @Body() dto: FederationInboxDto,
    @Headers('x-server-origin') serverOrigin: string,
    @Headers('x-timestamp') timestamp: string,
    @Headers('x-nonce') nonce: string,
    @Headers('x-key-id') keyId: string,
    @Headers('x-signature') signature: string,
    @Req() req: RawBodyRequest<Request>,
  ) {
    const headers: FederationHeaders = {
      'x-server-origin': serverOrigin,
      'x-timestamp': timestamp,
      'x-nonce': nonce,
      'x-key-id': keyId,
      'x-signature': signature,
    };

    // Get raw body for signature verification
    const rawBody = req.rawBody?.toString() || JSON.stringify(dto);

    return this.federationService.processInbox(dto, headers, rawBody);
  }

  // ==========================================================================
  // Key Lookup (Authenticated)
  // ==========================================================================

  /**
   * GET /federation/keys
   * Get public keys for a user (local or remote)
   * Used for initiating E2E encrypted conversations
   */
  @Get('federation/keys')
  @UseGuards(JwtAuthGuard)
  async getKeysForUser(@Query('fullHandle') fullHandle: string) {
    return this.federationService.getKeysForUser(fullHandle);
  }
}
