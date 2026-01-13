import {
  Controller,
  Get,
  Post,
  Put,
  Body,
  UseGuards,
  Request,
  HttpCode,
  HttpStatus,
  Ip,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  ResolveUserDto,
  BatchResolveDto,
  UpdateProfileDto,
  ChangePasswordDto,
} from './dto/users.dto';

@Controller()
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  /**
   * POST /users/resolve
   * Resolve a user handle to user info
   * Rate limited: 10/min by IP, 100/min by user
   */
  @Post('users/resolve')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async resolveUser(
    @Body() dto: ResolveUserDto,
    @Request() req: any,
    @Ip() ip: string,
  ) {
    return this.usersService.resolveUser(dto, req.user.sub, ip);
  }

  /**
   * POST /users/resolve/batch
   * Batch resolve multiple handles
   */
  @Post('users/resolve/batch')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.OK)
  async batchResolve(
    @Body() dto: BatchResolveDto,
    @Request() req: any,
    @Ip() ip: string,
  ) {
    return this.usersService.batchResolve(dto, req.user.sub, ip);
  }

  /**
   * GET /me
   * Get current user's profile
   */
  @Get('me')
  @UseGuards(JwtAuthGuard)
  async getProfile(@Request() req: any) {
    return this.usersService.getProfile(req.user.sub);
  }

  /**
   * PUT /me
   * Update current user's profile
   */
  @Put('me')
  @UseGuards(JwtAuthGuard)
  async updateProfile(@Request() req: any, @Body() dto: UpdateProfileDto) {
    return this.usersService.updateProfile(req.user.sub, dto);
  }

  /**
   * POST /me/password
   * Change current user's password
   */
  @Post('me/password')
  @UseGuards(JwtAuthGuard)
  @HttpCode(HttpStatus.NO_CONTENT)
  async changePassword(@Request() req: any, @Body() dto: ChangePasswordDto) {
    await this.usersService.changePassword(req.user.sub, dto);
  }
}
