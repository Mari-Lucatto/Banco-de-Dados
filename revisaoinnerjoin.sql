create database juncoes;
use juncoes;

create table municipio (
cd_municipio int not null auto_increment,
ds_municipio varchar(70),
constraint cd_municipio_pk primary key (cd_municipio)
);

create table endereco (
cd_endereco int not null auto_increment,
ds_endereco varchar (70),
complemento varchar(70),
bairro varchar (30),
cep char(9),
constraint cd_endereco_pk primary key (cd_endereco),
end_munic int not null, constraint cd_municipio_fk foreign key (end_munic) references municipio (cd_municipio)
);

create table telefone(
cd_fone int not null auto_increment,
ddd char(4),
n_fone char (10),
constraint cd_fone_pk primary key (cd_fone),
end_fone int not null, constraint cd_endereco_fk foreign key (end_fone) references endereco (cd_endereco)
);

create table ramo_atividade (
cd_ramo int not null auto_increment,
ds_ramo varchar(70),
constraint cd_ramo_pk primary key (cd_ramo)
);

create table tipo_assinante (
cd_tipo int not null auto_increment,
ds_tipo varchar(70),
constraint cd_tipo_pk primary key (cd_tipo)
);

create table assinante (
cd_assinante int not null auto_increment,
nm_assinante varchar(70) not null,
constraint cd_assinante_pk primary key (cd_assinante),
ass_ramo int not null, constraint cd_ramo_fk foreign key (ass_ramo) references ramo_atividade (cd_ramo),
ass_tipo int not null, constraint cd_tipo_fk foreign key (ass_tipo) references tipo_assinante (cd_tipo),
ass_end int not null, constraint cd_enderecoFK foreign key (ass_end) references endereco (cd_endereco)
);

insert into ramo_atividade values
(default, 'Educação'),
(default, 'Economista'),
(default, 'Saúde'),
(default, 'Contador');

insert into tipo_assinante values
(default, 'Residencial'),
(default, 'Comercial');

insert into municipio values
(default, 'Pelotas'),
(default, 'Natal'),
(default, 'João Câmera'),
(default, 'Cotia');

insert into endereco values
(default, 'Rua Televisão', 'n° 80', 'Caucaia do Alto', '06788-999', 1),
(default, 'Rua Lilac', 'n° 76', 'Jardim Japão', '06726-788', 2),
(default, 'Rua Ponta Negra', 'n° 399', 'Pq. do Agreste', '06730-000', 3),
(default, 'Rua das Rosas', 'n° 510', 'Jardim Elias', '06720-456', 4);

insert into telefone values
(default, '(11)', '98888-7441', 1),
(default, '(11)', '98548-2447', 2),
(default, '(11)', '95195-1248', 1),
(default, '(11)', '93333-4545', 3),
(default, '(11)', '93893-6767', 4),
(default, '(11)', '98325-8300', 3);

insert into assinante values
(default, 'Yuri', 1, 1, 1),
(default, 'Melissa', 2, 2, 2),
(default, 'Mariana', 3, 1, 3),
(default, 'Julio', 4, 2, 4);


# Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes.  
SELECT a.nm_assinante AS 'Nome', e.ds_endereco AS 'Endereço', e.complemento AS 'Complemento', e.bairro AS 'Bairro', 
e.cep AS'CEP',  t.ddd AS 'DDD', t.n_fone AS 'Telefone' FROM assinante AS a INNER JOIN endereco AS e ON a.ass_end = e.cd_endereco 
INNER JOIN telefone AS t ON t.end_fone = e.cd_endereco;

#Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e posteriormente por nome.  
SELECT a.nm_assinante  AS 'Nome', r.ds_ramo AS 'Ramo' FROM assinante as a INNER JOIN ramo_atividade as r ON a.ass_ramo= r.cd_ramo ORDER BY r.ds_ramo;
SELECT a.nm_assinante  AS 'Nome', r.ds_ramo AS 'Ramo' FROM assinante as a INNER JOIN ramo_atividade as r ON a.ass_ramo= r.cd_ramo ORDER BY a.nm_assinante;

#Listar os assinantes do município de Pelotas que são do tipo residencial. 
SELECT a.nm_assinante AS 'Nome', e.ds_endereco AS 'Endereço' FROM assinante as a INNER JOIN endereco AS e ON a.ass_end = e.cd_endereco WHERE end_munic = 1 AND ass_tipo = 1;

#Listar os nomes dos assinantes que possuem mais de um telefone.  
SELECT a.nm_assinante as 'Nome', COUNT(*) as 'Quantidade de Telefones' FROM telefone as t INNER JOIN endereco as e ON t.end_fone = e.cd_endereco
INNER JOIN assinante as a ON e.cd_endereco = a.ass_end GROUP BY a.nm_assinante HAVING COUNT(*) > 1;

#Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante comercial, com endereço em Natal ou João Câmara.
SELECT a.nm_assinante as 'Nome', t.ddd as 'DDD', t.n_fone as 'Telefone', ti.ds_tipo as 'Tipo',
m.ds_municipio as 'Municipio'
FROM assinante as a
INNER JOIN tipo_assinante as ti ON a.ass_tipo = ti.cd_tipo 
INNER JOIN endereco AS e ON a.ass_end = e.cd_endereco
INNER JOIN telefone AS t ON t.end_fone = e.cd_endereco
INNER JOIN municipio AS m ON e.end_munic = m.cd_municipio 
WHERE  a.ass_tipo = 2 AND end_munic = 2 OR a.ass_tipo = 2 AND end_munic = 3;
