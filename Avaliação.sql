create database avaliacao;
use avaliacao;

create table base_salarios(CBO int not null, descricao varchar(200) not null, jornada char(2) not null, 
								piso decimal (10,2) not null, media decimal (10,2) not null, maior decimal (10,2) not null, 
                                salario_hora char(7) not null, constraint CBO_pk primary key(CBO));
                                
create table base_funcionarios(id_func int not null auto_increment, nome varchar(100) not null, 
								constraint id_func_pk primary key(id_func),  CBO int not null, 
                                constraint CBO_fk foreign key(CBO) references base_salarios(CBO) 
                                on delete cascade on update cascade);
                                
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (123605, 'Diretor de informática', 42, 14455.19, 20359.42, 30767.77, 'R$97,20');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142505, 'Gerente de Teleprocessamento', 43, 6135.69, 8641.82, 13059.77, 'R$40,58');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142510, 'Gerente de desenvolvimento de sistemas', 42, 8298.86, 11688.53, 17664.06, 'R$55,70');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142515, 'Gerente de operação de tecnologia da informação', 42, 7535.81, 10613.82, 16039.93, 'R$50,21');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142520, 'Gerente de projetos de tecnologia da informação', 41, 6563.21, 9243.95, 13969.74, 'R$44,75');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142525, 'Gerente de segurança de tecnologia da informação', 42, 7539.36, 10618.81, 16047.47, 'R$50,48');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142530, 'Gerente de suporte técnico de tecnologia da informação', 43, 5029.51, 7083.82, 10705.28, 'R$33,17');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (142535, 'Tecnólogo em gestão da tecnologia da informação', 42, 3003.11, 4229.74, 6392.11, 'R$20,10');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (203105, 'Pesquisador em ciências da computação e informática', 41, 4690.13, 6605.82, 9982.92, 'R$32,44');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (211120, 'Matemático aplicado', 41, 6074.82, 8556.08, 12930.21, 'R$41,26');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212205, 'Engenheiro de aplicativos em computação', 41, 6142.36, 8651.21, 13073.96, 'R$41,83');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212210, 'Engenheiro de hardware computacional', 41, 4440.34, 6254.01, 9541.24, 'R$30,69');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212215, 'Engenheiro de software computacional básico', 41, 6542.48, 9214.76, 13925.61, 'R$44,53');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212305, 'Administrador de banco de dados', 42, 4355.76, 6134.88, 9271.21, 'R$29,56');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212310, 'Administrador de redes', 42, 3321.24, 4677.80, 7069.23, 'R$22,24');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212315, 'Administrador de sistemas computacionais', 42, 3414.09, 4808.57, 7266.86, 'R$22,74');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212320, 'Administrador em segurança da informação', 41, 4605.50, 6486.62, 9802.78, 'R$31,33');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212405, 'Analista de desenvolvimento de sistemas', 42, 3775.51, 5317.63, 8036.15, 'R$25,62');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212410, 'Analista de redes e de comunicação de dados', 42, 2573.90, 3625.21, 5478.53, 'R$17,24');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212415, 'Analista de sistemas de automação', 42, 2886.79, 4065.90, 6144.50, 'R$19,39');
insert into base_salarios(CBO, descricao, jornada, piso, media, maior, salario_hora) values (212420, 'Analista de suporte computacional', 42, 2179.88, 3070.26, 4639.86, 'R$14,73');
select*from base_salarios;

insert into base_funcionarios(nome, CBO) values ('Guilherme Fogaça', 123605);
insert into base_funcionarios(nome, CBO) values ('Maria Costa', 142505);
insert into base_funcionarios(nome, CBO) values ('Camila Fernandes', 142510);
insert into base_funcionarios(nome, CBO) values ('Yago Barbosa', 142515);
insert into base_funcionarios(nome, CBO) values ('Beatriz Jesus', 142520);
insert into base_funcionarios(nome, CBO) values ('Giovanna Monteiro', 142525);
insert into base_funcionarios(nome, CBO) values ('Catarina Pires', 142530);
insert into base_funcionarios(nome, CBO) values ('Thiago Nascimento', 142535);
insert into base_funcionarios(nome, CBO) values ('Sophie Cardoso', 203105);
insert into base_funcionarios(nome, CBO) values ('Daniel Barros', 211120);
insert into base_funcionarios(nome, CBO) values ('Enrico Araújo', 212205);
insert into base_funcionarios(nome, CBO) values ('Marcelo Barbosa', 212210);
insert into base_funcionarios(nome, CBO) values ('João Miguel Correia', 212215);
insert into base_funcionarios(nome, CBO) values ('Heitor Monteiro', 212305);
insert into base_funcionarios(nome, CBO) values ('Alexandre Santos', 212310);
insert into base_funcionarios(nome, CBO) values ('Ana Clara Rocha', 212315);
insert into base_funcionarios(nome, CBO) values ('Luiza Fogaça', 212320);
insert into base_funcionarios(nome, CBO) values ('João Pedro Souza', 212405);
insert into base_funcionarios(nome, CBO) values ('Natália Oliveira', 212410);
insert into base_funcionarios(nome, CBO) values ('Heloísa Barbosa', 212415);
insert into base_funcionarios(nome, CBO) values ('Melissa Cavalcanti', 212420);
select*from base_funcionarios;

-- A consulta deverá retornar: Descrição, Jornada, Piso, Média, maior salário e Salário/ Hora

-- Consultas Múltiplas
select bf.nome as Nome_Funcionário, bs.descricao as Descrição, bs.jornada as Jornada, bs.piso as Piso, bs.media as Média, bs.maior as Maior_salário, bs.salario_hora as Salário_Hora from base_funcionarios as bf, base_salarios as bs where bf.CBO= bs.CBO;

-- Junção de produto cartesiano
select bf.nome, bs.descricao, bs.jornada, bs.piso, bs.media, bs.maior, bs.salario_hora from base_funcionarios as bf, base_salarios as bs where bf.CBO= bs.CBO;

-- Inner Join
select bf.nome, bs.descricao, bs.jornada, bs.piso, bs.media, bs.maior, bs.salario_hora from base_funcionarios as bf inner join base_salarios as bs where bf.CBO= bs.CBO;
