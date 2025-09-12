-- CREATE DATABASE AviSafe;
USE AviSafe;


CREATE TABLE Usuarios (
  idNome INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE,
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


SELECT CONCAT('o ',email,' contem a permissão ', Permissao) AS 'Permissões' 
FROM Usuarios;

SELECT 
    email,
    CASE 
        WHEN Permissao = 1 THEN 'Usuario com permissão total'
        WHEN Permissao = 2 THEN 'Usuário com permissão limitada'
        ELSE 'Usuario sem Permissão'
    END AS TipoPermissao
FROM Usuarios;

SELECT * FROM Usuarios;
DESC Usuarios;



CREATE TABLE Empresas (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nomegranja VARCHAR(30) NOT NULL,
  responsavel VARCHAR(45),
  CNPJ VARCHAR(40),
  contato VARCHAR(20) NOT NULL,  
  statusempresa VARCHAR(20),
  CONSTRAINT chkempresa CHECK (statusempresa IN ('ativo', 'desativado', 'pendente'))
);

INSERT INTO Empresas (nomegranja, responsavel, CNPJ, contato, statusempresa) VALUES
('Jose Chicken', 'José Silva Freitas', '0000000-000', '1199999-4431', 'ativo'),
('granja SPTECH', 'Vera Lucia Souza', '0000000-000', '1197642-9088', 'pendente'),
('granja do Frizza', 'Cláudio Frizzarini Santos', '0000000-000', '1192156-0163', 'desativado');


SELECT * FROM Empresas;

SELECT CONCAT('o contato do ', responsavel, ' responsavel pela ', nomegranja, ' é ', contato) AS 'contatos' 
FROM Empresas;


SELECT 
    nomegranja,
    responsavel,
    CASE 
        WHEN statusempresa = 'ativo' THEN 'Acesso liberado'
        WHEN statusempresa = 'desativado' THEN 'Atenção! Você tem pendencias'
        WHEN statusempresa = 'pendente' THEN 'Alerta! Usuario sem acesso'
        ELSE 'Status indefinido'
    END AS Situacao
FROM Empresas;

DESC Empresas;



CREATE TABLE Sensor(
  idTemp INT PRIMARY KEY auto_increment,
  dtLeitura DATETIME DEFAULT current_timestamp,
  valorTemp DECIMAL (4,2) not null, 
  valorUmid INT not null
);

INSERT INTO Sensor (valorTemp, valorUmid) VALUES
(50.22, 40),
(46.20, 38),
(29.52, 44),
(39.25, 47),
(32.62, 48);


SELECT * FROM Sensor;

DESC Sensor;

SELECT CONCAT('Em ',  dtLeitura, ' foi coletado a temperatura em ', valorTemp, ' e a umidade ', valorUmid) AS 'data da coleta' 
FROM Sensor;


SELECT 
    dtLeitura,
    valorTemp,
    valorUmid,
    CASE 
        WHEN valorTemp > 40 THEN 'Alerta: Temperatura Alta'
        WHEN valorTemp BETWEEN 30 AND 40 THEN 'Temperatura Normal'
        ELSE 'Temperatura Baixa'
    END AS SituacaoTemperatura,
    CASE 
        WHEN valorUmid < 40 THEN 'Umidade Baixa'
        WHEN valorUmid BETWEEN 40 AND 50 THEN 'Umidade Adequada'
        ELSE 'Umidade Alta'
    END AS SituacaoUmidade
FROM Sensor;



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
	('Galpão Oeste', 8, 600.0, 'Rafael Costa', 'ativo'),
	('Galpão Sul', 4, 320.5, 'Juliana Alves', 'desativado'),
	('Galpão Norte', 10, 750.3, 'Pedro Martins', 'ativo'),
	('Galpão Leste', 6, 410.8, 'Lucas Nunes', 'ativo'),
	('Galpão Central', 3, 250.4, 'Mariana Rocha', 'desativado');


SELECT * FROM Galpoes;

alter table Galpoes rename column nomeGalpao to nome;

select concat (' O galpao ', nome, ' utiliza ', qtdSensores, ' sensores, pois ele tem o tamanho de ', tamanho, ' metros quadrados, e o seu responsavel é ' ,responsavel, ' e o status atual do galpão é', statusGalpao) as 'dados do galpão' from Galpoes;


desc Galpoes;


SELECT 
    nomeGalpao,
    qtdSensores,
    tamanho,
    responsavel,
    CASE 
        WHEN statusGalpao = 'ativo' THEN 'Galpão em uso'
        WHEN statusGalpao = 'desativado' THEN 'Galpão desativado'
        ELSE 'Galpão sem status'
    END AS Situacao
FROM Galpoes;

drop table Galpoes;