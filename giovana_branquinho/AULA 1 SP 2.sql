-- Sprint 2 

-- AULA 2

CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE responsavel (idResponsavel
INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR (45)) AUTO_INCREMENT = 5000;

INSERT INTO responsavel (nome) VALUES
('Yasmin'),
('William'),
('Ariel');

SELECT * FROM responsavel;



CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45), 
fkResponsavel INT UNIQUE, 
CONSTRAINT fkEmpresaResponsavel
	foreign key (fkResponsavel) 
		references responsavel (idResponsavel)
        );
        
INSERT INTO empresa(nome, fkResponsavel) VALUES
('Accenture', 5001),
('Minsait', 5000),
('Stefanini', 5002);

SELECT * FROM empresa;


-- Junçaõ em duas tabelas
-- inner join
-- join

-- EXIBIR as empresas e seus respectivos responsaveis

SELECT * FROM empresa JOIN responsavel
	ON idResponsavel = fkResponsavel;
    
SELECT empresa.nome AS NomeEmpresa,
	responsavel.nome AS NomeResponsavel
    FROM empresa JOIN responsavel
    ON idResponsavel = fkResponsavel;
    
SELECT e.nome AS 'Empresa inha',
r.nome AS Responsa
FROM empresa AS e
JOIN responsavel AS r
ON idResponsavel = fkResponsavel;
