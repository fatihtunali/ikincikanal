import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    rawBody: true, // Needed for federation signature verification
  });

  // Enable CORS
  app.enableCors({
    origin: true,
    credentials: true,
  });

  // Global validation pipe
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
    }),
  );

  // Swagger documentation
  const config = new DocumentBuilder()
    .setTitle('IKINCI KANAL API')
    .setDescription(
      'Decentralized, end-to-end encrypted messaging platform API.\n\n' +
      '## Core Principles\n' +
      '- **Zero Knowledge**: Server never sees plaintext content\n' +
      '- **Metadata Protection**: Sealed sender, minimal logging\n' +
      '- **User Control**: One-click data deletion\n' +
      '- **Decentralized**: Federated server architecture',
    )
    .setVersion('1.0')
    .addBearerAuth()
    .addTag('Auth', 'Authentication endpoints (passkey, password, tokens)')
    .addTag('Users', 'User profile and resolution')
    .addTag('Devices', 'Device management')
    .addTag('Keys', 'Signal Protocol key management')
    .addTag('Messages', 'E2EE message queue')
    .addTag('Calls', 'WebRTC call signaling')
    .addTag('Push', 'Push notification tokens')
    .addTag('Privacy', 'GDPR export and account deletion')
    .addTag('Federation', 'Server-to-server federation')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('docs', app, document, {
    customSiteTitle: 'IKINCI KANAL API Docs',
    customfavIcon: 'https://nestjs.com/img/logo-small.svg',
    swaggerOptions: {
      persistAuthorization: true,
    },
  });

  const port = process.env.PORT ?? 3050;
  await app.listen(port);
  console.log(`🚀 API running on port ${port}`);
  console.log(`📚 Swagger docs at http://localhost:${port}/docs`);
}
bootstrap();
