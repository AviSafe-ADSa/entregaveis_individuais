CREATE DATABASE aviSafe;
USE aviSafe;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(100) UNIQUE NOT NULL,
	senha CHAR(8) NOT NULL,
    statusUsuario VARCHAR(10),
		CONSTRAINT chkStatusUsuario CHECK (statusUsuario IN('Ativo', 'Inativo'))
);

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) UNIQUE NOT NULL,
    cnpj CHAR(14) NOT NULL,
    telefone VARCHAR(11), -- sem simbolos especiais, telefone fixo ou telefone celular
	endereco VARCHAR(100)
);

CREATE TABLE medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	umidade DECIMAL(5,2), -- leitura da umidade
	temperatura DECIMAL(5,2), -- leitura da temperatura
	dataHora DATETIME -- data e hora da medida captada
);

CREATE TABLE alerta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30), -- temperatura, umidade
    nivel VARCHAR(20), -- baixa, alta
    descricao VARCHAR(100), -- se foi uma alerta falso ou urgência
    dataHora DATETIME -- data e hora do alerta
);

CREATE TABLE galpao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    qtdSensor INT, -- quantidade de sensores no galpão
    tamanho FLOAT, -- tamanho do galpáo
    dataInstalacao DATETIME NOT NULL, -- data da instalação do sensor
    dataManutencao DATETIME, -- última manutenção de sensor
    statusSensor VARCHAR(50), 
		CONSTRAINT chkStatus CHECK (statusSensor IN('Ativo', 'Inativo', 'Manutenção')) -- verificacão do status sensor
);

INSERT INTO usuario VALUES 
	(default, 'Giovanna', 'giovanna@email.com', '12345678', 'Ativo'),
	(default, 'Michel', 'michel@email.com', '12312312', 'Inativo'),
	(default, 'Gustavo', 'gustavo@email.com', '09461823', 'Ativo'),
	(default, 'Maria', 'maria@email.com', '74628234', 'Ativo');

INSERT INTO empresa VALUES 
	(default, 'Fazenda Feliz', '12348251324123', '1120121345', 'Avenida Mato Rosa'),
	(default, 'Fazenda Lagoa', '19358295624283', '1323215843', 'Rua Laje'),
	(default, 'Granja Glamour', '11196478294447', '1192635473', 'Travessa Amar'),
	(default, 'Fazenda Loas', '72639165093123', '1143231115', 'Rua Mar Preto');

INSERT INTO alerta VALUES
    (default, 'Umidade', 'Alta', 'Alerta falso: oscilação acima de 85%', '2025-09-02 08:35:00'),
    (default, 'Temperatura', 'Baixa', 'Urgência: temperatura caiu abaixo de 7°C', '2025-09-05 09:10:00'),
    (default, 'Temperatura', 'Alta', 'Alerta falso: oscilação de temperatura acima de 34°C', '2025-09-09 09:45:00'),
    (default, 'Umidade', 'Baixa', 'Urgência: umidade crítica abaixo de 10%', '2025-09-05 10:05:00');

INSERT INTO medida VALUES
	(default, 65.20, 28.50, '2025-09-10 08:30:00'),
	(default, 70.15, 27.90, '2025-05-10 09:20:01'),
	(default, 68.40, 29.10, '2025-03-10 09:30:55'),
	(default, 72.55, 28.70, '2025-01-10 10:01:10');

INSERT INTO galpao VALUES
	(default, 'Azul', 12, 250.5, '2025-03-15 08:00:00', '2025-09-02 09:30:00', 'Ativo'),
	(default, 'Vermelho', 10, 210.3, '2025-03-15 09:15:00', '2025-09-09 11:40:00', 'Ativo'),
	(default, 'Preto', 5, 105.1, '2025-08-05 10:00:00', NULL, 'Ativo'),
	(default, 'Rosa', 8, 180.0, '2025-09-01 07:45:00', NULL,'Ativo');
    
SELECT * FROM usuario;
SELECT * FROM empresa;
SELECT * FROM alerta;
SELECT * FROM medida;
SELECT * FROM galpao;

-- tabela usuário
SELECT * FROM usuario 
	WHERE statusUsuario = 'Ativo';
    
-- tabela empresa


-- tabela alerta


-- tabela medida


-- tabela galpao