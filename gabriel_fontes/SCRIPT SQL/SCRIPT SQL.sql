CREATE DATABASE AviSafeSensors;
USE AviSafeSensors;
DROP DATABASE AviSafeSensors;
CREATE TABLE Sensor (
	dtTemperatura CURRENT_TIMESTAMP,
	tempAtual
    
);
CREATE TABLE historicoAviso(
	idAviso
    dtAviso
    tempRegistrada
    tempo
    
);

CREATE TABLE Empresa(
nome
cnpj
responsavel
endereco

)
CREATE TABLE Usuario(
username
senha
permissao
)

CREATE TABLE Permissao(

)

CREATE TABLE Orcamento(
	dtOrcamento
    valorMensal
    valorInstalacao
    valorLogistica
    valorManutencao
    valorSuporte
    qtdSensores
    mQuadradosTotais
)

CREATE TABLE Instalacao(
	dtInstalacao
    valorInstalacao
    
)
CREATE TABLE Manutencao(
	dtManutencao
    valorManutencao
    isAvulsa
	motivo
)
CREATE TABLE Pagamento(
dtPagamento
valorPagamento
Pagante

)

CREATE TABLE Plano(
tipoPLano
tipoSensor
valorPlano
)

CREATE TABLE Granja(
idGranja
codGranja
nome
responsavel
)

CREATE TABLE Setor(
idSetor
codSetor
tipoAve
limiteLotacao
tempIdeal
isContaminado
responsavel
)

CREATE TABLE Ave(
nome
tipo
qtd
valor
)


