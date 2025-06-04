import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function main() {
// Usuários
await prisma.usuario.createMany({
data: [
{
id: 2,
cpf: '11111111111',
foto: '93b163f73780fecd32914da83a2b4a15.avif',
email: 'aurelio@gmail.com',
data_nascimento: new Date('2023-06-14'),
nome: 'Aurelio Junior',
senha: '123',
},
{
id: 3,
cpf: '1333123123',
foto: '8c251fdfa28a245ce68ae6d1531cd260.webp',
email: 'camilap@gmail.com',
data_nascimento: new Date('2023-06-14'),
nome: 'Camila',
senha: '123',
},
{
id: 4,
cpf: '123312312',
foto: '2dc85bb4902b6b68dc41d4b80a7addaf.jpg',
email: 'leandro@gmail.com',
data_nascimento: new Date('2023-06-15'),
nome: 'Leandro Steffen',
senha: '123',
},
{
id: 5,
cpf: '123213123123',
foto: '5c5b41d23a686f62b030041349c3995f.jpg',
email: 'ricardo@gmail.com',
data_nascimento: new Date('2023-06-09'),
nome: 'Ricardo',
senha: '123',
},
{
id: 8,
cpf: '12345678911',
foto: '8adb7c513055483e133039ccc4fc66e0.webp',
email: 'cat@gmail.com',
data_nascimento: new Date('2023-10-06'),
nome: 'cat',
senha: '123',
},
],
});
// Professores
await prisma.professor.createMany({
data: [
{ siape: 1, fk_usuarios_id: 2 },
{ siape: 2, fk_usuarios_id: 3 },
{ siape: 3, fk_usuarios_id: 4 },
{ siape: 4, fk_usuarios_id: 5 },
],
});
// Estudantes
await prisma.estudante.create({
data: {
ra: 4,
fk_usuarios_id: 8,
},
});
// Disciplinas
await prisma.disciplina.createMany({
data: [
{
id: 11,
periodo: 1,
turno: 'Noturno',
nome: 'Algoritmos 1',
qnt_total_aulas: 80,
carga_horaria: 60,
curso: 'PROEJA-Informática para Internet',
fk_professores_fk_usuarios_id: 2,
},
{
id: 12,
periodo: 1,
turno: 'Noturno',
nome: 'Projeto e Design',
qnt_total_aulas: 100,
carga_horaria: 75,
curso: 'PROEJA-Informática para Internet',
fk_professores_fk_usuarios_id: 3,
},
{
id: 13,
periodo: 1,
turno: 'Noturno',
nome: 'Filosofia 1',
qnt_total_aulas: 40,
carga_horaria: 30,
curso: 'PROEJA-Informática para Internet',
fk_professores_fk_usuarios_id: 5,
},
{
id: 14,
periodo: 1,
turno: 'Noturno',
nome: 'Redes de Computadores',
qnt_total_aulas: 80,
carga_horaria: 60,
curso: 'PROEJA-Informática para Internet',
fk_professores_fk_usuarios_id: 4,
},
{
id: 15,
periodo: 1,
turno: 'Noturno',
nome: 'Algoritmos 2',
qnt_total_aulas: 80,
carga_horaria: 60,
curso: 'Licenciatura em Computação',
fk_professores_fk_usuarios_id: 2,
},
],
});
console.log('Dados inseridos com sucesso!');
}
main()
.catch((e) => {
console.error(e);
process.exit(1);
})
.finally(async () => {
await prisma.$disconnect();
});