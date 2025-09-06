CREATE DATABASE Sprint1;
USE Sprint1;

CREATE TABLE Sensor(
idSensor 		INT PRIMARY KEY AUTO_INCREMENT,
leituraUmi 		DECIMAL(5,2),
leituraTemp 	DECIMAL(5,2),
dtLeitura 		DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Sensor (leituraUmi, leituraTemp)VALUES
(50.3 , 25.5),
(55.5 , 20.2),
(90.7 , 35.3),
(10.8 , 10.4),
(18.1 , 33.4),
(2.3 , 36.9),
(25.5 , 12.9);

SELECT * FROM Sensor; 

SELECT leituraUmi,
	CASE
	WHEN leituraUmi <= 50 THEN 'Umidade está baixa'
    WHEN leituraUmi > 50 THEN 'Umidade está alta'
    END AS 'Umidade do ar'
    FROM Sensor;
    
SELECT CONCAT(leituraUmi, ' ' ,dtLeitura) AS 'LEITURA DE UMIDADE E A DATA DE LEITURA' FROM Sensor;
  
SELECT CONCAT('A umidade está em ', leituraUmi , ' e a temperatura está ' , leituraTemp) AS 'LEITURA DE UMIDADE E TEMPERATURA' FROM Sensor;  


CREATE TABLE Usuario(
idUsuario 		INT PRIMARY KEY AUTO_INCREMENT,
nomeFantasia	VARCHAR(100) NOT NULL,
email			VARCHAR(100) NOT NULL UNIQUE,
telefone		VARCHAR(11),
CNPJ			VARCHAR(14) NOT NULL UNIQUE,
statusUsuario	TINYINT DEFAULT 1 -- validador para bloquear usuario futuramente começa como 1 pois o usario ao ser cadastrado ja vem como padrao 1 se for 0 logo usuario bloqueado
);

INSERT INTO Usuario (nomefantasia, email, telefone, CNPJ) VALUES
('Aviario Freitas','aviFreitas@gmail.com', '11959491637', '00015642102361'),
('Aviario Silva','aviSilva@gmail.com', '11989561127', '00011234104561'),
('Granja Oliveira','granja_oliveiras@gmail.com', '11980011127', '02111234104567'),
('Granja Pereira','pereiras_granjeiro@gmail.com', '11983215622', '05011222104511'),
('Granja Plinio','plinio_granjas@gmail.com', '11985011987', '00011234104451'),
('Granja Patinho','patinho_granja@gmail.com', '11985615121', '10031238194951');

SELECT * FROM Usuario;

UPDATE Usuario SET nome =
	CASE 
    WHEN nome LIKE 'Aviario%' THEN 'Granja'
    END 


CREATE TABLE Galpao(
idGalpao 		INT PRIMARY KEY AUTO_INCREMENT,
nome 			VARCHAR(100) NOT NULL,
tamanho			DECIMAL(8,2),
nomeResponsavel	VARCHAR(100),
qtdSensores		INT,
statuGalpao		TINYINT DEFAULT 1,
observacoes		TEXT
);

INSERT INTO Galpao(nome, tamanho, nomeResponsavel, qtdSensores) VALUES 
('Ala sul' , 5000.00 , 'Gustavo Alves' , 10),
('Ala norte' , 3000.00 , 'Gustavo Alves' , 50),
('Ala nova sul' , 1500.00 , 'Jorge' , 20),
('Ala nova B' , 7500.00 , 'Jorge' , 70);

SELECT * FROM Galpao;

CREATE TABLE Plano(
idPlano			INT PRIMARY KEY AUTO_INCREMENT,
nome			VARCHAR(100),
statusPlano		TINYINT DEFAULT 1,
tipoPlano		VARCHAR(50) CONSTRAINT chkPlano CHECK (tipoPlano IN ('Mensal' , 'Semestral','Anual')),
observacoes		TEXT,
idUsuario		INT -- EM um futuro proximo isso vai virar uma chave estrangeira
);


INSERT INTO Plano(nome, tipoPlano, idUsuario) VALUES 
('Plano mensal', 'Mensal' , 1),
('Plano semestral', 'Semestral' , 2),
('Plano semestral', 'Semestral' , 3),
('Plano Anual', 'Anual' , 4);

SELECT * FROM Plano;

CREATE TABLE Pagamento(
idPagamento		INT PRIMARY KEY AUTO_INCREMENT,
dtPagamento		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
statusPagamento	TINYINT, -- caso 1 pagametno feito com sucessos caso 0 pagamento errado, então 
observacoes		TEXT,
idUsuario		INT -- EM um futuro proximo isso vai virar uma chave estrangeira
);

INSERT INTO Pagamento(idUsuario)VALUES 
(3),
(1),
(2),
(4);

SELECT * FROM Pagamento;