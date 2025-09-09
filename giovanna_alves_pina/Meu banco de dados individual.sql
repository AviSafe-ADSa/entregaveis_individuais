CREATE DATABASE AVISAFE;

USE AVISAFE;


-- Tabela para armazenar dados coletados pelo sensor
/*
INT define que o dado é do tipo número inteiro
PRIMARY KEY define que aquele campo é a chave primária da tabela
que é um campo que não pode se repetir
AUTO_INCREMENT define que aquele campo vai se incrementar gerando um valor único 
e sequencial
TIME define que o campo do tipo horario (horas:minutos:segundos)
DATE define que o campo é do tipo data (ano:mês:dia)
DEFAULT 
CURRENT
DECIMAL

*/
CREATE TABLE SensorTempUmi (
 idSensor INT PRIMARY KEY AUTO_INCREMENT,
 DtaLeitura DATE DEFAULT (CURRENT_DATE),
 HorarioLeitura TIME DEFAULT (CURRENT_TIME),
 Temperatura DECIMAL (5,2),
 Umidade INT
 ); 
 
 
 -- Apaga a tabela informada
 -- DROP TABLE SensorTempUmi;
 

 
 
 -- Insere dentro(into) da tabela informada, os valores (values) abaixo dentro das colunas especificadas
 
 INSERT INTO Sensor (leituraTemp, leituraUmi) VALUES
(24.22, 40),
(20.20, 38),
(30.52, 30),
(22.25, 47),
(32.62, 48);


-- Exibe todos os dados da tabela informada

SELECT * FROM sensor;



-- Exibe as colunas informadas com apelidos por meio do 'AS' 

SELECT DtaLeitura AS 'Data da Leitura',
	HorarioLeitura AS 'Horário da Leitura',
	Temperatura AS 'Leitura da Temperatura ºC',
	Umidade AS 'Leitura da Umidade %'
    FROM SensorTempUmi;
    
    
-- Exibe os dados informados concatenando valores das colunas com palavras, formando um campo com texto completo
    
SELECT concat ('Em ', DtaLeitura, 'ás', HorarioLeitura, ' foi coletada a temperatura ', Temperatura,'ºC e o 
nível de umidade em ', Umidade,'%' ) AS 'Dados coletados pelo Sensor' FROM Sensor; 




-- Inserindo novos dados

INSERT INTO Sensor VALUES
(DEFAULT, DEFAULT,44.00, 50),
(DEFAULT, DEFAULT,47.30, 60),
(DEFAULT, DEFAULT,36.6, 55),
(DEFAULT, DEFAULT,39.2, 62);

SELECT * FROM Sensor; 



-- Faz uma atualização(update) na tabela informada, setando o campo informado, em uma determinada linha

UPDATE SensorTempUmi SET Umidade = 56
WHERE idSensor = 6;


-- Exclui uma tupla/linha da tabela 

DELETE FROM Sensor WHERE idSensor = 7;



-- 

ALTER TABLE Sensor ADD COLUMN diadasemana VARCHAR (25);

DESC Sensor;

ALTER TABLE Sensor MODIFY COLUMN diadasemana VARCHAR (30);

DESC Sensor;

ALTER TABLE Sensor RENAME COLUMN diadasemana TO DiaDaSemana;

SELECT * FROM Sensor;

ALTER TABLE Sensor DROP COLUMN DiaDaSemana;


SELECT dtLeitura, leituraTemp,
	CASE
    WHEN leituraTemp >= 50 THEN 'Temperatura crítica'
    WHEN leituraTemp <=30 THEN 'Temperatura normal'
	ELSE 'Temperatura elevada'
    END AS 'Status de Temperatura'
    FROM Sensor;
    
    
SELECT * FROM Sensor ORDER BY dtLeitura DESC;

SELECT * FROM Sensor ORDER BY dtleitura ASC;

SELECT * FROM Sensor
WHERE leituraUmi >=48;

SELECT * FROM Sensor
WHERE idSensor LIKE '14';

SELECT * FROM Sensor
WHERE idSensor NOT LIKE '10';

SELECT * FROM Sensor
WHERE idSensor != '6';


CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(60),
email VARCHAR (70) NOT NULL UNIQUE,
celular VARCHAR (20),
telefone VARCHAR (20),
cnpj CHAR (14) NOT NULL UNIQUE
);


CREATE TABLE Galpao (
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
nomeGalpao VARCHAR (30)
setorGalpao 
responsavel 

);


CREATE TABLE FormaPagamento (

);

