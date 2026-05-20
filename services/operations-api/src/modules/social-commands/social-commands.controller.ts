import { Controller, Get, Post, Body, Param, Patch, Delete, Query, UseGuards } from '@nestjs/common';
import { ApiTags, ApiBearerAuth, ApiOperation, ApiQuery } from '@nestjs/swagger';
import { SocialMediaCommandsService } from './social-commands.service';
import { JwtAuthGuard } from '../../common/guards/jwt-auth.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreateSocialMediaCommandDto, UpdateSocialMediaCommandDto } from './dto';

@ApiTags('社媒指令')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard, RolesGuard)
@Controller('social-commands')
export class SocialMediaCommandsController {
  constructor(private service: SocialMediaCommandsService) {}

  @Post()
  @Roles(UserRole.SUPER_ADMIN, UserRole.MANAGER, UserRole.OPERATOR)
  @ApiOperation({ summary: '创建社媒指令' })
  async create(@Body() dto: CreateSocialMediaCommandDto) {
    return this.service.create(dto);
  }

  @Get()
  @Roles(UserRole.SUPER_ADMIN, UserRole.MANAGER, UserRole.OPERATOR)
  @ApiOperation({ summary: '社媒指令列表' })
  @ApiQuery({ name: 'keyword', required: false })
  async findAll(@Query('keyword') keyword?: string) {
    return this.service.findAll(keyword);
  }

  @Get(':id')
  @Roles(UserRole.SUPER_ADMIN, UserRole.MANAGER, UserRole.OPERATOR)
  @ApiOperation({ summary: '社媒指令详情' })
  async findOne(@Param('id') id: string) {
    return this.service.findOne(id);
  }

  @Patch(':id')
  @Roles(UserRole.SUPER_ADMIN, UserRole.MANAGER, UserRole.OPERATOR)
  @ApiOperation({ summary: '更新社媒指令' })
  async update(@Param('id') id: string, @Body() dto: UpdateSocialMediaCommandDto) {
    return this.service.update(id, dto);
  }

  @Delete(':id')
  @Roles(UserRole.SUPER_ADMIN, UserRole.MANAGER, UserRole.OPERATOR)
  @ApiOperation({ summary: '删除社媒指令' })
  async remove(@Param('id') id: string) {
    return this.service.remove(id);
  }
}
