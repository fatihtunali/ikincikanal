import {
  Controller,
  Get,
  Post,
  Delete,
  Body,
  Param,
  Query,
  Request,
  UseGuards,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { GroupsService } from './groups.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import {
  CreateGroupDto,
  UploadKeyPackagesDto,
  AddMembersDto,
  RemoveMemberDto,
  SendGroupMessageDto,
  AckGroupMessagesDto,
  GetPendingMessagesQueryDto,
  GroupResponseDto,
  GroupDetailResponseDto,
  KeyPackageResponseDto,
  GroupMessageResponseDto,
  PendingGroupMessagesResponseDto,
} from './dto/groups.dto';

@Controller('groups')
@UseGuards(JwtAuthGuard)
export class GroupsController {
  constructor(private readonly groupsService: GroupsService) {}

  // ==========================================================================
  // Key Packages
  // ==========================================================================

  @Post('key-packages')
  @HttpCode(HttpStatus.CREATED)
  async uploadKeyPackages(
    @Request() req: any,
    @Body() dto: UploadKeyPackagesDto,
  ): Promise<{ uploaded: number }> {
    const count = await this.groupsService.uploadKeyPackages(
      req.user.sub,
      req.user.deviceId,
      dto,
    );
    return { uploaded: count };
  }

  @Get('key-packages/:userId')
  async getKeyPackages(
    @Request() req: any,
    @Param('userId') userId: string,
  ): Promise<KeyPackageResponseDto[]> {
    return this.groupsService.getKeyPackages(userId);
  }

  // ==========================================================================
  // Group CRUD
  // ==========================================================================

  @Post()
  @HttpCode(HttpStatus.CREATED)
  async createGroup(
    @Request() req: any,
    @Body() dto: CreateGroupDto,
  ): Promise<GroupResponseDto> {
    return this.groupsService.createGroup(req.user.sub, req.user.deviceId, dto);
  }

  @Get()
  async listGroups(@Request() req: any): Promise<GroupResponseDto[]> {
    return this.groupsService.listGroups(req.user.sub);
  }

  @Get(':groupId')
  async getGroup(
    @Request() req: any,
    @Param('groupId') groupId: string,
  ): Promise<GroupDetailResponseDto> {
    return this.groupsService.getGroup(req.user.sub, groupId);
  }

  @Delete(':groupId')
  @HttpCode(HttpStatus.NO_CONTENT)
  async leaveGroup(
    @Request() req: any,
    @Param('groupId') groupId: string,
  ): Promise<void> {
    await this.groupsService.leaveGroup(req.user.sub, req.user.deviceId, groupId);
  }

  // ==========================================================================
  // Member Management
  // ==========================================================================

  @Post(':groupId/members')
  @HttpCode(HttpStatus.CREATED)
  async addMembers(
    @Request() req: any,
    @Param('groupId') groupId: string,
    @Body() dto: AddMembersDto,
  ): Promise<{ added: number }> {
    const count = await this.groupsService.addMembers(
      req.user.sub,
      req.user.deviceId,
      groupId,
      dto,
    );
    return { added: count };
  }

  @Delete(':groupId/members/:userId')
  @HttpCode(HttpStatus.NO_CONTENT)
  async removeMember(
    @Request() req: any,
    @Param('groupId') groupId: string,
    @Param('userId') userId: string,
    @Body() dto: RemoveMemberDto,
  ): Promise<void> {
    await this.groupsService.removeMember(
      req.user.sub,
      req.user.deviceId,
      groupId,
      userId,
      dto,
    );
  }

  // ==========================================================================
  // Group Messaging
  // ==========================================================================

  @Post(':groupId/messages')
  @HttpCode(HttpStatus.CREATED)
  async sendMessage(
    @Request() req: any,
    @Param('groupId') groupId: string,
    @Body() dto: SendGroupMessageDto,
  ): Promise<GroupMessageResponseDto> {
    return this.groupsService.sendMessage(
      req.user.sub,
      req.user.deviceId,
      groupId,
      dto,
    );
  }

  @Get(':groupId/messages')
  async getPendingMessages(
    @Request() req: any,
    @Param('groupId') groupId: string,
    @Query() query: GetPendingMessagesQueryDto,
  ): Promise<PendingGroupMessagesResponseDto> {
    return this.groupsService.getPendingMessages(
      req.user.sub,
      req.user.deviceId,
      groupId,
      query,
    );
  }

  @Post(':groupId/messages/ack')
  @HttpCode(HttpStatus.NO_CONTENT)
  async acknowledgeMessages(
    @Request() req: any,
    @Param('groupId') groupId: string,
    @Body() dto: AckGroupMessagesDto,
  ): Promise<void> {
    await this.groupsService.acknowledgeMessages(
      req.user.sub,
      req.user.deviceId,
      groupId,
      dto,
    );
  }
}
