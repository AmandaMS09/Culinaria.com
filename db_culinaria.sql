create database db_culinaria;
use db_culinaria;

create table tbl_usuario(
id_usuario int unsigned not null auto_increment,
nome varchar(70) not null,
email varchar(45) not null,
telefone int(11) not null, -- 31900000000
senha varchar(30) not null,
foto_perfil varchar(150) default "./img/foto_perfil.png", -- default = imagem padrão em uma pasta img
primary key(id_usuario)
)engine = innodb;

create table tbl_restaurante(
id_restaurante int unsigned not null auto_increment,
id_usuario int unsigned not null,
nome_restaurante varchar(70) not null,
descricao text not null,
hora_funcionamento char(13) not null, -- hh:mm - hh:mm
cupom_desconto varchar(25), -- não obrigatório
site varchar(150), -- não obrigatório
link_app_entrega varchar(150), -- não obrigatório
telefone_comercial varchar(150), -- não obrigatório por causa do telefone na tabela usuario
foto_restaurante varchar(150) default "./img/foto_restaurante.png", -- default = imagem padrão em uma pasta img
primary key(id_restaurante),
foreign key(id_usuario) references tbl_usuario(id_usuario)
)engine = innodb;

create table tbl_endereco(
id_endereco int unsigned not null auto_increment,
id_usuario int unsigned not null,
cep int(8) unsigned not null,
estado char(2) not null,
cidade varchar(30) not null,
bairro varchar(30) not null,
logradouro varchar(30) not null,
numero int(6) unsigned not null,
complemento varchar(30),
referencias varchar(60),
primary key(id_endereco),
foreign key(id_usuario) references tbl_usuario(id_usuario)
)engine = innodb;

create table tbl_categoria(
id_categoria int unsigned not null auto_increment,
nome varchar(20) not null,
primary key(id_categoria)
)engine = innodb;

create table tbl_prato(
id_prato int unsigned not null auto_increment,
id_restaurante int unsigned not null,
categoria int unsigned not null, -- regiao
foto varchar(150) not null,
nome varchar(70) not null,
descricao text not null,
porcao varchar(20) not null, -- em gramas / quantidade de pessoas que serve...
preco decimal(7,2) not null,
primary key(id_prato),
foreign key(id_restaurante) references tbl_restaurante(id_restaurante),
foreign key(categoria) references tbl_categoria(id_categoria)
)engine = innodb;

-- inserts da tbl_categoria
/* insert into tbl_categoria
values(null,"Bahia"),
(null,"Acre"),
(null,"Alagoas"),
(null,"Minas Gerais"),
(null,"Sul"),
(null,"Sudeste"); */