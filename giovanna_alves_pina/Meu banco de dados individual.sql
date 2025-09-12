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
 
 INSERT INTO SensorTempUmi (Temperatura, Umidade) VALUES
(24.22, 40),
(20.20, 38),
(30.52, 30),
(22.25, 47),
(32.62, 48);


-- Exibe todos os dados da tabela informada

SELECT * FROM SensorTempUmi;



-- Exibe as colunas informadas com apelidos por meio do 'AS' 

SELECT DtaLeitura AS 'Data da Leitura',
	HorarioLeitura AS 'Horário da Leitura',
	Temperatura AS 'Leitura da Temperatura ºC',
	Umidade AS 'Leitura da Umidade %'
    FROM SensorTempUmi;
    
    
-- Exibe os dados informados concatenando valores das colunas com palavras, formando um campo com texto completo
    
SELECT concat ('Em ', DtaLeitura, ' ás ', HorarioLeitura, ' foi coletada a temperatura de ', Temperatura,'ºC e o 
nível de umidade em ', Umidade,'%' ) AS 'Dados coletados pelo Sensor' FROM SensorTempUmi; 




-- Inserindo novos dados

INSERT INTO SensorTempUmi VALUES
(DEFAULT, DEFAULT, DEFAULT, 44.00, 50),
(DEFAULT, DEFAULT, DEFAULT, 47.30, 60),
(DEFAULT, DEFAULT, DEFAULT, 36.6, 55),
(DEFAULT, DEFAULT, DEFAULT, 39.2, 62);

SELECT * FROM SensorTempUmi; 



-- Faz uma atualização(update) na tabela informada, setando o campo informado, em uma determinada linha

UPDATE SensorTempUmi SET Umidade = 56
WHERE idSensor = 6;


-- Exclui uma tupla/linha da tabela 

DELETE FROM SensorTempUmi WHERE idSensor = 7;



-- 

ALTER TABLE SensorTempUmi ADD COLUMN diadasemana VARCHAR (25);

DESC SensorTempUmi;

ALTER TABLE SensorTempUmi MODIFY COLUMN diadasemana VARCHAR (30);

DESC SensorTempUmi;

ALTER TABLE SensortempUmi RENAME COLUMN diadasemana TO DiaDaSemana;

SELECT * FROM SensorTempUmi;

ALTER TABLE SensorTempUmi DROP COLUMN DiaDaSemana;


SELECT DtaLeitura, Temperatura,
	CASE
    WHEN Temperatura >= 39 THEN 'Temperatura elevada crítica'
    WHEN Temperatura >=20 AND Temperatura <= 30 THEN 'Temperatura padrão'
    WHEN Temperatura <= 19 THEN 'Temperatura baixa'
	ELSE 'Temperatura elevada'
    END AS 'Status de Temperatura'
    FROM SensorTempUmi;
    
    
SELECT * FROM SensorTempUmi ORDER BY DtaLeitura DESC;

SELECT * FROM SensorTempUmi ORDER BY Dtaleitura ASC;

SELECT * FROM SensorTempUmi
WHERE Umidade >= 39;

SELECT * FROM SensortempUmi
WHERE idSensor LIKE '4';

SELECT * FROM SensorTempUmi
WHERE idSensor NOT LIKE '10';

SELECT * FROM SensorTempUmi
WHERE idSensor != '6';


CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(60),
email VARCHAR (70) NOT NULL UNIQUE,
celular VARCHAR (20),
telefone VARCHAR (20),
cnpj CHAR (14) NOT NULL UNIQUE,
statusEmpresa VARCHAR(30),
CONSTRAINT chkStatus 
	CHECK (statusEmpresa IN ('ativo', 'desativado'))
);


INSERT INTO Empresa (nomeEmpresa, email, celular, telefone, cnpj, statusUsuario) VALUES
('Sacgalinhas', 'sacgalinhas@gmail.com', '5511982348743', '11957896461', '11103662000103', 'ativo'),
('Chickens', 'chickens@gmail.com', '5511903152624', '12365847964', '34876905000141', 'ativo'),
('Granja Alves', 'granjaalves@gmail.com', '5511903987500', '11365024536', '21664309000156', 'ativo'),
('Ficgalinha', 'ficgalinha@gmail.com', '5555901376601', '125478963201', '98863274000109', 'ativo'),
('Lima Granjas', 'limagranjas@gmail.com', '5551925467439', '11365023147', '78619119000134', 'desativado');

SELECT * FROM Empresa;

SELECT nomeEmpresa, cnpj FROM Empresa;

UPDATE Empresa SET email = 'ficgalinha@gmail.com'
	WHERE idEmpresa = 4;

ALTER TABLE Empresa RENAME COLUMN email TO emailResp;

DESCRIBE Empresa;

ALTER TABLE Empresa MODIFY COLUMN emailResp VARCHAR (50);

ALTER TABLE Empresa ADD COLUMN sigla CHAR(2);

 UPDATE Empresa SET sigla = 'mg'
WHERE idUsuario IN (1, 2, 3);
    
SHOW TABLES;

ALTER TABLE Empresa DROP COLUMN sigla;

SELECT CONCAT ('A empresa ' , nomeEmpresa, ' com o CNPJ ', cnpj, ', está ' , statusEmpresa, ' em nosso sistema') FROM Usuario;

SELECT * ,
	CASE 
	WHEN statusEmpresa = 'desativado' THEN 'Empresa sem acesso ao sistema'
    END AS 'Status da Empresa'
    FROM Empresa;


SELECT * FROM Empresa 
WHERE nomeEmpresa like 's%';
    
    
    
    
    
    
CREATE TABLE Galpao (
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
nomeGalpao VARCHAR (30),
setorGalpao VARCHAR (20),
responsavel VARCHAR (45)
);



INSERT INTO Galpoes (nomeGalpao, qtdSensores, tamanho, responsavel, statusGalpao) VALUES 
('Galpão Leste', 5, 350.5, 'Maria Santos', 'ativo'),
('Galpão Oeste', 3, 280.2, 'Gabriela Oliveira', 'ativo'),
('Galpão Norte', 6, 420.8, 'João Pereira', 'desativado'),
('Galpão Sul', 4, 310.3, 'Ana Silva', 'ativo'),
('Galpão Central', 7, 500.0, 'Fernanda Santos', 'ativo');


SELECT nomeGalpao, statusGalpao FROM Galpoes; 

SELECT nomeGalpao, responsavel, statusGalpao FROM Galpoes WHERE statusGalpao = 'ativo';
    
INSERT INTO Galpoes VALUES (DEFAULT, 'Galpão Novo Horizonte', 8, 560.8, 'Juliana Ribeiro', 'desativado');

DELETE FROM Galpoes WHERE idGalpao = 4;

UPDATE Galpoes SET responsavel = 'Matheus Silva' WHERE idGalpao = 7 ;
    
SELECT CONCAT(nomeGalpao, ' ', qtdSensores) AS 'Quantidade de Sensores no Galpão' FROM Galpoes;
    
SELECT nomeGalpao, qtdSensores, responsavel, 
	CASE 
    WHEN statusGalpao = 'ativo' THEN 'Galpão em Funcionamento'
    ELSE 'Galpão Desativado'
    END AS 'Status'
    FROM Galpoes;





CREATE TABLE Pagamento (
idPagamento INT PRIMARY KEY AUTO_INCREMENT,
formaPagamento VARCHAR(30) NOT NULL,
CONSTRAINT chkFormaPagamento
	CHECK (formaPagamento IN ('boleto', 'credito', 'pix', 'transferencia')),
dtPagamento DATETIME
);


INSERT INTO Pagamento VALUES
(DEFAULT, 'pix', '2025-09-14 12:00:00'),
(DEFAULT, 'credito', '2023-12-02 13:10:00'),
(DEFAULT, 'transferencia', '2024-07-14 10:20:00'),
(DEFAULT, 'boleto', '2025-04-10 09:30:00'),
(DEFAULT, 'pix', '2025-11-25 11:00:00'),
(DEFAULT, 'boleto', '2025-08-02 15:45:00'),
(DEFAULT, 'credito', '2021-08-03 16:00:00'),
(DEFAULT, 'transferencia', '2025-04-02 17:28:00');

SELECT * FROM Pagamento;

ALTER TABLE Pagamento MODIFY COLUMN formaPagamento VARCHAR (60);

SELECT *, 
	CASE
    WHEN formaPagamento = 'pix' THEN 'Gerar QR CODE'
    WHEN formaPagamento = 'credito' THEN 'Solicitar aprovação'
    WHEN formaPagamento = 'boleto' THEN 'Gerar PDF'
    WHEN formaPagamento = 'transferencia' THEN 'Gerar comprovante'
    END AS 'Status do Pagamento'
    FROM pagamento;
    
SELECT concat('Em ', dtPagamento, ' foi realizado o pagamento em ', formaPagamento) AS 'Forma de Pagamento' FROM Pagamento;

SHOW TABLES;
    
TRUNCATE TABLE pagamento;
    
DROP TABLE pagamento;

CREATE TABLE Plano (
idPlano INT PRIMARY KEY AUTO_INCREMENT,
statusPlano VARCHAR(15),
CONSTRAINT chkStatusPlano
	CHECK (statusPlano IN ('pago', 'pendente', 'atrasado')),
    
tipoPlano VARCHAR(15),
CONSTRAINT chkTipoPlano
	CHECK (tipoPlano IN ('mensal', 'anual')),
    
dtVencimento DATE,
valorPlano DECIMAL (7,2)
);

INSERT Plano VALUES
(DEFAULT, 'pago','mensal','2025-20-08',10000.00),
(DEFAULT,'pendente','mensal','2025-04-10',1274.00),
(DEFAULT,'atrasado','anual','2025-05-04',18000.00),
(DEFAULT,'atrasado','mensal','2025-08-03',10000.00),
(DEFAULT,'pendente','mensal','2019-06-09',14678.00),
(DEFAULT,'pago','mensal','2020-04-14',19000.00),
(DEFAULT,'pago','anual','2021-07-28',10000.00),
(DEFAULT,'pendente','anual','2023-02-17',2810.00),
(DEFAULT,'pago','anual','2025-10-07',2190.00);



DESC Plano;


SELECT * FROM Plano;



SELECT * FROM Plano 
WHERE statusPlano IN ('pendente','atrasado');
    
    


SELECT *,
	CASE
    WHEN tipoPlano = 'Mensal' AND statusPlano = 'atrasado' THEN 'Plano Mensal Atrasado'
    WHEN tipoPlano = 'anual' AND statusPlano = 'atrasado' THEN 'Plano Anual Atrasado'
    WHEN tipoPlano = 'Anual' AND statusPlano = 'pago' THEN 'Plano Anual Pago'
    WHEN tipoPlano = 'Mensal' AND statusPlano = 'pendente' THEN 'Plano Mensal Pendente'
    WHEN tipoPlano = 'Anual' AND statusPlano = 'pendente' THEN 'Plano Anual Pendente'
    WHEN tipoPlano = 'Mensal' AND statusPlano = 'pago' THEN 'Plano Mensal Pago'
    END AS 'Situação de Pagamento'
    FROM plano;
 
 
  
SELECT * FROM Plano
WHERE dtAssinatura < '2025-06-01';


SELECT * FROM Plano
WHERE dtAssinatura>= '2025-06-01';

        
SELECT * FROM plano;