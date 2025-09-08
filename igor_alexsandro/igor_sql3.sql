CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE jogo (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(30), 
    diretor VARCHAR(30), 
    genero VARCHAR(30), 
    DtLanc DATE, 
    NOTA FLOAT, 
    qtd INT,
    midia VARCHAR(10),
    CONSTRAINT chKmidia CHECK (midia IN ('física', 'digital')),
    CONSTRAINT check_nota CHECK (NOTA BETWEEN 0 AND 10)
);

INSERT INTO jogo VALUES 
(DEFAULT, 'fifa', 'Gianni Infantino', 'Futebol', '1993-03-15', 10, 100, 'física'),
(DEFAULT, 'pes', 'Yoshikatsu Ogihara', 'Futebol', '2001-03-15', 8, 0, 'física'),
(DEFAULT, 'call of duty warzone', 'Pete Actipis', 'Guerra', '2020-03-10', 9, 89, 'digital'),
(DEFAULT, 'minecraft', 'Jared Hess.', 'Sobrevivencia', '2009-05-17', 5, 90, 'digital'),
(DEFAULT, 'fortnite', 'Steve Danuser.', 'Ação', '2017-07-21', 9, 75, 'digital');

SELECT * FROM jogo;

UPDATE jogo SET midia = 'física' WHERE nome = 'fifa';
UPDATE jogo SET midia = 'física' WHERE nome = 'pes';
UPDATE jogo SET midia = 'digital' WHERE nome = 'call of duty warzone';
UPDATE jogo SET midia = 'digital' WHERE nome = 'minecraft';
UPDATE jogo SET midia = 'digital' WHERE nome = 'fortnite';

SELECT * FROM jogo WHERE DtLanc >= '2015-01-01';

SELECT * FROM jogo WHERE nome LIKE '%a%' AND midia = 'física';

SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';

ALTER TABLE jogo ADD CONSTRAINT check_nota CHECK (NOTA BETWEEN 0 AND 10);

SELECT * FROM jogo WHERE genero = 'Futebol' AND qtd > 0;

DELETE FROM jogo WHERE qtd = 0;

ALTER TABLE jogo CHANGE diretor criador VARCHAR(30);
DESCRIBE jogo;

DROP TABLE jogo;


-- exercicio 2 

CREATE DATABASE olimpiadas;
USE olimpiadas;


-- exercicio 3 

CREATE TABLE esporte (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(40),
    categoria VARCHAR(20),
    numero_jogadores INT,
    estreia DATE,
    pais_origem VARCHAR(30),
    CONSTRAINT check_categoria CHECK (categoria IN ('Individual', 'Coletivo'))
);

INSERT INTO esporte (nome, categoria, numero_jogadores, estreia, pais_origem) VALUES
('Atletismo', 'Individual', 1, '1896-04-06', 'Grécia'),
('Futebol', 'Coletivo', 11, '1900-01-01', 'França'),
('Basquete', 'Coletivo', 5, '1936-08-06', 'Estados Unidos'),
('Natação', 'Individual', 1, '1896-04-06', 'Grécia'),
('Voleibol', 'Coletivo', 6, '1964-10-10', 'Japão');

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(3,1) CHECK (popularidade >= 0 AND popularidade <= 10);
DESCRIBE esporte;

UPDATE esporte SET popularidade = 9.5 WHERE nome = 'Atletismo';
UPDATE esporte SET popularidade = 8.2 WHERE nome = 'Futebol';
UPDATE esporte SET popularidade = 7.8 WHERE nome = 'Basquete';
UPDATE esporte SET popularidade = 9.0 WHERE nome = 'Natação';
UPDATE esporte SET popularidade = 8.0 WHERE nome = 'Voleibol';

SELECT * FROM esporte ORDER BY popularidade ASC;

SELECT * FROM esporte WHERE estreia >= '2000-01-01';

ALTER TABLE esporte ADD CONSTRAINT check_estreia CHECK (estreia >= '1896-04-06' AND estreia <= CURDATE());

ALTER TABLE esporte DROP CONSTRAINT check_categoria;

SELECT * FROM esporte WHERE pais_origem LIKE '_a%';

SELECT * FROM esporte WHERE numero_jogadores BETWEEN 4 AND 11;

DELETE FROM esporte WHERE id IN (1, 3, 5);

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenho (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    data_lancamento DATE,
    emissora VARCHAR(50),
    classificacao VARCHAR(15),
    statuss VARCHAR(15),
    nota INT,
    CONSTRAINT check_statuss CHECK (statuss IN ('exibindo', 'finalizado', 'cancelado')),
    CONSTRAINT check_nota CHECK (nota BETWEEN 1 AND 5)
);

drop table desenho;

INSERT INTO desenho VALUES
(DEFAULT, 'Bob Esponja', '1999-05-01', 'Nickelodeon', 'Livre', 'exibindo', 5),
(DEFAULT, 'Peppa Pig', '2004-05-31', 'Nick Jr.', 'Livre', 'exibindo', 4),
(DEFAULT, 'Tom & Jerry', '1940-02-10', 'MGM', 'Livre', 'finalizado', 5),
(DEFAULT, 'Scooby-Doo', '1969-09-13', 'CBS', 'Livre', 'cancelado', 4),
(DEFAULT, 'Dragon Ball Z', '1989-04-26', 'Fuji TV', '12 anos', 'finalizado', 5);

SELECT * FROM desenho;

UPDATE desenho SET status = 'finalizado' WHERE id = 2;
UPDATE desenho SET status = 'exibindo' WHERE id = 1;

UPDATE desenho SET classificacao = '12 anos' WHERE id = 5;

UPDATE desenho SET status = 'exibindo' WHERE id = 4;

UPDATE desenho SET nota = 3 WHERE id = 2;

SELECT * FROM desenho WHERE classificacao <= '14 anos';

SELECT * FROM desenho WHERE emissora = 'Nickelodeon';

ALTER TABLE desenho MODIFY status VARCHAR(100);

UPDATE desenho SET status = 'finalizado' WHERE id = 1;

DELETE FROM desenho WHERE id = 12;

SELECT * FROM desenho WHERE titulo LIKE 'D%';

ALTER TABLE desenho CHANGE classificacao classificacaoIndicativa VARCHAR(15);

UPDATE desenho SET nota = 4, data_lancamento = '2000-10-10' WHERE id = 3;

TRUNCATE TABLE desenho;

ALTER TABLE desenho DROP CONSTRAINT check_statuss;

CREATE DATABASE AviSafe;

USE AviSafe;

CREATE TABLE Usuarios (
  idNome INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  email VARCHAR(40) NOT NULL,
  Permissao INT,
  CONSTRAINT chkStatus CHECK (Permissao IN (1, 2))
);

INSERT INTO Usuarios (email, Permissao) VALUES
('granja.frizza@gmail.com', 1),
('Carlos.monteiro@gmail.com', 2),
('granjasptech@gmail.com', 1),
('Vivian.souza@hotmail.com', 2),
('Chickenjose0@gmail.com', 1),
('igor_felix@outlook.com', 2);


CREATE TABLE Empresas (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  responsavel VARCHAR(30),
  CNPJ VARCHAR(40),
  contato VARCHAR(20) NOT NULL,  
  statusempresa VARCHAR(20),
  CONSTRAINT chkempresa CHECK (statusempresa IN ('ativo', 'desativado', 'pendente'))
);

INSERT INTO Empresas (nome, responsavel, CNPJ, contato, statusempresa) VALUES
('Jose Chicken', 'José Silva Freitas', '0000000-000', '1199999-4431', 'ativo'),
('granja SPTECH', 'Vera Lucia Souza', '0000000-000', '1197642-9088', 'pendente'),
('granja do Frizza', 'Cláudio Frizzarini Santos', '0000000-000', '1192156-0163', 'desativado');

select * from Empresas;


CREATE TABLE Sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  valorTempe INT NOT NULL,
  valorUmid INT NOT NULL,
  CNPJ VARCHAR(40),
  contato VARCHAR(20) NOT NULL
);


SELECT * FROM Usuarios;

CREATE TABLE Sensor(
idTemp INT PRIMARY KEY auto_increment,
valorTemp DECIMAL (4,2), 
ValorUmid int);

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
dtLeitura DATETIME DEFAULT current_timestamp,
leituraTemp DECIMAL (5,2),
leituraUmi INT 
);

INSERT INTO Sensor (leituraTemp, leituraUmi) VALUES
(99.22, 40),
(59.20, 38),
(62.52, 44),
(93.25, 47),
(32.62, 48);


CREATE TABLE Galpoes(
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
nomeGalpao VARCHAR(30),
qtdSensores INT,
tamanho FLOAT,
responsavel VARCHAR(50),
statusGalpao VARCHAR(30),
CONSTRAINT chkStatusGalpao
	CHECK (statusGalpao IN ('ativo', 'desativado'))
);



INSERT INTO Galpoes (nomeGalpao, qtdSensores, tamanho, responsavel, statusGalpao) VALUES 
	('Galpão Leste', 5, 350.5, 'Maria Santos', 'ativo'),
	('Galpão Oeste', 3, 280.2, 'Gabriela Oliveira', 'ativo'),
	('Galpão Norte', 6, 420.8, 'João Pereira', 'desativado'),
	('Galpão Sul', 4, 310.3, 'Ana Silva', 'ativo'),
	('Galpão Central', 7, 500.0, 'Fernanda Santos', 'ativo');



