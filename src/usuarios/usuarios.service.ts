// Importa o PrismaService, que é o serviço criado para encapsular e gerenciar a instância do Prisma dentro do NestJS
import { PrismaService } from '../prisma.service';

//Agora dentro da classe, adicione os dois métodos
@Injectable()
export class UsuariosService {
    constructor(private prisma: PrismaService) { }
    // Esse método é necessário pois o Prisma não fornece automaticamente buscas por campos arbitrários
    async findByEmail(email: string) {
        // Utiliza o método findFirst do Prisma para encontrar o primeiro usuário cujo email corresponde ao fornecido
        return await this.prisma.usuario.findFirst({
            where: { email }, // Condição de busca: email igual ao fornecido
        });
    }
    async findAllSafe() {
        // Busca todos os usuários no banco de dados
        const usuarios = await this.prisma.usuario.findMany();
        // Para cada usuário encontrado, remove o campo 'senha' e retorna os demais dados
        return usuarios.map(({ senha, ...rest }) => rest);
    }
    // O restante dos métodos, incluindo 'create()', permanece inalterado
    // Exemplo:
    async create(data: any) {
        return await this.prisma.usuario.create({
            data,
        });
    }
    // Outras funções que já estavam implementadas seguem normalmente
    // Método para buscar um único usuário pelo ID
    async findOne(id: number) {
        // Utiliza `findUnique` com filtro `where` para buscar um usuário com o ID específico
        return await prisma.usuario.findUnique({ where: { id } });
    }
    // Método para atualizar um usuário com base no ID
    async update(id: number, data: any) {
        // Usa o método `update` do Prisma, passando o ID e os novos dados a serem atualizados
        return await prisma.usuario.update({
            where: { id }, // Identifica qual usuário atualizar
            data, // Dados que serão atualizados
        });
    }
    // Método para deletar (remover) um usuário com base no ID
    async remove(id: number) {
        // Chama `delete` passando o ID para remover o usuário correspondente da tabela
        return await prisma.usuario.delete({ where: { id } });
    }
}
