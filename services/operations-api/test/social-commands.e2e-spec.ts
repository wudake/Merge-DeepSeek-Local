import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication, ValidationPipe } from '@nestjs/common';
import request from 'supertest';
import { AppModule } from '../src/app.module';
import { PrismaService } from '../src/database/prisma.service';
import { JwtAuthGuard } from '../src/common/guards/jwt-auth.guard';
import { RolesGuard } from '../src/common/guards/roles.guard';

describe('SocialMediaCommandsController (e2e)', () => {
  let app: INestApplication;
  let prisma: any;

  const mockCommand = {
    id: 'cmd-1',
    name: '抖音带货脚本',
    content: '# 脚本\n1. 钩子',
    createdAt: new Date('2026-05-18T08:00:00Z'),
    updatedAt: new Date('2026-05-18T09:00:00Z'),
  };

  beforeAll(async () => {
    prisma = {
      socialMediaCommand: {
        create: jest.fn(),
        findMany: jest.fn(),
        findUnique: jest.fn(),
        update: jest.fn(),
        delete: jest.fn(),
      },
      $connect: jest.fn(),
      $disconnect: jest.fn(),
    };

    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    })
      .overrideProvider(PrismaService)
      .useValue(prisma)
      .overrideGuard(JwtAuthGuard)
      .useValue({ canActivate: () => true })
      .overrideGuard(RolesGuard)
      .useValue({ canActivate: () => true })
      .compile();

    app = moduleFixture.createNestApplication();
    app.setGlobalPrefix('api/v1');
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        transform: true,
        forbidNonWhitelisted: true,
      }),
    );
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('POST /api/v1/social-commands', () => {
    it('should create a new social media command', async () => {
      prisma.socialMediaCommand.create.mockResolvedValue(mockCommand);

      const response = await request(app.getHttpServer())
        .post('/api/v1/social-commands')
        .send({ name: '抖音带货脚本', content: '# 脚本\n1. 钩子' })
        .expect(201);

      expect(response.body.name).toBe('抖音带货脚本');
      expect(response.body.content).toBe('# 脚本\n1. 钩子');
      expect(prisma.socialMediaCommand.create).toHaveBeenCalledWith({
        data: { name: '抖音带货脚本', content: '# 脚本\n1. 钩子' },
      });
    });

    it('should reject request without name', async () => {
      const response = await request(app.getHttpServer())
        .post('/api/v1/social-commands')
        .send({ content: '# 脚本' })
        .expect(400);

      expect(response.body.message).toEqual(
        expect.arrayContaining([expect.stringContaining('name')]),
      );
    });

    it('should create with null content when content omitted', async () => {
      const createdWithNull = {
        ...mockCommand,
        id: 'cmd-2',
        name: 'Only Name',
        content: null,
      };
      prisma.socialMediaCommand.create.mockResolvedValue(createdWithNull);

      const response = await request(app.getHttpServer())
        .post('/api/v1/social-commands')
        .send({ name: 'Only Name' })
        .expect(201);

      expect(response.body.name).toBe('Only Name');
      expect(response.body.content).toBeNull();
    });
  });

  describe('GET /api/v1/social-commands', () => {
    it('should return all commands', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([mockCommand]);

      const response = await request(app.getHttpServer())
        .get('/api/v1/social-commands')
        .expect(200);

      expect(response.body).toHaveLength(1);
      expect(response.body[0].name).toBe('抖音带货脚本');
      expect(prisma.socialMediaCommand.findMany).toHaveBeenCalledWith({
        where: undefined,
        orderBy: { updatedAt: 'desc' },
      });
    });

    it('should filter by keyword', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([mockCommand]);

      const response = await request(app.getHttpServer())
        .get('/api/v1/social-commands?keyword=抖音')
        .expect(200);

      expect(response.body).toHaveLength(1);
      expect(prisma.socialMediaCommand.findMany).toHaveBeenCalledWith({
        where: {
          name: {
            contains: '抖音',
            mode: 'insensitive',
          },
        },
        orderBy: { updatedAt: 'desc' },
      });
    });

    it('should return empty array when no matches', async () => {
      prisma.socialMediaCommand.findMany.mockResolvedValue([]);

      const response = await request(app.getHttpServer())
        .get('/api/v1/social-commands?keyword=nonexistent')
        .expect(200);

      expect(response.body).toHaveLength(0);
    });
  });

  describe('GET /api/v1/social-commands/:id', () => {
    it('should return command by id', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand);

      const response = await request(app.getHttpServer())
        .get('/api/v1/social-commands/cmd-1')
        .expect(200);

      expect(response.body.id).toBe('cmd-1');
      expect(response.body.name).toBe('抖音带货脚本');
      expect(prisma.socialMediaCommand.findUnique).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
    });

    it('should return 404 when command not found', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      const response = await request(app.getHttpServer())
        .get('/api/v1/social-commands/unknown')
        .expect(404);

      expect(response.body.message).toBe('社媒指令不存在');
    });
  });

  describe('PATCH /api/v1/social-commands/:id', () => {
    it('should update command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand);
      prisma.socialMediaCommand.update.mockResolvedValue({
        ...mockCommand,
        name: 'Updated Name',
      });

      const response = await request(app.getHttpServer())
        .patch('/api/v1/social-commands/cmd-1')
        .send({ name: 'Updated Name' })
        .expect(200);

      expect(response.body.name).toBe('Updated Name');
      expect(prisma.socialMediaCommand.update).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
        data: { name: 'Updated Name' },
      });
    });

    it('should return 404 when updating non-existent command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      const response = await request(app.getHttpServer())
        .patch('/api/v1/social-commands/unknown')
        .send({ name: 'X' })
        .expect(404);

      expect(response.body.message).toBe('社媒指令不存在');
    });

    it('should reject invalid payload', async () => {
      const response = await request(app.getHttpServer())
        .patch('/api/v1/social-commands/cmd-1')
        .send({ name: 123 })
        .expect(400);

      expect(response.body.message).toBeDefined();
    });
  });

  describe('DELETE /api/v1/social-commands/:id', () => {
    it('should delete command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(mockCommand);
      prisma.socialMediaCommand.delete.mockResolvedValue(mockCommand);

      const response = await request(app.getHttpServer())
        .delete('/api/v1/social-commands/cmd-1')
        .expect(200);

      expect(response.body.id).toBe('cmd-1');
      expect(prisma.socialMediaCommand.delete).toHaveBeenCalledWith({
        where: { id: 'cmd-1' },
      });
    });

    it('should return 404 when deleting non-existent command', async () => {
      prisma.socialMediaCommand.findUnique.mockResolvedValue(null);

      const response = await request(app.getHttpServer())
        .delete('/api/v1/social-commands/unknown')
        .expect(404);

      expect(response.body.message).toBe('社媒指令不存在');
    });
  });
});
