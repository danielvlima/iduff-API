CREATE TABLE tipo_usuario (
	id int(11) NOT null AUTO_INCREMENT,
    tipo_usuario varchar(20) NOT null,
    PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE usuario_curso(
	id int(11) not null AUTO_INCREMENT,
    id_usuario int (11) not null,
    id_curso int(11) not null,
    PRIMARY KEY (id),
    KEY id_usuario(id_usuario), 
    KEY id_curso(id_curso) 
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE curso(
	id int(11) not null AUTO_INCREMENT,
    nome_curso varchar (20) not null,
    id_departamento int(11) not null,
    PRIMARY KEY (id),
    KEY id_departamento(id_departamento)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE periodo_letivo(
    id int(11) not null AUTO_INCREMENT,
    ano Date not null,
    semestre int(1) not null,
    id_status int(11) not null,
    id_materias int(11) not null,
    PRIMARY KEY (id),
    KEY id_status(id_status),
    KEY id_materias(id_materias)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE status(
    id int(11) not null AUTO_INCREMENT,
    tipo_status varchar(20) NOT null,
    PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE departamento(
    id int(11) not null AUTO_INCREMENT,
    nome varchar(40) NOT null,
    area_conhecimento varchar(20) NOT null,
    campus_sede varchar(20) NOT null,
    id_coordenador int(11) not null,
    PRIMARY KEY (id),
    KEY id_coordenador(id_coordenador)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE professores_departamento(
    id int(11) not null AUTO_INCREMENT,
    id_departamento int(11) not null,
    id_professor int(11) not null,
    id_professor_materia int(11) not null,
    PRIMARY KEY (id),
    KEY id_departamento(id_departamento),
    KEY id_professor(id_professor),
    KEY id_professor_materia(id_professor_materia)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE professor_materia(
    id int(11) not null AUTO_INCREMENT,
    id_materia int(11) not null,
    id_professor int(11) not null,
    PRIMARY KEY (id),
    KEY id_professor(id_professor),
    KEY id_materia(id_materia)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE materia(
    id int(11) not null AUTO_INCREMENT,
    nome varchar(40) NOT null,
    area_conhecimento varchar(40) NOT null,
    carga_horaria int(6) NOT null,
    PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE pre_requisito(
    id int(11) not null AUTO_INCREMENT,
    id_materia int(11) not null,
    id_materia_pre int(11) not null,
    PRIMARY KEY (id), 
    KEY id_materia(id_materia),
    KEY id_materia_pre(id_materia_pre)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE turma(
    id int(11) not null AUTO_INCREMENT,
    nome varchar(40) NOT null,
    codigo varchar(20) NOT null,
    calendario varchar(20) NOT null,
    numero_vagas int(6) NOT null,
    sala varchar(10) NOT null,
    id_professor int(11) not null,
    id_alunos_turma int(11) not null,
    PRIMARY KEY (id), 
    KEY id_professor(id_professor),
    KEY id_alunos_turma(id_alunos_turma)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE alunos_turma(
    id int(11) not null AUTO_INCREMENT,
    id_turma int(11) not null,
    id_aluno int(11) not null,
    nota float(5),
    PRIMARY KEY (id), 
    KEY id_turma(id_turma),
    KEY id_aluno(id_aluno)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

ALTER TABLE `usuario_curso`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`);

ALTER TABLE `curso`
  ADD CONSTRAINT `fk_departamentoCurso` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);

ALTER TABLE `materia` ADD CONSTRAINT `fk_materiaCurso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)

ALTER TABLE `periodo_letivo`
ADD CONSTRAINT `fk_perLetStatus` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
ADD CONSTRAINT `fk_perLetMaterias` FOREIGN KEY (`id_materias`) REFERENCES `materia` (`id`);

ALTER TABLE `departamento`
ADD CONSTRAINT `fk_departCoord` FOREIGN KEY (`id_coordenador`) REFERENCES `usuario` (`id`);

ALTER TABLE `professores_departamento`
ADD CONSTRAINT `fk_profDep` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
ADD CONSTRAINT `fk_profMateria` FOREIGN KEY (`id_professor_materia`) REFERENCES `professor_materia` (`id`),
ADD CONSTRAINT `fk_professor` FOREIGN KEY (`id_professor`) REFERENCES `usuario` (`id`);

ALTER TABLE `professor_materia`
ADD CONSTRAINT `fk_profMat` FOREIGN KEY (`id_professor`) REFERENCES `usuario` (`id`);

ALTER TABLE `pre_requisito`
ADD CONSTRAINT `fk_preMat` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
ADD CONSTRAINT `fk_preMatpre` FOREIGN KEY (`id_materia_pre`) REFERENCES `materia` (`id`);

ALTER TABLE `turma`
ADD CONSTRAINT `fk_turmaProf` FOREIGN KEY (`id_professor`) REFERENCES `professor_materia` (`id`),
ADD CONSTRAINT `fk_turmaAlunos` FOREIGN KEY (`id_alunos_turma`) REFERENCES `alunos_turma` (`id`);

ALTER TABLE `alunos_turma`
ADD CONSTRAINT `fk_alunoTurma` FOREIGN KEY (`id_aluno`) REFERENCES `usuario` (`id`),
ADD CONSTRAINT `fk_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`);