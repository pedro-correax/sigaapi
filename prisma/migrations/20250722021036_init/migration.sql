-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "cpf" VARCHAR(14) NOT NULL,
    "foto" VARCHAR(500),
    "email" VARCHAR(100) NOT NULL,
    "data_nascimento" TIMESTAMP(3),
    "nome" VARCHAR(100) NOT NULL,
    "senha" VARCHAR(100) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professores" (
    "fk_usuarios_id" INTEGER NOT NULL,
    "siape" INTEGER NOT NULL,

    CONSTRAINT "professores_pkey" PRIMARY KEY ("fk_usuarios_id")
);

-- CreateTable
CREATE TABLE "estudantes" (
    "fk_usuarios_id" INTEGER NOT NULL,
    "ra" INTEGER NOT NULL,

    CONSTRAINT "estudantes_pkey" PRIMARY KEY ("fk_usuarios_id")
);

-- CreateTable
CREATE TABLE "disciplinas" (
    "id" SERIAL NOT NULL,
    "periodo" INTEGER,
    "turno" VARCHAR(14),
    "nome" VARCHAR(100) NOT NULL,
    "qnt_total_aulas" INTEGER,
    "carga_horaria" DOUBLE PRECISION NOT NULL,
    "curso" VARCHAR(100) NOT NULL,
    "fk_professores_fk_usuarios_id" INTEGER NOT NULL,

    CONSTRAINT "disciplinas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jogo_da_velha" (
    "id" SERIAL NOT NULL,
    "player1" VARCHAR(100),
    "player2" VARCHAR(100),
    "resultado" VARCHAR(100),
    "data_jogo" TIMESTAMP(3),
    "fk_usuarios_id" INTEGER NOT NULL,

    CONSTRAINT "jogo_da_velha_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "matricula_se" (
    "fk_disciplinas_id" INTEGER NOT NULL,
    "fk_estudantes_fk_usuarios_id" INTEGER NOT NULL,
    "n1" DOUBLE PRECISION,
    "n2" DOUBLE PRECISION,
    "media" DOUBLE PRECISION,
    "faltas" INTEGER,
    "situacao" VARCHAR(20),

    CONSTRAINT "matricula_se_pkey" PRIMARY KEY ("fk_disciplinas_id","fk_estudantes_fk_usuarios_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "professores_siape_key" ON "professores"("siape");

-- CreateIndex
CREATE UNIQUE INDEX "estudantes_ra_key" ON "estudantes"("ra");

-- AddForeignKey
ALTER TABLE "professores" ADD CONSTRAINT "professores_fk_usuarios_id_fkey" FOREIGN KEY ("fk_usuarios_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estudantes" ADD CONSTRAINT "estudantes_fk_usuarios_id_fkey" FOREIGN KEY ("fk_usuarios_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplinas" ADD CONSTRAINT "disciplinas_fk_professores_fk_usuarios_id_fkey" FOREIGN KEY ("fk_professores_fk_usuarios_id") REFERENCES "professores"("fk_usuarios_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogo_da_velha" ADD CONSTRAINT "jogo_da_velha_fk_usuarios_id_fkey" FOREIGN KEY ("fk_usuarios_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matricula_se" ADD CONSTRAINT "matricula_se_fk_disciplinas_id_fkey" FOREIGN KEY ("fk_disciplinas_id") REFERENCES "disciplinas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matricula_se" ADD CONSTRAINT "matricula_se_fk_estudantes_fk_usuarios_id_fkey" FOREIGN KEY ("fk_estudantes_fk_usuarios_id") REFERENCES "estudantes"("fk_usuarios_id") ON DELETE RESTRICT ON UPDATE CASCADE;
