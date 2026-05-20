import { Test, TestingModule } from '@nestjs/testing';
import { SocialMediaCommandsController } from './social-commands.controller';
import { SocialMediaCommandsService } from './social-commands.service';
import { JwtAuthGuard } from '../../common/guards/jwt-auth.guard';
import { RolesGuard } from '../../common/guards/roles.guard';

describe('SocialMediaCommandsController', () => {
  let controller: SocialMediaCommandsController;
  let service: jest.Mocked<Partial<SocialMediaCommandsService>>;

  const mockCommand = {
    id: 'cmd-1',
    name: '抖音带货脚本模板',
    content: '# 脚本模板\n\n1. 开场钩子',
    createdAt: new Date('2026-05-18T08:00:00Z'),
    updatedAt: new Date('2026-05-18T08:30:00Z'),
  };

  beforeEach(async () => {
    service = {
      create: jest.fn().mockResolvedValue(mockCommand),
      findAll: jest.fn().mockResolvedValue([mockCommand]),
      findOne: jest.fn().mockResolvedValue(mockCommand),
      update: jest.fn().mockResolvedValue(mockCommand),
      remove: jest.fn().mockResolvedValue(mockCommand),
    };

    const module: TestingModule = await Test.createTestingModule({
      controllers: [SocialMediaCommandsController],
      providers: [{ provide: SocialMediaCommandsService, useValue: service }],
    })
      .overrideGuard(JwtAuthGuard)
      .useValue({ canActivate: () => true })
      .overrideGuard(RolesGuard)
      .useValue({ canActivate: () => true })
      .compile();

    controller = module.get<SocialMediaCommandsController>(SocialMediaCommandsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  describe('create', () => {
    it('should create a command', async () => {
      const dto = { name: 'New Command', content: '# New' };
      const result = await controller.create(dto);

      expect(service.create).toHaveBeenCalledWith(dto);
      expect(result).toEqual(mockCommand);
    });

    it('should create command without content', async () => {
      const dto = { name: 'Name Only' };
      const result = await controller.create(dto);

      expect(service.create).toHaveBeenCalledWith(dto);
      expect(result).toEqual(mockCommand);
    });
  });

  describe('findAll', () => {
    it('should return all commands without keyword', async () => {
      const result = await controller.findAll();

      expect(service.findAll).toHaveBeenCalledWith(undefined);
      expect(result).toEqual([mockCommand]);
    });

    it('should return filtered commands with keyword', async () => {
      const result = await controller.findAll('抖音');

      expect(service.findAll).toHaveBeenCalledWith('抖音');
      expect(result).toEqual([mockCommand]);
    });
  });

  describe('findOne', () => {
    it('should return command by id', async () => {
      const result = await controller.findOne('cmd-1');

      expect(service.findOne).toHaveBeenCalledWith('cmd-1');
      expect(result).toEqual(mockCommand);
    });
  });

  describe('update', () => {
    it('should update command', async () => {
      const dto = { name: 'Updated', content: '# Updated' };
      const result = await controller.update('cmd-1', dto);

      expect(service.update).toHaveBeenCalledWith('cmd-1', dto);
      expect(result).toEqual(mockCommand);
    });

    it('should support partial update', async () => {
      const dto = { name: 'Updated Name Only' };
      const result = await controller.update('cmd-1', dto);

      expect(service.update).toHaveBeenCalledWith('cmd-1', dto);
      expect(result).toEqual(mockCommand);
    });
  });

  describe('remove', () => {
    it('should delete command', async () => {
      const result = await controller.remove('cmd-1');

      expect(service.remove).toHaveBeenCalledWith('cmd-1');
      expect(result).toEqual(mockCommand);
    });
  });
});
