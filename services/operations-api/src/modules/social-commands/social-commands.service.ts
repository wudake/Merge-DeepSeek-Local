import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../database/prisma.service';
import { CreateSocialMediaCommandDto, UpdateSocialMediaCommandDto } from './dto';

@Injectable()
export class SocialMediaCommandsService {
  constructor(private prisma: PrismaService) {}

  async create(dto: CreateSocialMediaCommandDto) {
    return this.prisma.socialMediaCommand.create({
      data: dto,
    });
  }

  async findAll(keyword?: string) {
    return this.prisma.socialMediaCommand.findMany({
      where: keyword
        ? {
            name: {
              contains: keyword,
              mode: 'insensitive',
            },
          }
        : undefined,
      orderBy: { updatedAt: 'desc' },
    });
  }

  async findOne(id: string) {
    const item = await this.prisma.socialMediaCommand.findUnique({
      where: { id },
    });
    if (!item) {
      throw new NotFoundException('社媒指令不存在');
    }
    return item;
  }

  async update(id: string, dto: UpdateSocialMediaCommandDto) {
    await this.findOne(id);
    return this.prisma.socialMediaCommand.update({
      where: { id },
      data: dto,
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.socialMediaCommand.delete({
      where: { id },
    });
  }
}
