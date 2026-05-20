import { IsString, IsOptional, IsNotEmpty } from 'class-validator';

export class CreateSocialMediaCommandDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsOptional()
  content?: string;
}

export class UpdateSocialMediaCommandDto {
  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsOptional()
  content?: string;
}
