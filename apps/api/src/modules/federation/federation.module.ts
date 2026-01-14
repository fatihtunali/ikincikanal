import { Module } from '@nestjs/common';
import { FederationService } from './federation.service';
import { FederationController } from './federation.controller';
import { FederationKeyService } from './federation-key.service';

@Module({
  controllers: [FederationController],
  providers: [FederationService, FederationKeyService],
  exports: [FederationService, FederationKeyService],
})
export class FederationModule {}
