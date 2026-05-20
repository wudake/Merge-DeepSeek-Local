import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { PrismaModule } from './database/prisma.module';
import { AuthModule } from './modules/auth/auth.module';
import { UsersModule } from './modules/users/users.module';
import { AccountsModule } from './modules/accounts/accounts.module';
import { TopicsModule } from './modules/topics/topics.module';
import { ContentsModule } from './modules/contents/contents.module';
import { SocialMediaCommandsModule } from './modules/social-commands/social-commands.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ['.env', '.env.local'],
    }),
    PrismaModule,
    AuthModule,
    UsersModule,
    AccountsModule,
    TopicsModule,
    ContentsModule,
    SocialMediaCommandsModule,
  ],
})
export class AppModule {}
