CREATE DATABASE ProjetoIntegrador;

USE ProjetoIntegrador;

CREATE TABLE Sensor( idSensor 
INT PRIMARY KEY AUTO_INCREMENT, 
dtLeitura DATETIME DEFAULT current_timestamp,
leituraTemp DECIMAL (5, 2), 
leituraUmi INT, 
statusSensor VARCHAR (20) DEFAULT 'ativo', 
 localInstalacao VARCHAR (20));

INSERT INTO Sensor (leituraTemp, leituraUmi, statusSensor, localInstalacao) VALUES
(28.55, 55, 'ativo', 'Galpão Norte'),
(31.20, 42, 'ativo', 'Galpão Sul'),
(40.80, 38, 'inativo', 'Galpão Leste'),
(22.40, 60, 'ativo', 'Galpão Oeste'),
(24.35, 56, 'ativo', 'Galpão Leste'),
(27.87, 40, 'ativo', 'Galpão Leste'),
(34.12, 38, 'ativo', 'Galpão Norte');

SELECT * FROM Sensor;

ALTER TABLE Sensor MODIFY COLUMN localInstalacao VARCHAR (15);

DESCRIBE Sensor;

ALTER TABLE Sensor RENAME COLUMN localInstalacao TO localGalpao;

UPDATE Sensor SET statusSensor = 'ativo'
	WHERE idSensor = 3;
    
SELECT * FROM Sensor;

ALTER TABLE Sensor ADD COLUMN siglaEstado CHAR(2);

DESCRIBE Sensor;

UPDATE Sensor SET siglaEstado = 'SC'
	WHERE idSensor IN(1, 3, 7);

UPDATE Sensor SET siglaEstado = 'RS'
	WHERE idSensor IN (2, 4);
    
UPDATE Sensor SET siglaEstado = 'MG'
	WHERE idSensor IN (5,6);
    
SELECT * FROM Sensor;

SELECT statusSensor AS statusdoSensor FROM Sensor;

SELECT CONCAT( 'O sensor',localGalpao,'está com status', statusSensor)  
AS mensagem 
FROM Sensor;















USE ProjetoIntegrador;

CREATE TABLE Granjas( 
idGranjas INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(30),
qtdGalinha DECIMAL (5),
regiao CHAR(2),
dataEntrada DATE);

INSERT INTO Granjas( nome, qtdGalinha, regiao, dataEntrada) VALUES
('Granja Vale da vida','2000', 'RS', '2025-02-15'),
('Granja Felicidade Elias', '1543', 'MG', '2025-05-23'),
('Granja Fonseca', '1020', 'SC', '2025-04-10'),
('Granja Vieiras', '1323', 'RS', '2025-02-12'),
('Granja Almeida', '1456', 'SP', '2025-09-15'),
('Granja Francas', '2346', 'RS', '2025-05-17'),
('Granja Branquinhos', '3567', 'SC', '2025-06-15');

SELECT * FROM Granjas;

ALTER TABLE Granjas ADD COLUMN lote VARCHAR (10);

DESCRIBE Granjas;

UPDATE Granjas SET qtdGalinha = '2345'
	WHERE idGranjas = '4';
    
UPDATE Granjas SET qtdGalinha = '2685'
	WHERE idGranjas = '5';
    
SELECT * FROM Granjas;
    
ALTER TABLE Granjas ADD COLUMN licencaSanitaria VARCHAR (15);

UPDATE Granjas SET lote = 'saudavel'
	WHERE idGranjas = '1';
        
UPDATE Granjas SET lote = 'observacao'
	WHERE idGranjas = '2';
    
UPDATE Granjas SET lote = 'saudavel'
	WHERE idGranjas = '3';
    
UPDATE Granjas SET lote = 'observacao'
	WHERE idGranjas = '4';

UPDATE Granjas SET lote = 'saudavel'
	WHERE idGranjas = '5';
    
UPDATE Granjas SET lote = 'observacao'
	WHERE idGranjas = '6';
    
UPDATE Granjas SET lote = 'saudavel'
	WHERE idGranjas = '7';
    
UPDATE Granjas SET licencaSanitaria = 'Em dia'
	WHERE idGranjas IN (1, 2 , 6,7);
    
    
UPDATE Granjas SET licencaSanitaria = 'Renovacao'
	WHERE idGranjas IN (3,4 , 5);
    
SELECT * FROM Granjas; 

SELECT idGranjas, CONCAT(nome, ' - Região: ', regiao) AS NomeRegiao, qtdGalinha, dataEntrada
FROM Granjas;
    
SELECT idGranjas, nome, qtdGalinha,
    CASE 
        WHEN qtdGalinha >= 3000 THEN 'Grande Porte'
        WHEN qtdGalinha >= 1500 AND qtdGalinha < 3000 THEN 'Médio Porte'
        ELSE 'Pequeno Porte'
    END AS Categoria
FROM Granjas;
    
    
    
    
    
    
    
    
    
    




CREATE TABLE Usuario  (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(50) NOT NULL,
email VARCHAR(80) UNIQUE NOT NULL,
telefone VARCHAR(15),
cnpj CHAR (14) NOT NULL UNIQUE,
statusUsuario VARCHAR(30), dataCadastro DATE,
CONSTRAINT chkStatus 
	CHECK (statusUsuario IN ('ativo', 'desativado'))
);

INSERT INTO Usuario (nomeEmpresa, email, telefone, cnpj, statusUsuario, dataCadastro) VALUES
('Granja Vale da Vida', 'vale@outlook.com', '51999990001', '22140828000188', 'ativo', '2025-02-15'),
('Granja Felicidade Elias', 'sacelias@hotmail.com', '31999990002', '76393221000139', 'ativo', '2025-05-23'),
('Granja Fonseca', 'infonseca@hotmail.com', '47999990003', '35701154000195', 'desativado', '2025-04-10'),
('Granja Vieiras', 'vieiras@hotmail.com', '51999990004', '22258393000170', 'ativo', '2025-02-12'),
('Granja Almeida', 'almeida@outlook.com', '11999990005', '80046144000118', 'ativo', '2025-09-15'),
('Granja Francas', 'supfrancas@outlook.com', '51999990006', '97576761000128', 'desativado', '2025-05-17'),
('Granja Branquinhos', 'admwhites@hotmail.com', '47999990007', '53745591000192', 'ativo', '2025-06-15');

SELECT * FROM Usuario;

UPDATE Usuario SET telefone = '119888231777'
	WHERE idUsuario = '1';

ALTER TABLE Usuario ADD qtdGalinha INT;

DESCRIBE Usuario;

UPDATE Usuario SET qtdGalinha = 2000
	WHERE idUsuario = '1';
    
UPDATE Usuario SET qtdGalinha = 1543
	WHERE idUsuario = '2';
    
UPDATE Usuario SET qtdGalinha = 1020
	WHERE idUsuario = '3';
    
UPDATE Usuario SET qtdGalinha = 1323
	WHERE idUsuario = '4';
    
UPDATE Usuario SET qtdGalinha = 1456 
	WHERE idUsuario = '5';

UPDATE Usuario SET qtdGalinha = 2346 
	WHERE idUsuario = '6';

UPDATE Usuario SET qtdGalinha = 3567 
	WHERE idUsuario = '7';

SELECT nomeEmpresa, qtdGalinha,
CASE WHEN qtdGalinha >= 3000 THEN 'Grande Porte'
	WHEN qtdGalinha >= 1500 AND qtdGalinha <= 2999 THEN 'Médio Porte'
    END AS Categoria
FROM Usuario;

SELECT idUsuario, CONCAT(nomeEmpresa, ' | Contato: ', email) AS EmpresaContato
	FROM Usuario;
    
ALTER TABLE Usuario MODIFY COLUMN nomeEmpresa VARCHAR(30);

ALTER TABLE Usuario RENAME COLUMN dataCadastro TO dtCadastro;

DESCRIBE Usuario;  

DROP TABLE Usuario;



















CREATE TABLE Contaminacao( 
idContaminacao INT PRIMARY KEY, qtdGalinha INT, 
localGalpao VARCHAR (15), responsavel VARCHAR(15), 
regiao CHAR (2), dataContaminacao DATE,
 medidas VARCHAR(20));
 
 INSERT INTO Contaminacao( qtdGalinha, localGalpao, responsavel, regiao, medidas) VALUES
(500, 'Galpao 1', 'Joao', 'RS', '2025-02-01', 'Isolamento'),
(1200, 'Galpao 2', 'Maria', 'SP', '2025-03-10', 'Abate preventivo'),
(3000, 'Galpao 3', 'Carlos', 'MG', '2025-04-05', 'Monitoramento'),
(800, 'Galpao 4', 'Ana', 'RS', '2025-02-15', 'Isolamento'),
(2500, 'Galpao 5', 'Pedro', 'SC', '2025-05-20', 'Abate preventivo'),
(3200, 'Galpao 6', 'Rita', 'RS', '2025-08-18', 'Monitoramento');

SELECT * FROM Contaminacao;

SELECT localGalpao, qtdGalinha, medidas FROM Contaminacao;

SELECT * FROM Contaminacao ORDER BY dataContaminacao DESC;

SELECT * FROM Contaminacao
	WHERE regiao = 'RS';

UPDATE Contaminacao SET medidas = 'Isolamento total'
	WHERE localGalpao = 'Galpao 2';

UPDATE Contaminacao SET medidas = 'Quarentena + Monitoramento'
	WHERE localGalpao = 'Galpao 1';
    
ALTER TABLE Contaminacao ADD statusSanitario VARCHAR(20) DEFAULT 'Em observacao';

ALTER TABLE Contaminacao ADD tipoGripe VARCHAR(20) DEFAULT 'H5N1';

SELECT localGalpao, qtdGalinha,
	CASE 
    WHEN qtdGalinha >= 2000 THEN 'Grande Galpao'
	WHEN qtdGalinha >= 1000 AND qtdGalinha < 2000 THEN 'Medio Galpao'
	ELSE 'Pequeno Galpao'
    END AS Porte
	FROM Contaminacao;


SELECT CONCAT('Galpao: ', localGalpao, ' Responsavel: ', responsavel, 'Medidas: ', medidas) AS InfoCompleta FROM Contaminacao;












CREATE TABLE Inspecoes (
idInspecao INT PRIMARY KEY AUTO_INCREMENT,
nomeGranja VARCHAR (25),
dataInspecao DATE,
resultado VARCHAR(30),
observacoes VARCHAR(40),
responsavel VARCHAR (20)
);

INSERT INTO Inspecoes (nomeGranja, dataInspecao, resultado, observacoes, responsavel) VALUES
('Granja Vale da Vida','2025-02-01', 'Aprovado', 'Tudo em ordem', 'João'),
('Granja Felicidade Elias','2025-02-15', 'Reprovado', 'Presença de poeira ', 'Maria'),
('Granja Fonseca','2025-03-10', 'Aprovado', 'Limpeza adequada', 'Carlos'),
('Granja Vieiras','2025-03-20', 'Reprovado', 'Galpão = sinais de contaminação', 'Ana'),
('Granja Almeida', '2025-04-05', 'Aprovado', 'Frangos saudáveis', 'Pedro'),
('Granja Francas','2025-04-12', 'Reprovado', 'Falta de vacinação completa', 'Lucia'),
('Granja Branquinhos','2025-05-01', 'Aprovado', 'Equipamentos funcionando', 'Rafael');

SELECT * FROM Inspecoes;

SELECT * FROM Inspecoes
	WHERE resultado = 'Reprovado';
    
ALTER TABLE Inspecoes RENAME COLUMN responsavel TO responsaveis;

DESCRIBE Inspecoes;

SELECT * FROM Inspecoes ORDER BY dataInspecao;
    
SELECT * FROM Inspecoes 
	WHERE resultado = 'Aprovado';

UPDATE Inspecoes SET observacoes = 'Galpão com residuos acumulados'
	WHERE idInspecoes = 1;
    
UPDATE Inspecoes SET observacoes = 'Problema corrigido e monitoramento iniciado'
	WHERE resultado = 'Reprovado' AND idInspecao IN (4, 6);

ALTER TABLE Inspecoes ADD tipoInspecao VARCHAR(30);

SELECT idInspecao, idGranja, resultado,
	CASE 
	WHEN resultado = 'Aprovado' THEN 'Granja OK'
	WHEN resultado = 'Reprovado' THEN 'Necessita Atenção'
	END AS Situacao 
    FROM Inspecoes;


SELECT CONCAT('ID: ', idInspecao, 'Granja: ', idGranja, 
'Resultado: ', resultado, 'Observacoes: ', observacoes, 
'Responsavel: ', responsavel) AS InfoCompleta FROM Inspecoes;

DROP TABLE Inspecoes;