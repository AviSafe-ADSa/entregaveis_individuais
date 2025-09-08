
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

select  concat ('o contato do ', responsavel, '  responsavel pela ' , nome, ' é ', contato) as 'contatos' from Empresas;

ALTER TABLE Empresas MODIFY COLUMN responsavel VARCHAR (45);

DESC Empresas;


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



