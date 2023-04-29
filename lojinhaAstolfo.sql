CREATE database lojinhaDoAstolfo;
USE lojinhaDoAstolfo;

-- TABELAS
CREATE TABLE tblfornecedor_fabric(idfornfabr INT NOT NULL auto_increment, nome VARCHAR(30) NOT NULL, emailsac VARCHAR(30) NOT NULL, urlfab VARCHAR(200) NOT NULL, constraint idfornfabr_pk primary key(idfornfabr));
CREATE TABLE tblmarca(idmarca INT NOT NULL auto_increment, nomemarca VARCHAR (20) NOT NULL, descricao VARCHAR(300), constraint idmarca_pk primary key (idmarca), idfornfabFK int not null, constraint idfornfab_fk foreign key(idfornfabFK) references tblfornecedor_fabric(idfornfabr) on delete cascade on update cascade);
CREATE TABLE tbldepartamento(iddepart INT NOT NULL AUTO_INCREMENT, nomedepart VARCHAR(20) NOT NULL, Setordaloja VARCHAR(10) NOT NULL, descricao VARCHAR(600), constraint iddepart_pk primary key(iddepart));
CREATE TABLE tblcategoria (idcat INT NOT NULL AUTO_INCREMENT, nomecateg VARCHAR(20) NOT NULL, descricao VARCHAR(600), constraint idcat_pk primary key(idcat));
CREATE TABLE tblproduto(idprod INT NOT NULL AUTO_INCREMENT, nomeprod VARCHAR(25) NOT NULL, unidade  Enum ('UN','CT','CX','DZ','PA','PÇ','RL') NOT NULL, qtdprod tinyint NOT NULL, precounit DECIMAL(6,2) NOT NULL, codbarras DECIMAL(13,0), detalhes VARCHAR(300), dt_cadastro DATETIME default now(), constraint idprod_pk primary key(idprod), iddepartFK int not null, constraint iddepart_fk foreign key(iddepartFK) references tbldepartamento(iddepart) on delete cascade on update cascade, idcat_fk int not null, constraint idcatFK foreign key(idcat_fk) references tblcategoria(idcat) on delete cascade on update cascade,idmarca_fk int not null, constraint idmarcaFK foreign key(idmarca_fk) references tblmarca(idmarca) on delete cascade on update cascade);

-- POPULANDO AS TABELAS
INSERT INTO tbldepartamento(nomedepart, Setordaloja, descricao) VALUES ('Roupas', 'Setor 1', 'Aqui se encontram as blusas e as roupas de baixo');
INSERT INTO tbldepartamento(nomedepart, Setordaloja, descricao) VALUES ('Calçados', 'Setor 2', 'Aqui se encontram os tênis');
INSERT INTO tbldepartamento(nomedepart, Setordaloja, descricao) VALUES ('Maquiagem', 'Setor 3', 'Aqui se encontra maquiagem para os olhos e para a boca');

INSERT INTO tblcategoria(nomecateg, descricao) VALUES ('Blusas', 'Para o verão e o inverno');
INSERT INTO tblcategoria(nomecateg, descricao) VALUES ('Partes de Baixo', 'Calças variadas e shorts');
INSERT INTO tblcategoria(nomecateg) VALUES ('Tênis');
INSERT INTO tblcategoria(nomecateg, descricao) VALUES ('Boca', 'Maquiagem para a boca');
INSERT INTO tblcategoria(nomecateg, descricao) VALUES ('Olhos', 'Maquiagem para os olhos');

INSERT INTO tblfornecedor_fabric(nome, emailsac,urlfab) VALUES ('Franco Fornecedor', 'tenis123@gmail.com', 'www.fornecedorfranco.com.br');
INSERT INTO tblfornecedor_fabric(nome, emailsac,urlfab) VALUES ('Vivendo e Fornecendo', 'makevc@gmail.com', 'www.vivendofornecendo.com');
INSERT INTO tblfornecedor_fabric(nome, emailsac,urlfab) VALUES ('Shein', 'roupas456@gmail.com', 'br.shein.com');

INSERT INTO tblmarca(nomemarca, descricao, idfornfabFK) VALUES ('Lacoste', 'Roupas confortáveis e atuais', 3);
INSERT INTO tblmarca(nomemarca, idfornfabFK) VALUES ('Zara', 3);
INSERT INTO tblmarca(nomemarca, descricao, idfornfabFK) VALUES ('Adidas', 'Melhores calçados do mercado', 1);
INSERT INTO tblmarca(nomemarca, idfornfabFK) VALUES ('Nike', 1);
INSERT INTO tblmarca(nomemarca, descricao, idfornfabFK) VALUES ('Natura', 'Produtos de qualidade', 2);

INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Camiseta Gola Alta', 'UN', '20', '40.00', '3216549874019', 'Cor Preta', 1, 1, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Camiseta Regata', 'UN', '40', '35.00', '8956324710147', 'Cores Neutras', 1, 1, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Camiseta Esportiva', 'UN', '35', '20.00', '7496325810230', 1, 1, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Blusão Fechado', 'UN', '24', '120.00', '3625987410896', 'Com bolsos e toca', 1, 1, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Camiseta Algodão', 'UN', '60', '25.00', '1023658947896', '100% algodão', 1, 1, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Blusa Moletom', 'UN', '53', '80.00', '6352901480978', 'Com zíper e touca', 1, 1, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Camiseta Social', 'UN', '29', '70.00', '2013658947856', 1, 1, 2);

INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Calça Leghing', 'UN', '50', '40.00', '5693287450147', 'Nas cores preto e cinza', 1, 2, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Calça de Moletom', 'UN', '30', '80.00', '7458749657412', 'Nas cores preto e cinza', 1, 2, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Calça Jeans', 'UN', '85', '45.00', '3256589741020', 'Estilos diversos', 1, 2, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Calça Social', 'UN', '10', '65.00', '568934710145', 'Na cor preta', 1, 2, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Short Jeans', 'UN', '17', '50.00', '4698523018720', 1, 2, 1);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Calça Cargo', 'UN', '32', '110.00', '3698521470365', 'Calças no tom bege', 1, 2, 2);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Bermuda Esportiva', 'UN', '20', '23.90', '2582588526974', 1, 2, 1);

INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Air Max', 'CX', '13', '320.50', '9638521478020', 'Modelo feminino na cor branca', 2, 3, 4);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Air Fource', 'CX', '15', '169.90', '9876543217890', 'Modelo masculino preto', 2, 3, 4);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Revolution', 'CX', '20', '240.90', '5896302589004', 2, 3, 4);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Adidas Galaxy', 'CX', '07', '300.00', '7412589630259', 'Modelo masculino', 2, 3, 3);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Adidas Street', 'CX', '32', '400.00', '2563987410250', 'Modelo esportivo', 2, 3, 3);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Adidas Performance', 'CX', '40', '250.90', '5878525963014', 2, 3, 3);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Tênis Adidas Forum', 'CX', '35', '300.50', '4568971230980', 2, 3, 3);

INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Liptint', 'UN', '15', '13.50', '8025639741259', 'Liptint líquido', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Batom Matte', 'UN', '17', '21.00', '9632587410250', 'Resistente a água', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Gloss', 'UN', '08', '17.40', '4596328710236', 'Com brilho', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Batom Hidrante', 'UN', '32', '10.00', '2305698741025', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Batom Líquido', 'UN', '23', '25.00', '4002892201291', 'Disponíveis nas cores vermelho e rosa', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Batom Cremoso', 'UN', '10', '25.00', '2301456987458', 'Disponíveis nas cores vermelho e roxo', 3, 4, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Lápis Batom', 'UN', '15', '28.00', '8523697410250', 'Vem com apontador', 3, 4, 5);

INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Sombra', 'UN', '05', '37.00', '5963287410236', 'Diversidade de palheta de cores', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Lápis de Olho', 'UN', '13', '20.00', '2013654789632', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Rímeo', 'UN', '26', '17.00', '3698521478520', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Delineador', 'UN', '28', '10.00', '4785693210269', 'Delineador de Pincel', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Máscara de Cílios', 'UN', '35', '30.90', '5823697410263', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Caneta Delineadora', 'UN', '18', '13.00', '2583697410147', 'Disponível na cor preta', 3, 5, 5);
INSERT INTO tblproduto(nomeprod, unidade, qtdprod, precounit, codbarras, detalhes, iddepartFK, idcat_fk, idmarca_fk) VALUES ('Lápis de Sobrancelha', 'UN', '07', '28.00', '5963280203610', 'Vem com apontador', 3, 5, 5);

-- QUERIES
-- Realizar query que retorne à quantidade de produtos que tenham quantidade maior igual a 20, agrupados por suas marcas;
SELECT tblmarca.nomemarca as 'Marca', COUNT(tblproduto.nomeprod) as 'QTD de Produtos' from tblproduto inner join tblmarca on tblproduto.idmarca_fk= tblmarca.idmarca
GROUP BY tblmarca.nomemarca HAVING COUNT(tblproduto.nomeprod)>=07;

-- Realizar query que retorne à quantidade de produtos agrupados por sua marca que tenham quantidade maior igual a 20, valor unitário entre 100.00 e 200.00 e que a quantidade por marca seja menor que 5;


-- Realizar query que retorne à quantidade agrupada por produtos que contenham mais de 20 unidades e que sejam de um determinado fornecedor/distribuidor.


-- Realizar query que retorne de forma agrupada a quantidade de fornecedores/distribuidores existentes em um departamento;
SELECT tbldepartamento.nomedepart as 'Departamento', COUNT(tblfornecedor_fabric.nome) as 'QTD de Fornecedores' from tblfornecedor_fabric inner join tbldepartamento on tblfornecedor_fabric.idfornfabr= tbldepartamento.iddepart
GROUP BY tbldepartamento.nomedepart;

-- Realizar query que retorne de forma agrupada por departamento a quantidade de produtos que não tem detalhes preenchidos;
SELECT tbldepartamento.nomedepart as 'Departamento', COUNT(tblproduto.detalhes) as 'QTD de Produtos sem Detalhes' from tblproduto inner join tbldepartamento on tblproduto.iddepartFK= tbldepartamento.iddepart
GROUP BY tbldepartamento.nomedepart HAVING COUNT(tblproduto.detalhes) is null;

-- Realizar query que retorne de forma agrupada por departamento a quantidade de ocorrências de uma marca, por intermédio dos respectivos produtos.