import { Module } from '@nestjs/common';
import { EstudantesService } from './estudantes.service';
import { EstudantesController } from './estudantes.controller';

@Module({
  providers: [EstudantesService],
  controllers: [EstudantesController]
})
export class EstudantesModule {}
