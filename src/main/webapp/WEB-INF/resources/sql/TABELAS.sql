
					/*CRIACAO DO BANCO DE DADOS E TABELAS*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE DATABASE CampeonatoPaulista2021
GO
USE CampeonatoPaulista2021
GO
CREATE TABLE Times(
	codigoTime INT IDENTITY,
	nomeTime VARCHAR(19) NOT NULL,
	cidade VARCHAR(18) NOT NULL,
	estadio VARCHAR(25) NOT NULL

	CONSTRAINT pk_codigoTime PRIMARY KEY(codigoTime)
)
GO
CREATE TABLE Grupos(
	nomeGrupo CHAR(1) NOT NULL,
	codigoTime INT NOT NULL,

	CONSTRAINT fk_codigoTime_grupos FOREIGN KEY(codigoTime) REFERENCES Times(codigoTime),
	CONSTRAINT pk_nomeGrupo_codigoTime_grupos PRIMARY KEY(codigoTime)
)
GO
CREATE TABLE Jogos(
	id INT NOT NULL IDENTITY,
	codigoTimeA INT NOT NULL,
	codigoTimeB INT NOT NULL,
	golsTimeA INT,
	golsTimeB INT,
	dataJogo DATE,
	estadio VARCHAR(25) NOT NULL

	CONSTRAINT pk_id PRIMARY KEY(id)
)
GO
CREATE TABLE Datas(
	datas Date NOT NULL
	
	CONSTRAINT pk_data PRIMARY KEY(datas) 
)
GO
CREATE TABLE Classificacao(
	codigoTime INT NOT NULL,
	pontos INT NOT NULL,
	vitorias INT NOT NULL,
	empates INT NOT NULL,
	derrotas INT NOT NULL,
	golsPro INT,
	golsContra INT,
	saldoGols INT NOT NULL

	CONSTRAINT fk_codigoTime_classificacao FOREIGN KEY(codigoTime) REFERENCES Times(codigoTime),
	CONSTRAINT pk_nomeGrupo_codigoTime_classificacao PRIMARY KEY(codigoTime)
)
CREATE TABLE Classificatoria(
	nomeGrupo VARCHAR(1),
	nomeTime VARCHAR(19)

	CONSTRAINT pk_nomeGrupo_nomeTime_classificatoria PRIMARY KEY(nomeGrupo, nomeTime)
)
				/*INSERT DOS TIMES*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO Times (nomeTime, cidade, estadio) VALUES
('Botafogo-SP', 'Ribeir�o Preto', 'Santa Cruz'),
('Corinthians', 'S�o Paulo', 'Neo Qu�mica Arena'),
('Ferrovi�ria', 'Araraquara', 'Fonte Luminosa'),
('Guarani', 'Campinas', 'Brinco de Ouro'),
('Inter de Limeira', 'Limeira', 'Limeir�o'),
('Ituano', 'Itu', 'Novelli J�nior'),
('Mirassol', 'Mirassol', 'Jos� Maria de Campos Maia'),
('Novorizontino', 'Novo Horizonte', 'Jorge Ismael de Biasi'),
('Palmeiras', 'S�o Paulo', 'Allianz Parque'),
('Ponte Preta', 'Campinas', 'Mois�s Lucarelli'),
('Red Bull Bragantino', 'Bragan�a Paulista', 'Nabi Abi Chedid'),
('Santo Andr�', 'Santo Andr�', 'Bruno Jos� Daniel'),
('Santos', 'Santos', 'Vila Belmiro'),
('S�o Bento', 'Sorocaba', 'Walter Ribeiro'),
('S�o Caetano', 'S�o Caetano do Sul', 'Anacletto Campanella'),
('S�o Paulo', 'S�o Paulo', 'Morumbi')



			
				
					
				
