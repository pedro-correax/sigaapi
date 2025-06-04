import { Module } from '@nestjs/common';
import { ProfessoresService } from './professores.service';
import { ProfessoresController } from './professores.controller';

@Module({
  providers: [ProfessoresService],
  controllers: [ProfessoresController]
})
export class ProfessoresModule {}
