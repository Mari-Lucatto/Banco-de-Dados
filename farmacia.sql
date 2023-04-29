-- CRIANDO BANCO DE DADOS 

CREATE DATABASE Farmacia;
USE Farmacia;

-- CRIANDO TABELAS

CREATE TABLE tbl_prod(
  cod_prod INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  designacao VARCHAR(100) NULL DEFAULT NULL,
  composicao VARCHAR(200) NOT NULL,
  fabricante VARCHAR(100) NOT NULL,
  preco DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (cod_prod));
  
CREATE TABLE tbl_cli (
  cod_cli INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  endereco VARCHAR(500) NOT NULL,
  telefone CHAR(18) NOT NULL,
  cep CHAR(9) NOT NULL,
  PRIMARY KEY (cod_cli));
  
CREATE TABLE tbl_compra (
n_compra INT NOT NULL AUTO_INCREMENT,
cod_cli INT NOT NULL,
cod_prod INT NOT NULL,
nome_medico VARCHAR(100) NULL DEFAULT NULL,
total_venda DECIMAL(6,2) NOT NULL,
PRIMARY KEY (n_compra), CONSTRAINT cod_cli_fk
FOREIGN KEY (cod_cli) REFERENCES tbl_cli (cod_cli),
CONSTRAINT cod_prod_fk FOREIGN KEY (cod_prod)
REFERENCES tbl_prod (cod_prod));

-- POPULANDO TABELAS

INSERT INTO tbl_prod (nome,tipo,designacao,composicao,fabricante,preco) VALUES
('Dipirona','Remédio','Anti-inflamatório','Fosfato de sódio monobásico, fosfato de sódio dibásico, sacarina sódica e água purificada','Sanofi- Aventis',10.50),
('Dramin','Remédio','Anti-emético e anti-vertiginoso','Propilenoglicol, sacarina sódica, benzoato de sódio, aroma de cherry brandy, vermelho de ponceau e água purificada','Takeda Pharma Ltda.',19.50),
('Shampoo Johnson','Higiene','Higienização da pele e couro cabeludo','Aqua, Cocamidopropyl Betaine, Decyl Glucoside, Sodium Cocoyl Isethionate, Sorbitan Laurate, Distearate, Glycerin, Citric Acid, Sodium Benzoate, Sodium Methyl Cocoyl Taurate, Parfum, Disodium EDTA','Johnson & Johnson',34.99),
('Creme Dental Colgate','Higiene','Higienização bucal','Fluoreto de Sódio (1450 ppm de Flúor), Triclosan 0,3%, Água, Glicerina, Sorbitol, Sílica Hidratada, Lauril Sulfato de Sódio, Copolímero PVM/MA, Aroma,Carragema, Sacarina Sódica, Hidróxido de Sódio','Colgate-Palmolive', 15.80),
('Vitamina C','Remédio','Suplemento vitamínico para a imunidade','Bicarbonato de sódio, carbonato de sódio, macrogol, sorbitol, sucralose, ácido cítrico, aroma de laranja e corante amarelo crepúsculo','União Química',39.90);

INSERT INTO tbl_cli (nome,sobrenome,endereco,telefone,cep) VALUES
('Mariana','Lucata','Rua Agreste, 200','11 94002-5628','29104-281'),
('Guilherme','Barba','Rua Morro Macaco, 130','11 92553-8922','29105-281'),
('Julio','Santas','Rua Vargem, 510','11 94001-5630','29106-281'),
('Aninha','Teresa','Rua Cotia, 433','11 94321-5631','29107-281'),
('Rafa','Massa','Rua Caucaia, 539','11 91242-5632','29108-281');

INSERT INTO tbl_compra (cod_cli, cod_prod, nome_medico, total_venda) VALUES
(1, 3, default, 34.99),
(2, 4, default, 15.80),
(3, 3, default, 34.99),
(4, 5, default, 39.90),
(5, 1, default, 10.50),
(1, 2, 'Dra. Melissa Dias', 19.50);

select*from tbl_compra;

-- CONSULTA SIMPLES

SELECT nome, tipo, preco FROM tbl_prod WHERE preco >= 20.00 order by nome ASC;
SELECT nome, telefone FROM tbl_cli WHERE endereco LIKE "%Cotia%";
SELECT cod_cli, total_venda FROM tbl_compra WHERE cod_cli=1;

-- CONSULTAS MÚLTIPLAS

SELECT p.nome, p.tipo, p.designacao, sum(c.total_venda) AS 'Total do valor vendido por produto' FROM tbl_compra AS c INNER JOIN tbl_prod AS p on p.cod_prod = c.cod_prod group by p.nome;
SELECT cli.nome AS 'Cliente', com.total_venda, p.nome AS 'Produto'  FROM tbl_compra AS com, tbl_prod AS p, tbl_cli AS cli WHERE p.cod_prod = com.cod_prod AND com.cod_cli = cli.cod_cli order by cli.nome desc;
SELECT cli.nome, cli.cep, sum(com.total_venda) AS 'Valor Total' FROM tbl_compra AS com, tbl_cli AS cli WHERE com.cod_cli = cli.cod_cli group by cli.nome;

-- UPDATE 

UPDATE tbl_prod SET preco= 8.50 WHERE cod_prod= 1;
UPDATE tbl_cli SET telefone= '11 92031-7530' WHERE cod_cli= 3;
UPDATE tbl_cli SET endereco= 'Rua Caucaiana, 358' WHERE cod_cli= 5;
UPDATE tbl_compra SET nome_medico= 'Dr. João Nunes' WHERE cod_cli= 5;

select*from tbl_cli;

-- DELETE

#DELETE FROM tbl_prod WHERE preco BETWEEN 10.00 AND 18.00;
DELETE FROM tbl_compra WHERE cod_cli= 2;
#DELETE FROM tbl_prod WHERE designacao= 'Higienização bucal';
DELETE FROM tbl_prod WHERE cod_prod= 4;
#DELETE FROM tbl_compra WHERE nome_medico= '';
DELETE FROM tbl_cli WHERE cod_cli= 2;
