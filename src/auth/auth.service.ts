import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsuariosService } from '../usuarios/usuarios.service';
@Injectable()
export class AuthService {
    constructor(
        private usuariosService: UsuariosService,
        private jwtService: JwtService
    ) { }
    async validateUser(email: string, senha: string) {
        const user = await this.usuariosService.findByEmail(email);
        if (user && user.senha === senha) {
            const { senha, ...safeUser } = user;
            return safeUser;
        }
        return null;
    }
    async login(user: any) {
        const payload = { email: user.email, sub: user.id };
        return {
            access_token: this.jwtService.sign(payload),
        };
    }
}
