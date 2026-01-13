import {
  Controller,
  Post,
  Body,
  HttpCode,
  HttpStatus,
  Ip,
  UseGuards,
  Request,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterRequestDto } from './dto/register.dto';
import {
  PasskeyOptionsRequestDto,
  PasskeyVerifyRequestDto,
  PasswordLoginRequestDto,
  RefreshTokenRequestDto,
} from './dto/login.dto';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  /**
   * POST /auth/register
   * Register a new user with passkey or password
   */
  @Post('register')
  @HttpCode(HttpStatus.CREATED)
  async register(@Body() dto: RegisterRequestDto, @Ip() ip: string) {
    return this.authService.register(dto, ip);
  }

  /**
   * POST /auth/passkey/options
   * Get WebAuthn authentication options for passkey login
   */
  @Post('passkey/options')
  @HttpCode(HttpStatus.OK)
  async getPasskeyOptions(
    @Body() dto: PasskeyOptionsRequestDto,
    @Ip() ip: string,
  ) {
    return this.authService.getPasskeyOptions(dto, ip);
  }

  /**
   * POST /auth/passkey/verify
   * Verify WebAuthn assertion and complete passkey login
   */
  @Post('passkey/verify')
  @HttpCode(HttpStatus.OK)
  async verifyPasskey(@Body() dto: PasskeyVerifyRequestDto, @Ip() ip: string) {
    return this.authService.verifyPasskey(dto, ip);
  }

  /**
   * POST /auth/login
   * Login with password (fallback authentication)
   */
  @Post('login')
  @HttpCode(HttpStatus.OK)
  async loginWithPassword(
    @Body() dto: PasswordLoginRequestDto,
    @Ip() ip: string,
  ) {
    return this.authService.loginWithPassword(dto, ip);
  }

  /**
   * POST /auth/refresh
   * Refresh access token using refresh token
   * Note: No auth required (uses refresh token from body)
   */
  @Post('refresh')
  @HttpCode(HttpStatus.OK)
  async refreshToken(@Body() dto: RefreshTokenRequestDto) {
    return this.authService.refreshToken(dto);
  }

  /**
   * POST /auth/logout
   * Logout current session (revokes refresh token, blacklists JWT)
   */
  @Post('logout')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.NO_CONTENT)
  async logout(@Request() req: any) {
    await this.authService.logout(req.user.sub, req.user.deviceId, req.user.jti);
  }
}
