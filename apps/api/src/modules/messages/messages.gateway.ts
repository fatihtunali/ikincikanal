import {
  WebSocketGateway,
  WebSocketServer,
  SubscribeMessage,
  OnGatewayConnection,
  OnGatewayDisconnect,
  ConnectedSocket,
  MessageBody,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { Injectable, UseGuards } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';

interface AuthenticatedSocket extends Socket {
  userId?: string;
  deviceId?: string;
}

@WebSocketGateway({
  cors: {
    origin: true,
    credentials: true,
  },
  namespace: '/messages',
})
@Injectable()
export class MessagesGateway
  implements OnGatewayConnection, OnGatewayDisconnect
{
  @WebSocketServer()
  server: Server;

  // Track connected clients by deviceId
  private connectedClients: Map<string, AuthenticatedSocket> = new Map();
  // Track userId to deviceIds mapping for multi-device
  private userDevices: Map<string, Set<string>> = new Map();

  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}

  async handleConnection(client: AuthenticatedSocket) {
    try {
      // Extract token from handshake
      const token =
        client.handshake.auth?.token ||
        client.handshake.headers?.authorization?.replace('Bearer ', '');

      if (!token) {
        console.log('[WS] Client rejected - no token');
        client.disconnect();
        return;
      }

      // Verify JWT
      const payload = await this.jwtService.verifyAsync(token, {
        secret: this.configService.get('JWT_SECRET'),
      });

      const userId = payload.sub as string;
      const deviceId = payload.deviceId as string;

      client.userId = userId;
      client.deviceId = deviceId;

      // Store client connection
      this.connectedClients.set(deviceId, client);

      // Track user's devices
      if (!this.userDevices.has(userId)) {
        this.userDevices.set(userId, new Set());
      }
      this.userDevices.get(userId)!.add(deviceId);

      // Join user's room (for multi-device sync)
      client.join(`user:${client.userId}`);
      client.join(`device:${client.deviceId}`);

      console.log(
        `[WS] Client connected: ${client.userId}:${client.deviceId}`,
      );

      // Notify client of successful connection
      client.emit('connected', {
        userId: client.userId,
        deviceId: client.deviceId,
        timestamp: new Date().toISOString(),
      });
    } catch (error) {
      console.log('[WS] Client rejected - invalid token');
      client.disconnect();
    }
  }

  handleDisconnect(client: AuthenticatedSocket) {
    if (client.deviceId) {
      this.connectedClients.delete(client.deviceId);

      if (client.userId) {
        const devices = this.userDevices.get(client.userId);
        if (devices) {
          devices.delete(client.deviceId);
          if (devices.size === 0) {
            this.userDevices.delete(client.userId);
          }
        }
      }

      console.log(
        `[WS] Client disconnected: ${client.userId}:${client.deviceId}`,
      );
    }
  }

  // Called by MessagesService when a new message is stored
  async notifyNewMessage(
    toUserId: string,
    toDeviceId: string | null,
    message: {
      serverMessageId: string;
      fromUserId?: string;
      envelopeType: string;
      sentAt: Date;
    },
  ) {
    if (toDeviceId) {
      // Send to specific device
      const client = this.connectedClients.get(toDeviceId);
      if (client) {
        client.emit('message', {
          serverMessageId: message.serverMessageId,
          fromUserId: message.fromUserId,
          envelopeType: message.envelopeType,
          sentAt: message.sentAt.toISOString(),
        });
        console.log(`[WS] Notified device ${toDeviceId} of new message`);
        return true;
      }
    } else {
      // Broadcast to all user's devices
      const devices = this.userDevices.get(toUserId);
      if (devices && devices.size > 0) {
        this.server.to(`user:${toUserId}`).emit('message', {
          serverMessageId: message.serverMessageId,
          fromUserId: message.fromUserId,
          envelopeType: message.envelopeType,
          sentAt: message.sentAt.toISOString(),
        });
        console.log(`[WS] Notified user ${toUserId} (${devices.size} devices)`);
        return true;
      }
    }
    return false;
  }

  // Called when a call event is created
  async notifyCallEvent(
    toUserId: string,
    toDeviceId: string | null,
    event: {
      eventId: string;
      callId: string;
      eventType: string;
      fromUserId: string;
    },
  ) {
    const payload = {
      eventId: event.eventId,
      callId: event.callId,
      eventType: event.eventType,
      fromUserId: event.fromUserId,
      timestamp: new Date().toISOString(),
    };

    if (toDeviceId) {
      const client = this.connectedClients.get(toDeviceId);
      if (client) {
        client.emit('call', payload);
        return true;
      }
    } else {
      const devices = this.userDevices.get(toUserId);
      if (devices && devices.size > 0) {
        this.server.to(`user:${toUserId}`).emit('call', payload);
        return true;
      }
    }
    return false;
  }

  // Client requests to fetch pending messages
  @SubscribeMessage('fetch')
  async handleFetch(@ConnectedSocket() client: AuthenticatedSocket) {
    // Client should use REST API to fetch, this just acknowledges
    client.emit('fetch_ack', { timestamp: new Date().toISOString() });
  }

  // Heartbeat/ping
  @SubscribeMessage('ping')
  handlePing(@ConnectedSocket() client: AuthenticatedSocket) {
    client.emit('pong', { timestamp: new Date().toISOString() });
  }

  // Get online status
  isDeviceOnline(deviceId: string): boolean {
    return this.connectedClients.has(deviceId);
  }

  isUserOnline(userId: string): boolean {
    const devices = this.userDevices.get(userId);
    return devices !== undefined && devices.size > 0;
  }

  getOnlineDeviceCount(): number {
    return this.connectedClients.size;
  }
}
