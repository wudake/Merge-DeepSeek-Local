import { Module } from '@nestjs/common';
import { SocialMediaCommandsController } from './social-commands.controller';
import { SocialMediaCommandsService } from './social-commands.service';

@Module({
  controllers: [SocialMediaCommandsController],
  providers: [SocialMediaCommandsService],
})
export class SocialMediaCommandsModule {}
