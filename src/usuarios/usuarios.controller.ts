import {
Controller,
Get,
Post,
Body,
Param,
Put,
Delete,
UseGuards
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { UsuariosService } from './usuarios.service';
@Controller('usuarios')
export class UsuariosController {
constructor(private readonly usuariosService: UsuariosService) {}
// Rota pública: POST /usuarios → cria um novo usuário (não autenticada)
@Post()
create(@Body() body: any) {
return this.usuariosService.create(body);
}
// Rota protegida: GET /usuarios → lista todos os usuários
@UseGuards(AuthGuard('jwt'))
@Get()
async findAllSafe() {
return this.usuariosService.findAllSafe();
}
// Rota protegida: GET /usuarios/:id → busca um usuário específico
@UseGuards(AuthGuard('jwt'))
@Get(':id')
findOne(@Param('id') id: string) {
return this.usuariosService.findOne(+id);
}
// Rota protegida: PUT /usuarios/:id → atualiza um usuário
@UseGuards(AuthGuard('jwt'))
@Put(':id')
update(@Param('id') id: string, @Body() body: any) {
return this.usuariosService.update(+id, body);
}
// Rota protegida: DELETE /usuarios/:id → remove um usuário
@UseGuards(AuthGuard('jwt'))
@Delete(':id')
remove(@Param('id') id: string) {
return this.usuariosService.remove(+id);
}
}