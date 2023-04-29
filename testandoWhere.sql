USE lojinhadamari;
SHOW TABLES;
DESC tblproduto;
INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras) VALUES
  ('SandalhaVal','UN',30,50.50,7891234567892), 
  ('Tenão Lechev','UN',40,60.50,7891234467822);
  
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Nike', 'CX', 40, 160.50, 193856274, "Tênis branco");
  
  SELECT * FROM tblproduto;
  
  SELECT nomeprod AS 'nome do produto', precounit*qtdprod AS 'Valor total em Estoque' FROM tblproduto; 
  
  SELECT nomeprod,qtdprod, precounit FROM tblproduto; 
  
  SELECT nomeprod,qtdprod, precounit FROM tblproduto WHERE idprod=2;
  
  Select nomeprod,qtdprod, precounit from tblproduto where precounit>=100;
  
   INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras) VALUES
  ('Chip Nike', 'CX', 30, 360.50, 17854296);
  
    Select nomeprod,qtdprod, precounit from tblproduto where precounit>=100;
    
    SELECT nomeprod,qtdprod, precounit FROM tblproduto WHERE unidade='CX' 
    AND precounit>=100;
    
    SELECT nomeprod,qtdprod, precounit, unidade FROM tblproduto WHERE unidade='CX' 
       OR precounit>=100;
       
       SELECT nomeprod,qtdprod, precounit,detalhes FROM tblproduto 
  WHERE detalhes IS NOT NULL;
  
   SELECT nomeprod,qtdprod, precounit,detalhes FROM tblproduto 
  WHERE detalhes IS NULL;
  
  USE lojinhadamari;
    SELECT * FROM tblproduto;
     INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Chinelo Havaianas', 'CX', 30, 70.50, 321456987, "Chinelo temático Disney");
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Tênis Adidas', 'CX', 30, 400.50, 789654123, "Tênis original de mola");
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Chinelo Ipanema', 'UN', 30, 50.50, 321456987, "Chinelo temático Heróis");
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Tênis infantil Nike', 'PA', 30, 90.80, 40028922, "tênis com LED");
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras) VALUES
  ('Sapatenis', 'PA', 30, 130.50, 321456987);
  INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Bota', 'UN', 20, 150.00, 76895415, "Bota marrom de couro");
  
   SELECT * FROM tblproduto;
   INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Dakota sapatênis', 'CX', 25, 100.00, 938271456, "Sapatênis confortável");
    INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Dakota chinelo', 'UN', 10, 30.50, 369147852, "Chinelo de dedo");
    INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Dakota salto alto', 'PA', 40, 168.50, 582463971, "Salto alto 10 cm");
   
    SELECT nomeprod, precounit, codbarras FROM tblproduto 
  WHERE unidade='CX' AND precounit>=300;
   INSERT INTO tblproduto(nomeprod,unidade,qtdprod,precounit,codbarras, detalhes) VALUES
  ('Coturno', 'CX', 25, 300.00, 78957462, "Coturno preta de couro");
  
  SELECT nomeprod, precounit, codbarras FROM tblproduto 
  WHERE precounit<100 AND detalhes IS NOT NULL;
  
  SELECT nomeprod, precounit, dt_cadastro, precounit+precounit*0.045 AS "Preço com acréscimo de 4.5%" FROM tblproduto WHERE precounit <=150.00;
  
  SELECT nomeprod, precounit, codbarras, detalhes FROM tblproduto WHERE unidade="UN" AND "PA" ORDER BY nomeprod ASC;


  

CREATE DATABASE tarefaBD;
SHOW DATABASES;
USE tarefaBD;
CREATE TABLE cliente (cod_cliente INT NOT NULL AUTO_INCREMENT, nome VARCHAR(20) NOT NULL, sobrenome VARCHAR(30) NOT NULL, CPF VARCHAR(15) NOT NULL, RG VARCHAR(15) NOT NULL,
 dataNasc DATE NOT NULL, logradouro VARCHAR(40) NOT NULL, bairro VARCHAR(30) NOT NULL,cidade VARCHAR(30) NOT NULL, estado CHAR(2) NOT NULL, CEP INT NOT NULL,  genero ENUM 
 ('F','M', 'NB') NOT NULL, CONSTRAINT cod_cliente_pk PRIMARY KEY(cod_cliente));

INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Rebeca", "Princesa", 502396874-14, 4561237890, "2005-10-12", "Rua Peruíbe, 400", "Limoeira", "Cotia", "SP", 16730-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Aninha", "Perfeita sem defeitos", 714825936-19, 936825714, "2005-09-11", "Rua Peruíbe, 500", "Limoeira", "Cotia", "SP", 16730-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Kerollen", "Rainha", 123654789-55, 741852963, "2004-12-27", "Rua Benjamin, 210", "Pereiras", "Vargem Grande", "RJ", 12357-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Yuri", "King", 852369741-19, 396174285, "2006-10-29", "Rua Amaralina, 860", "Tijuco", "Osasco", "SP", 85627-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Analu", "Linda", 915738264-00, 020513987, "2003-02-28", "Avenida das Hortencias, 1052", "Orquideas", "Guarulhos", "SP", 41825-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Julio", "Princeso", 285714903-20, 906382571, "2007-11-05", "Avenida dos Pássaros, 705", "Florencias", "Cotia", "SP", 39751-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Mariana", "Incrivelmente Perfeita", 825936174-03, 020513987, "2004-12-03", "Rua Benjamin, 4002", "Quaraguatatuba", "Cotia", "SP", 89220-000, "F");
DELETE FROM cliente WHERE cod_cliente=8;
DELETE FROM cliente WHERE cod_cliente=22;
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Mario", "da Silva", 132465798-05, 825396714, "2005-10-20", "Rua Santo Antonio, 854", "Sem Criatividade", "Rubiataba", "GO", 20563-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Juliana", "Linda sem defeitos", 761493852-00, 564987013, "2006-06-12", "Rua Dogão, 965", "Tristeza", "Cotia", "SP", 96358-080, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Marcelo", "Soares", 40028922-52, 528936174, "2006-04-25", "Rua das Rosas, 399", "Folhetos", "Osasco", "SP", 87956-000, "NB");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Alvaro", "Rocha", 936285704-33, 791346825, "2005-09-16", "Rua Benjamin, 307", "Sem criatividade", "Rubiataba", "GO", 50742-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Marleide", "da Rosa", 502893641-70, 085937164, "2000-04-22", "Rua Ponta Negra, 399", "Parque do Agreste", "Vargem Grande", "SP", 65302-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Leide", "Ferreira", 90024866-43, 123654789, "1992-08-03", "Rua das Casas, 574", "Varginha", "São Roque", "RJ", 96384-000, "NB");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Marilena", "Pereira da Silva", 15028963-00, 007485296, "1985-01-30", "Rua Sei Lá, 805", "Agua Espraiada", "Carapicuiba", "RJ", 82596-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Vinicius", "Alves", 502936714-43, 741082936, "2003-10-15", "Rua Ponta Negra, 520", "Parque do Agreste", "Vargem Grande", "MG", 52896-000, "NB");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Davi", "Chato", 50028966-00, 852963741, "1990-12-09", "Rua Carlin, 308", "Folhetos", "Osasco", "SP", 20596-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Gabrielle", "Priminha Linda", 302165974-00, 258963741, "2006-06-15", "Rua das Flores, 405", "Varginha", "Rubiataba", "GO", 93684-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Letícia", "Incrivelmente Perfeita", 96325841-03, 852369741, "2007-06-27", "Rua das Hortencias, 506", "Orquideas", "Piracicaba", "SP", 12345-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Rafael", "Lucatto", 32065897-00, 85263147, "1997-08-03", "Rua Benjamin, 052", "Varginha", "São Roque", "RJ", 97850-000, "M");
SELECT*FROM cliente;

SELECT*FROM cliente ORDER BY nome ASC;
SELECT*FROM cliente ORDER BY nome DESC;

SELECT*FROM cliente WHERE cod_cliente="6, 10, 13, 15, 17";

SELECT nome, sobrenome, genero FROM cliente WHERE cidade="Cotia";

INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Amanda", "da Silva", 321456897-25, 321857964, "2001-07-08", "Rua Santo Antonio, 934", "Amorim", "Rubiataba", "GO", 20563-000, "NB");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Aparecido", "de Souza", 08002007-00, 741852369, "1985-02-01", "Rua São Carlos, 513", "Belverde", "Tijuco", "SP", 85264-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Arnaldo", "Santos", 987654321-05, 205896743, "1998-11-28", "Rua dos Passaros, 1002", "Varginha", "São Gonçalves", "PE", 20582-000, "M");

INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Joana", "Soares", 897456321-07, 032145678, "2007-10-20", "Rua Araucária, 830", "Benjamin", "Botafogo", "RJ", 12356-000, "F");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Lucas", "da Rosa", 098745632-01, 852741963, "1996-04-30", "Rua da Felicidade, 108", "Copacabana", "Rio de Janeiro", "RJ", 32158-000, "M");
INSERT INTO cliente (nome, sobrenome, CPF, RG, dataNasc, logradouro, bairro, cidade, estado, CEP, genero) VALUES ("Vera", "Lucia", 369258741-00, 564893271, "1980-07-30", "Avenida Santos, 785", "Flamengo", "Niterói", "RJ", 85264-000, "NB");

SELECT*FROM cliente WHERE estado="RJ";

SELECT*FROM cliente WHERE nome LIKE 'M%';

SELECT nomeprod, codbarras, precounit, qtdprod FROM tblproduto;
SELECT MIN(qtdprod) AS 'Menor quantidade em estoque' FROM tblproduto ;

SELECT AVG(nomeprod LIKE 'D%') AS 'Preço médio dos produtos' FROM tblproduto; 

SELECT*FROM tblproduto WHERE qtdprod BETWEEN 1 AND 10;
  
SELECT MAX(precounit) AS 'Produto mais caro em CX' FROM tblproduto WHERE unidade=CX;



