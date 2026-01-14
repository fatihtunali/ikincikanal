import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';
import { ThrottlerModule, ThrottlerGuard } from '@nestjs/throttler';

// Infrastructure modules
import { PrismaModule } from './modules/prisma/prisma.module';
import { RedisModule } from './modules/redis/redis.module';

// Feature modules
import { AuthModule } from './modules/auth/auth.module';
import { DevicesModule } from './modules/devices/devices.module';
import { KeysModule } from './modules/keys/keys.module';
import { MessagesModule } from './modules/messages/messages.module';
import { CallsModule } from './modules/calls/calls.module';
import { UsersModule } from './modules/users/users.module';
import { PushModule } from './modules/push/push.module';
import { FederationModule } from './modules/federation/federation.module';
import { PrivacyModule } from './modules/privacy/privacy.module';
import { HealthModule } from './modules/health/health.module';
import { GroupsModule } from './modules/groups/groups.module';

// Controllers & Services
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [
    // Configuration
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '../../.env',
    }),

    // Rate limiting
    ThrottlerModule.forRoot([
      {
        name: 'short',
        ttl: 1000,
        limit: 10,
      },
      {
        name: 'medium',
        ttl: 10000,
        limit: 50,
      },
      {
        name: 'long',
        ttl: 60000,
        limit: 200,
      },
    ]),

    // Infrastructure
    PrismaModule,
    RedisModule,

    // Features
    AuthModule,
    DevicesModule,
    KeysModule,
    MessagesModule,
    CallsModule,
    UsersModule,
    PushModule,
    FederationModule,
    PrivacyModule,
    HealthModule,
    GroupsModule,
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard,
    },
  ],
})
export class AppModule {}
