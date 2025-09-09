
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

select concat ('o ',email,' contem a permissão ', Permissao) as 'Permissões' from Usuarios;

alter table Usuarios modify column email varchar(45) not null unique;

select * from Usuarios;

desc Usuarios;



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

alter table Empresas rename column nome to nomegranja;

ALTER TABLE Empresas MODIFY COLUMN responsavel VARCHAR (45);

DESC Empresas;


CREATE TABLE Sensor(
idTemp INT PRIMARY KEY auto_increment,
dtLeitura DATETIME DEFAULT current_timestamp,
valorTemp DECIMAL (4,2) not null, 
ValorUmid int not null);

INSERT INTO Sensor (valorTemp, ValorUmid) VALUES
(50.22, 40),
(46.20, 38),
(29.52, 44),
(39.25, 47),
(32.62, 48);

select * from Sensor;

alter table Sensor rename column ValorUmid to valorUmid;

desc Sensor;

select concat ('Em ',  dtLeitura, ' foi coletado a temperatura em ', valorTemp, ' e a umidade ', valorUmid) as 'data da coleta' from Sensor;


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



