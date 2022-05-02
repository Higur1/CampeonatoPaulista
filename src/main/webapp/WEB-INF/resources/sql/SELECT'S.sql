	/*SELECTS*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*PROCEDURE que seleciona os grupos gerados*/
CREATE PROC sp_selecionar_grupos
AS
	SELECT tm.nomeTime, gp.nomeGrupo, cl.pontos, cl.vitorias, cl.empates, cl.derrotas,cl.golsPro, cl.golsContra, cl.saldoGols 
	FROM Grupos gp INNER JOIN Times tm
	ON gp.codigoTime = tm.codigoTime 
	INNER JOIN Classificacao cl 
	ON tm.codigoTime = cl.codigoTime
	ORDER BY cl.pontos DESC, cl.vitorias DESC, cl.saldoGols DESC
	

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*PROCEDURE que seleciona a tabela geral*/
CREATE PROC sp_gerar_tabela_geral
AS
	SELECT tm.nomeTime, cl.pontos, cl.vitorias, cl.empates, cl.derrotas, cl.golsPro, cl.golsContra, cl.saldoGols 
	FROM Classificacao cl 
	INNER JOIN Times tm
	ON cl.codigoTime = tm.codigoTime 
	ORDER BY cl.pontos DESC, cl.vitorias DESC, cl.saldoGols DESC
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*PROCEDURE para selecionar todos os jogos*/
CREATE PROC sp_mostrar_jogos
AS
	SELECT dataJogo,
	       (SELECT nomeTime FROM Times WHERE codigoTime = codigoTimeA) AS TimeA, 
		   golsTimeA,golsTimeB,
		   (SELECT nomeTime FROM Times WHERE codigoTime = codigoTimeB) AS TimeB, 
		   estadio
	FROM Jogos
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*//*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/	
	/*PROCEDURE para selecionar os jogos por data*/
CREATE PROC sp_selecionar_por_data(@data DATE)
AS
	SELECT id,dataJogo, 
	       (SELECT nomeTime FROM Times WHERE codigoTime = codigoTimeA) AS TimeA, 
		   golsTimeA,golsTimeB,
		   (SELECT nomeTime FROM Times WHERE codigoTime = codigoTimeB) AS TimeB, 
		   estadio
	FROM Jogos
	WHERE dataJogo = @data
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para selecionar a ultima data salva*/
CREATE PROC sp_buscar_data
AS
	SELECT datas FROM Datas 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para selecionar as quartas*/
CREATE PROC sp_gerar_quartas
AS
	SELECT tm.nomeTime, nomeGrupo 
	FROM f_quartas_de_final() f 
	INNER JOIN Times tm 
	ON f.codigoTime = tm.codigoTime
