import { Module } from '@nestjs/common';
import { JogosService } from './jogos.service';
import { JogosController } from './jogos.controller';

@Module({
  providers: [JogosService],
  controllers: [JogosController]
})
export class JogosModule {}
