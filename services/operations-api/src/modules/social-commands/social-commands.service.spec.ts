import { Test, TestingModule } from '@nestjs/testing';
import { NotFoundException } from '@nestjs/common';
import { SocialMediaCommandsService } from './social-commands.service';
import { PrismaService } from '../../database/prisma.service';
import { createMockPrismaService } from '../../database/prisma.service.mock';

describe('SocialMediaCommandsService', () => {
  let service: SocialMediaCommandsService;
  let prisma: ReturnType<typeof createMockPrismaService>;

  const mockCommand = {
    id: 'cmd-1',
    name: '抖音带货脚本模板',
    content: '# 脚本模板\n\n1. 开场钩子\n2. 产品介绍\n3. 促单话术',
    createdAt: new Date('2026-05-18T08:00:00Z'),
    updatedAt: new Date('2026-05-18T08:30:00Z'),
  };

  beforeEach(async () => {
    prisma = createMockPrismaService();

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        SocialMediaCommandsService,
        { provide: PrismaService, useValue: prisma },
      ],
    }).compile();

    service = module.get<SocialMediaCommandsService>(SocialMediaCommandsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('create', () => {
    it('should create a social media command', async () => {
      const dto = { name: 'New Command', content: '# Hello' };
      prisma.socialMediaCommand.create.mockResolvedValue(mockCommand as any);

      const result = await service.create(dto);

      expect(prisma.socialMediaCommand.create).toHaveBeenCalledWith({
        data: dto,
      });
      expect(result).toEqual(mockCommand);
    });

    it('should create with null content when content is omitted', async () => {
      const dto = { name: 'Empty Command' };
      prisma.socialMediaCommand.create.mockResolvedValue({
        ...mockCommand,
        name: 'Empty Command',
        content: null,
      } as any);

      const result = await service.create(dto);

      expect(prisma.socialMediaCommand.create).toHaveBeenCalledWith({
        data: dto,
      });
      expect(result.name).toBe('Empty Command');
    });
  });

  describe('findAll', () => {
    it('should return all commands ordered by updatedAt desc', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([mockCommand] as any);

      const result = await service.findAll();

      expect(prisma.socialMediaCommand.findMany).toHaveBeenCalledWith({
        where: undefined,
        orderBy: { updatedAt: 'desc' },
      });
      expect(result).toHaveLength(1);
      expect(result[0]).toEqual(mockCommand);
    });

    it('should filter by keyword with case-insensitive search', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([mockCommand] as any);

      const result = await service.findAll('抖音');

      expect(prisma.socialMediaCommand.findMany).toHaveBeenCalledWith({
        where: {
          name: {
            contains: '抖音',
            mode: 'insensitive',
          },
        },
        orderBy: { updatedAt: 'desc' },
      });
      expect(result).toHaveLength(1);
    });

    it('should return empty array when no matches', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([] as any);

      const result = await service.findAll('nonexistent');

      expect(result).toHaveLength(0);
    });
  });

  describe('findOne', () => {
    it('should return command by id', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand as any);

      const result = await service.findOne('cmd-1');

      expect(prisma.socialMediaCommand.findUnique).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
      expect(result).toEqual(mockCommand);
    });

    it('should throw NotFoundException when command not found', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      await expect(service.findOne('unknown')).rejects.toThrow(NotFoundException);
      await expect(service.findOne('unknown')).rejects.toThrow('社媒指令不存在');
    });
  });

  describe('update', () => {
    it('should update command when it exists', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand as any);
      prisma.socialMediaCommand.update.mockResolvedValue({
        ...mockCommand,
        name: 'Updated Name',
        content: '# Updated',
      } as any);

      const dto = { name: 'Updated Name', content: '# Updated' };
      const result = await service.update('cmd-1', dto);

      expect(prisma.socialMediaCommand.findUnique).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
      expect(prisma.socialMediaCommand.update).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
        data: dto,
      });
      expect(result.name).toBe('Updated Name');
      expect(result.content).toBe('# Updated');
    });

    it('should throw NotFoundException when updating non-existent command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      await expect(service.update('unknown', { name: 'X' })).rejects.toThrow(
        NotFoundException,
      );
      expect(prisma.socialMediaCommand.update).not.toHaveBeenCalled();
    });

    it('should support partial update', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand as any);
      prisma.socialMediaCommand.update.mockResolvedValue({
        ...mockCommand,
        name: 'Only Name Updated',
      } as any);

      const result = await service.update('cmd-1', { name: 'Only Name Updated' });

      expect(prisma.socialMediaCommand.update).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
        data: { name: 'Only Name Updated' },
      });
      expect(result.name).toBe('Only Name Updated');
    });
  });

  describe('remove', () => {
    it('should delete command when it exists', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand as any);
      prisma.socialMediaCommand.delete.mockResolvedValue(mockCommand as any);

      const result = await service.remove('cmd-1');

      expect(prisma.socialMediaCommand.findUnique).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
      expect(prisma.socialMediaCommand.delete).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
      expect(result).toEqual(mockCommand);
    });

    it('should throw NotFoundException when deleting non-existent command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      await expect(service.remove('unknown')).rejects.toThrow(NotFoundException);
      expect(prisma.socialMediaCommand.delete).not.toHaveBeenCalled();
    });
  });
});
