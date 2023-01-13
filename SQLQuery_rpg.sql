use rpg --DDL
go

create database rpg
go

create table usuario (
idusuario int identity not null,
rg numeric (10,0) unique not null, /* chave secundária */
email varchar (40) unique not null, /* chave secundária */
senha varchar (10) not null,
nome varchar (50) not null,
primary key (idusuario)
)
go

create table classe (
idclasse int identity not null,
nome varchar (50) unique not null, /* chave secundária */
descricao varchar (150),
primary key (idclasse)
)
go

create table personagem (
idpersonagem int identity not null,
nome varchar (20) unique not null, /* chave secundária */
idclasse int not null,
idusuario int  unique not null, /* chave secundária */
foreign key (idclasse) references classe,
foreign key (idusuario) references usuario,
primary key (idpersonagem)
)
go

create index ixpersonagem_classe_usuario on personagem (idclasse, idusuario)
go

create table habilidade (
idhabilidade int identity not null,
nome varchar (100) unique not null, /* chave secundária */
descricao varchar (150) not null,
primary key (idhabilidade)
)
go

create table habilidade_classe (
idhabilidade int not null,
idclasse int not null,
foreign key (idhabilidade) references habilidade,
foreign key (idclasse) references classe,
primary key (idhabilidade, idclasse)
)
go

create index ixhabilidade_classe on habilidade_classe (idhabilidade)
go

drop table habilidade, habilidade_classe, usuario, classe, personagem


--DML (MANIPULAÇÃO DE DADOS)


INSERT INTO usuario VALUES (494480000, 'ulysses.alessandro10@gmail.com', 87654321, 'ulysses')
INSERT INTO classe VALUES ('barbaro', 'poder de defesa absoluto')
INSERT INTO personagem ('deubug', 1, 1)
INSERT INTO habilidade VALUES ('lança mortal', 'perfuração infinita'), ('lança chamas', 'chama do vulcão')
INSERT INTO habilidade_classe VALUES (1, 1), (1,2)


INSERT INTO usuario VALUES (494480001, 'alessandro10@gmail.com', 87654321, 'ulys')
INSERT INTO classe VALUES ('monge', 'poder psiquico de monge')
INSERT INTO personagem ('bitbug', 2, 2)
INSERT INTO habilidade VALUES ('recuperar vida', 'vida infinita')
INSERT INTO habilidade_classe VALUES (2, 2), (2, 3)

--DQL

select * from usuario 

select * from classe

select * from personagem

select * from habilidade 

select * from habilidade_classe


delete from usuario

delete from classe

UPDATE usuario
SET senha = '123456'
where idusuario = 1

select p.nome, c.nome 'classe', c.descricao from personagem p join classe c on p.idclasse = c.idclasse

CREATE LOGIN aluno
WITH PASSWORD = '1234'
CREATE USER aluno FOR LOGIN aluno
GRANT SELECT TO aluno

