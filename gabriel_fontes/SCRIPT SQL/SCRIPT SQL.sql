CREATE DATABASE AviSafeSensors;
USE AviSafeSensors;
DROP DATABASE AviSafeSensors;


CREATE TABLE Sensor (
	idSensor 		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    modeloSensor	VARCHAR(45),
	dtTemperatura 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	vlTemp 			DECIMAL(5,2) NOT NULL, 
    vlUmi 			DECIMAL (5,2) NOT NULL
);

INSERT INTO Sensor (modeloSensor, vlTemp, vlUmi) 
VALUES ('Modelo DHT', 22.5, 55.0);

INSERT INTO Sensor (modeloSensor, vlTemp, vlUmi) 
VALUES ('Modelo DHT', 24.0, 60.0);

INSERT INTO Sensor (modeloSensor, vlTemp, vlUmi) 
VALUES ('Modelo LM35', 18.3, 50.0);

CREATE TABLE historicoAvisos(
	idAviso 		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    risco 			DECIMAL(5,2),
    dtAviso 		DATETIME NOT NULL,
    tempRegistrada 	DECIMAL(5,2) NOT NULL,
    descAviso 		TEXT
);
INSERT INTO historicoAvisos (risco, dtAviso, tempRegistrada, descAviso) 
VALUES (5.5, '2025-09-10 10:00:00', 35.0, 'Risco elevado de proliferação detectado no sensor DHT11');

INSERT INTO historicoAvisos (risco, dtAviso, tempRegistrada, descAviso) 
VALUES (2.0, '2025-09-10 12:00:00', 12.5, 'Aviso de temperatura abaixo do ideal');

INSERT INTO historicoAvisos (risco, dtAviso, tempRegistrada, descAviso) 
VALUES (7.0, '2025-09-10 14:30:00', 40.0, 'Risco crítico de proliferação');


CREATE TABLE Empresa(
	idEmpresa 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nmEmpresa 	VARCHAR(45) UNIQUE NOT NULL,
	cnpj 		CHAR(14) UNIQUE NOT NULL,
	responsavel	VARCHAR(45) NOT NULL UNIQUE,
	endereco 	VARCHAR(100)

);

INSERT INTO Empresa (nmEmpresa, cnpj, responsavel, endereco) 
VALUES ('FRANGO ASSADO', '56309671000193', 'Igor felix', 'Rua haddock lobo 595, 100');

INSERT INTO Empresa (nmEmpresa, cnpj, responsavel, endereco) 
VALUES ('SEARA', '42570926000162', 'Gabriel Fontes', 'Av. Paulista, 200');

INSERT INTO Empresa (nmEmpresa, cnpj, responsavel, endereco) 
VALUES ('PERDIGAO', '20048826000138', 'Giovana', 'Av. Faria Lima, 300');

CREATE TABLE Usuario(
	idUsuario 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	username 	VARCHAR(45) NOT NULL UNIQUE,
	senha 		VARCHAR(20) NOT NULL, 
	permissao 	INT NOT NULL
);

INSERT INTO Usuario (username, senha, permissao) 
VALUES ('admin', 'admin123', 1);

INSERT INTO Usuario (username, senha, permissao) 
VALUES ('TOPFRANGO', 'cliente01pass', 2);

INSERT INTO Usuario (username, senha, permissao) 
VALUES ('GALINHOTAS', 'cliente02pass', 2);


CREATE TABLE Permissao(
	idPermissao 	INT PRIMARY KEY,
	tipoPermissao 	VARCHAR(45)
    CONSTRAINT chkPermissao
		CHECK (tipoPermissao in ('Administrador', 'Cliente'))
);
INSERT INTO Permissao (idPermissao, tipoPermissao) 
VALUES (1, 'Administrador');

INSERT INTO Permissao (idPermissao, tipoPermissao) 
VALUES (2, 'Cliente');


CREATE TABLE Pagamento(
	idPagamento 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	dtPagamento 	DATETIME NOT NULL,
	valorPagamento 	DECIMAL(8,2) NOT NULL,
	pagante 		VARCHAR(45) NOT NULL,
	recebedor 		VARCHAR(45) NOT NULL,
    statusPagamento VARCHAR(45) NOT NULL,
    codNF 			CHAR(44) NOT NULL
);

INSERT INTO Pagamento (dtPagamento, valorPagamento, pagante, recebedor, statusPagamento, codNF) 
VALUES ('2025-09-10 15:00:00', 100.00, 'Cliente GRANJA GALINHOTAS', 'AviSafe Ltda', 'Pago', '35190812345678000198550010000012345678901234');

INSERT INTO Pagamento (dtPagamento, valorPagamento, pagante, recebedor, statusPagamento, codNF) 
VALUES ('2025-09-09 17:00:00', 200.00, 'Cliente2', 'GRANJA TOP', 'Pendente', '35190912345678000198550010000098765432100987');

INSERT INTO Pagamento (dtPagamento, valorPagamento, pagante, recebedor, statusPagamento, codNF) 
VALUES ('2025-09-08 12:00:00', 300.00, 'Cliente3', 'GRANJA TOPFRANGO', 'Cancelado', '35190712345678000198550010000045678901234567');
	
CREATE TABLE PlanoCliente(
	idPlano 			INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nmGranja 			VARCHAR(45) NOT NULL,
	tipoPlano 			VARCHAR(25) NOT NULL,
	tipoSensor 			VARCHAR(45) NOT NULL,
    statusPlano			VARCHAR(45) NOT NULL,
	qtdSensores 		INT NOT NULL,
	dtOrcamento 		DATE NOT NULL,
	valorMensal 		DECIMAL (8,2) NOT NULL,
	dtInicioContrato 	DATE,
	dtFimContrato  		DATE,
	valorTotalContrato 	DECIMAL(8,2) NOT NULL,
	valorInstalacao 	DECIMAL (8,2),
	dtInstalacao 		DATE,
	endInstalacao 		VARCHAR(100) NOT NULL,
	valorLogistica 		DECIMAL (8,2) NOT NULL,
	dtManutencao 		DATE,
	valorManutencao 	DECIMAL(8,2),
	manutencaoIsAvulsa	TINYINT,
	motivoManutencao 	TEXT,
	valorSuporte 		DECIMAL(8,2),
	mQuadradosTotais 	DECIMAL(8,2) NOT NULL,
    CONSTRAINT chkStatusPlano 
		CHECK (statusPlano IN ('Pago', 'Pendente', 'Vencido', 'Em orçamento', 'Contrato Encerrado'))
);
INSERT INTO PlanoCliente (nmGranja, tipoPlano, tipoSensor, statusPlano, qtdSensores, dtOrcamento, valorMensal, dtInicioContrato,
 dtFimContrato, valorTotalContrato, valorInstalacao, dtInstalacao, endInstalacao, valorLogistica, dtManutencao, valorManutencao,
 manutencaoIsAvulsa, motivoManutencao, valorSuporte, mQuadradosTotais) 
VALUES ('Granja TOPFRANGO', 'Mensal', 'Modelo DHT11', 'Pendente', 10, '2025-09-01', 150.00, '2025-09-01', '2026-09-01', 1800.00, 500.00, '2025-09-15',
 'AV PAULISTA', 300.00, '2025-12-01', 100.00, 1, 'Manutenção de rotina', 50.00, 1000.00);

INSERT INTO PlanoCliente (nmGranja, tipoPlano, tipoSensor, statusPlano, qtdSensores, dtOrcamento, valorMensal, dtInicioContrato,
 dtFimContrato, valorTotalContrato, valorInstalacao, dtInstalacao, endInstalacao, valorLogistica, dtManutencao, valorManutencao,
 manutencaoIsAvulsa, motivoManutencao, valorSuporte, mQuadradosTotais) 
VALUES ('Granja TOP', 'Anual', 'Modelo DHT11', 'Pago', 20, '2025-08-15', 250.00, '2025-08-20', '2026-08-20', 3000.00, 600.00, '2025-08-25',
 'Av FARIA LIMA', 400.00, '2025-11-01', 150.00, 0, 'Sem manutenção', 60.00, 2000.00);

INSERT INTO PlanoCliente (nmGranja, tipoPlano, tipoSensor, statusPlano, qtdSensores, dtOrcamento, valorMensal, dtInicioContrato,
 dtFimContrato, valorTotalContrato, valorInstalacao, dtInstalacao, endInstalacao, valorLogistica, dtManutencao, valorManutencao,
 manutencaoIsAvulsa, motivoManutencao, valorSuporte, mQuadradosTotais) 
VALUES ('Granja GALINHOTAS', 'Mensal', 'Modelo LM35', 'Vencido', 5, '2025-07-01', 120.00, '2025-07-01', '2025-12-31', 1440.00, 400.00, '2025-07-10',
 'AV TABOÃO', 250.00, '2025-10-01', 80.00, 1, 'Manutenção emergencial', 40.00, 800.00);

CREATE TABLE Granja(
	idGranja 		INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nmGranja 		VARCHAR(50) NOT NULL,
	endGranja 		VARCHAR(100) NOT NULL,
	responsavel 	VARCHAR(100) NOT NULL
);
INSERT INTO Granja (nmGranja, endGranja, responsavel) 
VALUES ('Granja TOP', 'AV TABOAO, 100', 'Igor felix');

INSERT INTO Granja (nmGranja, endGranja, responsavel) 
VALUES ('Granja GALINHOTAS', 'AV FARIA LIMA, 200', 'Gabriel Fontes');

INSERT INTO Granja (nmGranja, endGranja, responsavel) 
VALUES ('Granja TOPFRANGO', 'AV PAULISTA, 300', 'Gustavo');

CREATE TABLE Setor(
	idSetor 			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codSetor 			CHAR(4) NOT NULL,
	tipoAve 			VARCHAR(45),
	tempIdeal 			DECIMAL(5,2) NOT NULL,
	riscoContaminacao 	DECIMAL(5,2),
	responsavel 		VARCHAR(100) NOT NULL,
    mQuadrados			INT,
    statusSetor 		VARCHAR(45) NOT NULL
    CONSTRAINT chkStatusSetor 
		CHECK (statusSetor IN ('Em Operação', 'Inativo'))
);
INSERT INTO Setor (codSetor, tipoAve, tempIdeal, riscoContaminacao, responsavel, mQuadrados, statusSetor)
VALUES ('S001', 'Frango', 22.5, 5.0, 'Gustavo mota', 200, 'Em Operação');

INSERT INTO Setor (codSetor, tipoAve, tempIdeal, riscoContaminacao, responsavel, mQuadrados, statusSetor)
VALUES ('S002', 'Peru', 18.0, 3.5, 'Giovana Branquinho', 300, 'Em Operação');

INSERT INTO Setor (codSetor, tipoAve, tempIdeal, riscoContaminacao, responsavel, mQuadrados, statusSetor)
VALUES ('S003', 'Galinha', 20.0, 4.0, 'Igor', 150, 'Inativo');

INSERT INTO Setor (codSetor, tipoAve, tempIdeal, riscoContaminacao, responsavel, mQuadrados, statusSetor)
VALUES ('S004', 'Codorna', 19.5, 2.0, 'Jorge', 100, 'Em Operação');

INSERT INTO Setor (codSetor, tipoAve, tempIdeal, riscoContaminacao, responsavel, mQuadrados, statusSetor)
VALUES ('S005', 'Frango', 21.0, 4.5, 'GIovana alves', 250, 'Em Operação');


CREATE TABLE Ave(
	idAve 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nmAve 	VARCHAR(45) NOT NULL,
	tipo 	VARCHAR(45) NOT NULL,
	qtd 	INT NOT NULL,
	valor 	DECIMAL(8,2) NOT NULL
);

INSERT INTO Ave (nmAve, tipo, qtd, valor)
VALUES ('Frango de abate', 'Frango de Corte', 500, 15.00);

INSERT INTO Ave (nmAve, tipo, qtd, valor)
VALUES ('Galetos', 'Peru de abate', 200, 25.00);

INSERT INTO Ave (nmAve, tipo, qtd, valor)
VALUES ('Galinha Caipira', 'Galinha de Ovos', 300, 10.00);

INSERT INTO Ave (nmAve, tipo, qtd, valor)
VALUES ('Poedeira', 'Galinha', 150, 5.00);

INSERT INTO Ave (nmAve, tipo, qtd, valor)
VALUES ('Galinha', 'Frango de Corte', 600, 14.50);


ALTER TABLE Sensor
ADD CONSTRAINT chkTempUmi CHECK (vlTemp >= -30 AND vlTemp <= 50 AND vlUmi >= 0 AND vlUmi <= 100);

ALTER TABLE historicoAvisos
ADD CONSTRAINT chkRisco CHECK (risco >= 0 AND risco <= 10);

ALTER TABLE Pagamento
ADD CONSTRAINT chkStatusPagamento CHECK (statusPagamento IN ('Pago', 'Pendente', 'Cancelado'));

ALTER TABLE PlanoCliente
ADD CONSTRAINT chkTipoPlano CHECK (tipoPlano IN ('Mensal', 'Anual'));

ALTER TABLE Setor
ADD CONSTRAINT chkTipoAve CHECK (tipoAve IN ('Frango', 'Peru', 'Codorna', 'Galinha'));

SELECT 
    e.nmEmpresa, 
    e.cnpj 
FROM Empresa e
WHERE e.nmEmpresa IN ('FRANGO ASSADO', 'SEARA')
ORDER BY e.cnpj;

SELECT 
    e.nmEmpresa, 
    e.cnpj 
FROM Empresa e
WHERE e.nmEmpresa IN ('FRANGO ASSADO', 'SEARA')
ORDER BY e.cnpj;

SELECT 
    p.pagante, 
    p.statusPagamento,
    CASE 
        WHEN p.statusPagamento = 'Pago' THEN 'Pagamento realizado'
        WHEN p.statusPagamento = 'Pendente' THEN 'Pagamento pendente'
        WHEN p.statusPagamento = 'Cancelado' THEN 'Pagamento cancelado'
        ELSE 'Status desconhecido'
    END AS Status_Descricao
FROM Pagamento p;

SELECT 
    g.nmGranja, 
    g.endGranja 
FROM Granja g
WHERE g.nmGranja LIKE 'Granja TOP%';

SELECT 
    s.codSetor, 
    s.tipoAve, 
    s.statusSetor
FROM Setor s
WHERE s.tipoAve IN ('Frango', 'Galinha') 
  AND s.statusSetor = 'Em Operação';

SELECT 
    p.nmGranja, 
    p.dtInicioContrato,
    CASE 
        WHEN p.dtFimContrato > CURRENT_DATE THEN 'Plano ativo'
        WHEN p.dtFimContrato <= CURRENT_DATE THEN 'Plano expirado'
        ELSE 'Data inválida'
    END AS Status_Planos
FROM PlanoCliente p
WHERE p.statusPlano = 'Pago'
ORDER BY p.dtInicioContrato DESC;

SELECT 
    CONCAT(s.nmAve, ' - ', s.tipo) AS 'TIPO DE AVE',
    s.qtd, 
    s.valor
FROM Ave s
WHERE s.tipo IN ('Frango de Corte', 'Galinha de Ovos');

SELECT 
    ha.descAviso,
    ha.risco,
    ha.dtAviso
FROM historicoAvisos ha
WHERE 
ha.risco IN (5.5, 7.0)
ORDER BY ha.dtAviso DESC;



