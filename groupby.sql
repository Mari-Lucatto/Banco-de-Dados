create database agrupamento;
use agrupamento;

create table tipo( id int not null auto_increment, nome varchar(60) not null, primary key(id));

create table fabricantes(id int not null auto_increment, nome varchar(60) not null, primary key(id));

create table produtos(id int not null auto_increment, nome varchar(60) not null, quantidade int not null,id_fabricante int not null, id_tipo int not null, primary key(id), foreign key(id_fabricante) references fabricantes(id), foreign key(id_tipo) references tipo(id));

insert into tipo (nome) values ('Console');
insert into tipo (nome) values ('Notebook');
insert into tipo (nome) values ('Celular');
insert into tipo (nome) values ('Smartphone');
insert into tipo (nome) values ('Sofá');
insert into tipo (nome) values ('Armário');
insert into tipo (nome) values ('Refrigerador');
select*from tipo;

insert into fabricantes (nome) values ('Sony');
insert into fabricantes (nome) values ('Dell');
insert into fabricantes (nome) values ('Miscrosoft');
insert into fabricantes (nome) values ('Samsung');
insert into fabricantes (nome) values ('Apple');
insert into fabricantes (nome) values ('Beline');
insert into fabricantes (nome) values ('Magno');
insert into fabricantes (nome) values ('CCE');
insert into fabricantes (nome) values ('Nintendo');
select*from fabricantes;

insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Playstation 3',  100, 1, 1);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Core 2 Duo 4GB RAM 500GB HD',  200, 2, 2);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Xbox 360 120GB',  350, 3, 1);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('GT-16220 Quad band',  300, 4, 3);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('iPhone 4 32GB',  50, 5, 4);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Playstation 2',  100, 1, 1);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Sofá Estofado',  200, 6, 5);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Armário de Serviço',  50, 7, 6);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Refrigerador 420L',  200, 8, 7);
insert into produtos (nome, quantidade, id_fabricante, id_tipo) values ('Wii 120GB',  250, 8, 1);

-- group by
select t.nome as Tipo, f.nome as Fabricante, SUM(p.quantidade) as 'Quantidade em Estoque' 
from tipo as t, fabricantes as f, produtos as p
where t.id = p.id_tipo and f.id = p.id_fabricante
group by t.nome, f.nome;

-- having (é um filtro utilizado no group by, assim como o where é utilizado em query's mais simples)
select t.nome as Tipo, f.nome as Fabricante, SUM(p.quantidade) as 'Quantidade em Estoque' 
from tipo as t, fabricantes as f, produtos as p
where t.id = p.id_tipo and f.id = p.id_fabricante
group by t.nome, f.nome
having SUM(p.quantidade) > 200;

-- order by ASC
select id, nome, quantidade, id_tipo, id_fabricante from produtos order by id ASC;

-- order by DESC
select id, nome, quantidade, id_tipo, id_fabricante from produtos order by id DESC;