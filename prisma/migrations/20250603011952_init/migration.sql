-- CreateTable
CREATE TABLE `usuarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cpf` VARCHAR(14) NOT NULL,
    `foto` VARCHAR(500) NULL,
    `email` VARCHAR(100) NOT NULL,
    `data_nascimento` DATETIME(3) NULL,
    `nome` VARCHAR(100) NOT NULL,
    `senha` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `professores` (
    `fk_usuarios_id` INTEGER NOT NULL,
    `siape` INTEGER NOT NULL,

    UNIQUE INDEX `professores_siape_key`(`siape`),
    PRIMARY KEY (`fk_usuarios_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `estudantes` (
    `fk_usuarios_id` INTEGER NOT NULL,
    `ra` INTEGER NOT NULL,

    UNIQUE INDEX `estudantes_ra_key`(`ra`),
    PRIMARY KEY (`fk_usuarios_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `disciplinas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `periodo` INTEGER NULL,
    `turno` VARCHAR(14) NULL,
    `nome` VARCHAR(100) NOT NULL,
    `qnt_total_aulas` INTEGER NULL,
    `carga_horaria` DOUBLE NOT NULL,
    `curso` VARCHAR(100) NOT NULL,
    `fk_professores_fk_usuarios_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jogo_da_velha` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `player1` VARCHAR(100) NULL,
    `player2` VARCHAR(100) NULL,
    `resultado` VARCHAR(100) NULL,
    `data_jogo` DATETIME(3) NULL,
    `fk_usuarios_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `matricula_se` (
    `fk_disciplinas_id` INTEGER NOT NULL,
    `fk_estudantes_fk_usuarios_id` INTEGER NOT NULL,
    `n1` DOUBLE NULL,
    `n2` DOUBLE NULL,
    `media` DOUBLE NULL,
    `faltas` INTEGER NULL,
    `situacao` VARCHAR(20) NULL,

    PRIMARY KEY (`fk_disciplinas_id`, `fk_estudantes_fk_usuarios_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `professores` ADD CONSTRAINT `professores_fk_usuarios_id_fkey` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `estudantes` ADD CONSTRAINT `estudantes_fk_usuarios_id_fkey` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disciplinas` ADD CONSTRAINT `disciplinas_fk_professores_fk_usuarios_id_fkey` FOREIGN KEY (`fk_professores_fk_usuarios_id`) REFERENCES `professores`(`fk_usuarios_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `jogo_da_velha` ADD CONSTRAINT `jogo_da_velha_fk_usuarios_id_fkey` FOREIGN KEY (`fk_usuarios_id`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `matricula_se` ADD CONSTRAINT `matricula_se_fk_disciplinas_id_fkey` FOREIGN KEY (`fk_disciplinas_id`) REFERENCES `disciplinas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `matricula_se` ADD CONSTRAINT `matricula_se_fk_estudantes_fk_usuarios_id_fkey` FOREIGN KEY (`fk_estudantes_fk_usuarios_id`) REFERENCES `estudantes`(`fk_usuarios_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
