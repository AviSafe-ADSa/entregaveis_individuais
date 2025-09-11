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
CREATE TABLE historicoAvisos(
	idAviso 		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    risco 			DECIMAL(5,2),
    dtAviso 		DATETIME NOT NULL,
    tempRegistrada 	DECIMAL(5,2) NOT NULL,
    descAviso 		TEXT
);

CREATE TABLE Empresa(
	idEmpresa 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nmEmpresa 	VARCHAR(45) UNIQUE NOT NULL,
	cnpj 		CHAR(14) UNIQUE NOT NULL,
	responsavel	VARCHAR(45) NOT NULL UNIQUE,
	endereco 	VARCHAR(100)

);
CREATE TABLE Usuario(
	idUsuario 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	username 	VARCHAR(45) NOT NULL UNIQUE,
	senha 		VARCHAR(20) NOT NULL, 
	permissao 	INT NOT NULL
);

CREATE TABLE Permissao(
	idPermissao 	INT PRIMARY KEY,
	tipoPermissao 	INT
    CONSTRAINT chkPermissao
		CHECK (tipoPermissao in ('Administrador', 'Cliente'))
);

CREATE TABLE Pagamento(
	idPagamento 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	dtPagamento 	DATETIME NOT NULL,
	valorPagamento 	DECIMAL(8,2) NOT NULL,
	pagante 		VARCHAR(45) NOT NULL,
	recebedor 		VARCHAR(45) NOT NULL,
    statusPagamento VARCHAR(45) NOT NULL,
    codNF 			CHAR(44) NOT NULL,
    CONSTRAINT chkPagamento CHECK (
	CASE
		WHEN
			Pagamento.valorPagamento = PlanoCliente.valorMensal
        THEN statusPagamento = 'Pagamento OK'
           )
);

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
	mQuadradosTotais 	DECIMAL(8,2) NOT NULL
    CONSTRAINT chkStatusPlano 
		CHECK (statusPlano IN ('Pago', 'Pendente', 'Vencido', 'Em orçamento', 'Contrato Encerrado'))
);

CREATE TABLE Granja(
	idGranja 		INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nmGranja 		VARCHAR(50) NOT NULL,
	endGranja 		VARCHAR(100) NOT NULL,
	responsavel 	VARCHAR(100) NOT NULL
);

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

CREATE TABLE Ave(
	idAve 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nmAve 	VARCHAR(45) NOT NULL,
	tipo 	VARCHAR(45) NOT NULL,
	qtd 	INT NOT NULL,
	valor 	DECIMAL(8,2) NOT NULL
);


