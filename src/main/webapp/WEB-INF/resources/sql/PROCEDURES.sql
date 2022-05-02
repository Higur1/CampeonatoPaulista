	   /*PROCEDURES*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*PROCEDURE que cria os grupos*/
CREATE PROC sp_gerar_grupos
AS
	DECLARE @count INT, @letra CHAR(1),@query VARCHAR(MAX)
	
	DELETE Grupos
	SET @count = 1
	WHILE @count <= 4
	BEGIN
		SET @letra = 
			CASE 
				WHEN (@count = 1) THEN 'A'
				WHEN (@count = 2) THEN 'B'
				WHEN (@count = 3) THEN 'C'
				WHEN (@count = 4) THEN 'D'
			END
		SET @query = 'INSERT INTO Grupos (nomeGrupo,codigoTime)
						VALUES ('''+@letra+''', (SELECT TOP 1 codigoTime FROM Times WHERE codigoTime IN (2,9,13,16) and codigoTime NOT IN (SELECT codigoTime FROM Grupos)ORDER BY NEWID()))'
		EXEC(@query)
		SET @count = @count + 1
	END
	
	SET @count = 1
	WHILE @count <= 12
	BEGIN
		SET @letra = 
			CASE 
				WHEN (@count >= 1 and @count < 4) THEN 'A'
				WHEN (@count >= 4 and @count < 7) THEN 'B'
				WHEN (@count >= 7 and @count < 10) THEN 'C'
				WHEN (@count >= 10) THEN 'D'
			END
		SET @query = 'INSERT INTO Grupos (nomeGrupo,codigoTime)
			          VALUES('''+@letra+''', (SELECT TOP 1 codigoTime FROM Times WHERE codigoTime NOT IN (SELECT codigoTime FROM Grupos) ORDER BY NEWID()))'
		EXEC(@query)
		SET @count = @count + 1
	END
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE que gera a classificacao zerada*/
CREATE PROC sp_gerar_classificacao
AS
	DECLARE @count int
	SET @count = 1
	WHILE @count <= 16
	BEGIN
		INSERT INTO Classificacao(codigoTime, pontos, vitorias, empates, derrotas, golsPro, golsContra, saldoGols)
		VALUES((SELECT TOP 1 codigoTime FROM Grupos WHERE codigoTime NOT IN(SELECT TOP (@count) codigoTime From Classificacao)), 0,0,0,0,0,0,0)
		SET @count += 1
	END
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE auxiliar que gera os jogos para a sp_armaze_jogos*/
CREATE PROC sp_gerar_jogos(@nomeGrupoRival CHAR(1), @timeA INT, @cod INT)
AS
	DECLARE @jogos INT, @fora INT, @casa INT, @data DATE, @timeB INT
	SET @jogos = 0
	SET @casa = 1
	SET @fora = 1
	WHILE @jogos <= 3
	BEGIN
		SET @timeB = (SELECT TOP 1 codigoTime FROM Grupos WHERE (nomeGrupo = @nomeGrupoRival) and codigoTime NOT IN(SELECT TOP (@jogos) codigoTime FROM Grupos WHERE nomeGrupo = @nomeGrupoRival))
		IF @cod = 1 
		BEGIN
			IF @casa <= 2
			BEGIN
				INSERT INTO Jogos(codigoTimeA, codigoTimeB, golsTimeA,golsTimeB,estadio) 
				VALUES (@timeA, @timeB,-1,-1,(SELECT estadio FROM Times WHERE codigoTime = @timeA))
				SET @casa += 1
			END
			ELSE
				IF @fora <= 2
				BEGIN
					INSERT INTO Jogos (codigoTimeA, codigoTimeB, golsTimeA,golsTimeB,estadio) 
					VALUES(@timeB, @timeA,-1,-1,(SELECT estadio FROM Times WHERE codigoTime = @timeB))
					SET @fora +=1
				END
		END
		ELSE
			IF @cod = 2
			BEGIN
				IF @fora <= 2
				BEGIN
					INSERT INTO Jogos(codigoTimeA, codigoTimeB, golsTimeA,golsTimeB,estadio) 
					VALUES (@timeB, @timeA,-1,-1,(SELECT estadio FROM Times WHERE codigoTime = @timeB))
					SET @fora += 1
				END
				ELSE
					IF @casa <=2
					BEGIN
						INSERT INTO Jogos (codigoTimeA, codigoTimeB, golsTimeA,golsTimeB,estadio) 
						VALUES(@timeA, @timeB,-1,-1,(SELECT estadio FROM Times WHERE codigoTime = @timeA))
						SET @casa +=1
					END
			END
		SET @jogos +=1
	END
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para armazenar na tabela Jogos os jogos gerados*/
CREATE PROC sp_armazena_jogos
AS
	DECLARE @totalDeJogosEmGrupo INT, @nomeGrupo CHAR(1), @nomeGrupoRival VARCHAR(1), @timeA INT, @timeB INT, @JogosTimeA INT, @cod INT

	DELETE Jogos
	DBCC CHECKIDENT (Jogos, RESEED, 0);
	SET @totalDeJogosEmGrupo = 0
	
	/*Escolhe o nome do grupo baseado no contador @totalDejogosEmGrupo
			A X B // C X D // A X C // B X D // A X D // B X C */
	WHILE @totalDeJogosEmGrupo <= 5
	BEGIN	
		SET @nomeGrupo = 
		CASE 
			WHEN @totalDeJogosEmGrupo = 0 THEN 'A'
			WHEN @totalDeJogosEmGrupo = 1 THEN 'C'
			WHEN @totalDeJogosEmGrupo = 2 THEN 'A'
			WHEN @totalDeJogosEmGrupo = 3 THEN 'B'
			WHEN @totalDeJogosEmGrupo = 4 THEN 'A'
			WHEN @totalDeJogosEmGrupo = 5 THEN 'B'
		END
		SET @nomeGrupoRival =
		CASE
			WHEN @totalDeJogosEmGrupo = 0 THEN 'B'
			WHEN @totalDeJogosEmGrupo = 1 THEN 'D'
			WHEN @totalDeJogosEmGrupo = 2 THEN 'C'
			WHEN @totalDeJogosEmGrupo = 3 THEN 'D'
			WHEN @totalDeJogosEmGrupo = 4 THEN 'D'
			WHEN @totalDeJogosEmGrupo = 5 THEN 'C'
		END	
		/*-------------------------------------------------------------------------*/
		/*Escolhe um time do primeiro grupo e gera 2 jogos em casa e 2 jogos fora*/
		SET @JogosTimeA = 0
		WHILE @JogosTimeA <= 3
		BEGIN
			SET @timeA = (SELECT TOP 1 codigoTime From Grupos WHERE(nomeGrupo = @nomeGrupo) and codigoTime NOT IN(SELECT TOP (@JogosTimeA)codigoTime FROM Grupos WHERE nomeGrupo = @nomeGrupo))
			SET @cod =
				CASE
					WHEN @jogosTimeA % 2 = 0 THEN 1
					WHEN @JogosTimeA % 2 = 1 THEN 2
				END
			EXEC sp_gerar_jogos @nomeGrupoRival, @timeA, @cod
			SET @JogosTimeA += 1
		END
		SET @totalDeJogosEmGrupo += 1
	END
	EXEC sp_inserir_data_jogo
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para inserir a data dos jogos*/
CREATE PROC sp_inserir_data_jogo 
AS
	DECLARE @data DATE, @jogos INT
	SET @jogos = 1
	WHILE @jogos <= 96
	BEGIN
		SET @data =
			CASE
				WHEN @jogos IN ( 1,  6, 11, 16, 17, 22, 27, 32) THEN '2021-02-28' /*Rodada 1*/
				WHEN @jogos IN ( 2,  7, 12, 13, 18, 23, 28, 29) THEN '2021-03-03'  /*Rodada 2*/ 
				WHEN @jogos IN ( 3,  8,  9, 14, 19, 24, 25, 30) THEN '2021-03-07'  /*Rodada 3*/ 
				WHEN @jogos IN ( 4,  5, 10, 15, 20, 21, 26, 31) THEN '2021-03-10' /*Rodada 4*/ 
				WHEN @jogos IN (33, 38, 43, 48, 49, 54, 59, 64) THEN '2021-03-14' /*Rodada 5*/ 
				WHEN @jogos IN (34, 39, 44, 45, 50, 55, 60, 61) THEN '2021-03-17' /*Rodada 6*/ 
				WHEN @jogos IN (35, 40, 41, 46, 51, 56, 57, 62) THEN '2021-03-21' /*Rodada 7*/ 
				WHEN @jogos IN (36, 37, 42, 47, 52, 53, 58, 63) THEN '2021-03-24' /*Rodada 8*/ 
				WHEN @jogos IN (65, 70, 75, 80, 81, 86, 91, 96) THEN '2021-03-28' /*Rodada 9*/ 
				WHEN @jogos IN (66, 71, 76, 77, 82, 87, 92, 93) THEN '2021-03-31' /*Rodada 10*/ 
				WHEN @jogos IN (67, 72, 73, 78, 83, 88, 89, 94) THEN '2021-04-04' /*Rodada 11*/ 
				WHEN @jogos IN (68, 69, 74, 79, 84, 85, 90, 95) THEN '2021-04-07' /*Rodada 12*/ 
			END
			UPDATE Jogos
				SET dataJogo = @data
				WHERE id = @jogos
			
			SET @jogos += 1
	END  
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para fazer o insert dos gols*/
CREATE PROC sp_atualizar_jogos(@id int, @gols int, @cod int)
AS
	IF(@cod = 1)
	BEGIN
		UPDATE Jogos	
		SET golsTimeA = @gols
		WHERE id = @id
	END
	IF(@cod = 2)
	BEGIN
		UPDATE Jogos
		SET golsTimeB = @gols
		WHERE id = @id 
	END
	EXEC sp_gerar_pontuacao @id

	EXEC sp_atualizar_jogos 7, 4, 2
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/	
/*PROCEDURE para salvar a ultima data selecionada*/
CREATE PROC sp_data_salva(@data Date, @cod int)
AS
	DECLARE @dataInici Date,
			@dataFim Date
	SET @dataInici = '2021-02-28'
	SET @dataFim = '2021-04-07'
	IF (@data >= @dataInici and @data <= @dataFim)
	BEGIN
		IF (@cod = 1)	
		BEGIN
			EXEC sp_inserir_data @data
		END
		IF (@cod = 2)
		BEGIN
			SET @data = DATEADD(Day, 7, @data)
			IF @data <= @dataFim
			BEGIN
				EXEC sp_inserir_data @data
			END
			EXEC sp_inserir_data @data
		END
		IF (@cod = 3)
		BEGIN
			SET @data = DATEADD(Day,-7, @data)
			IF @data >= @dataInici
			BEGIN
				EXEC sp_inserir_data @data
			END
		END
	END

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE auxiliar da sp_data_salva*/
CREATE PROCEDURE sp_inserir_data(@data Date)
AS
	DELETE Datas
	INSERT INTO Datas VALUES(@data)

/*PROCEDURE que gera a pontuacao para a classificacao com base nos jogos*/
CREATE PROCEDURE sp_gerar_pontuacao(@id int)
AS
	DECLARE @golsA int,
			@golsB int
	SET @golsA = (SELECT golsTimeA FROM Jogos WHERE id = @id)
	SET @golsB = (SELECT golsTimeB FROM Jogos WHERE id = @id)
	IF(@golsA > -1 and @golsB > -1)
	BEGIN
		IF(@golsA > @golsB)
		BEGIN
			UPDATE Classificacao
			SET pontos +=  3,
				vitorias += 1,
				golsPro += @golsA,
				golsContra += @golsB,
				saldoGols += (@golsA - @golsB)
			WHERE codigoTime = (SELECT codigoTimeA FROM Jogos WHERE id = @id)
			UPDATE Classificacao
			SET  derrotas += 1,
				golsPro += @golsB,
				golsContra += @golsA,
				saldoGols += (@golsB - @golsA)
			WHERE codigoTime = (SELECT codigoTimeB FROM Jogos WHERE id = @id)
		END
		IF(@golsA < @golsB)
		BEGIN
			UPDATE Classificacao
			SET pontos +=  3,
				vitorias += 1,
				golsPro += @golsB,
				golsContra += @golsA,
				saldoGols += (@golsB - @golsA)
			WHERE codigoTime = (SELECT codigoTimeB FROM Jogos WHERE id = @id)
			UPDATE Classificacao
			SET  derrotas += 1,
				golsPro += @golsA,
				golsContra += @golsB,
				saldoGols += (@golsA - @golsB)
			WHERE codigoTime = (SELECT codigoTimeA FROM Jogos WHERE id = @id)
		END
		IF(@golsA = @golsB)
		BEGIN
				UPDATE Classificacao
			SET pontos +=  1,
				empates += 1,
				golsPro += @golsA,
				golsContra += @golsB,
				saldoGols += (@golsA - @golsB)
			WHERE codigoTime = (SELECT codigoTimeA FROM Jogos WHERE id = @id)
			UPDATE Classificacao
			SET pontos += 1, 
				empates += 1,
				golsPro += @golsB,
				golsContra += @golsA,
				saldoGols += (@golsA - @golsB)
			WHERE codigoTime = (SELECT codigoTimeB FROM Jogos WHERE id = @id)
		END
	END

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE para armazenar os clubes das quartas*/
CREATE PROCEDURE sp_guardar_quartas (@nomeTime VARCHAR(19), @grupo VARCHAR(1))
AS
	INSERT INTO Classificatoria VALUES(@nomeTime, @grupo)
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*PROCEDURE que seleciona as quartas de final*/
CREATE FUNCTION f_quartas_de_final()
RETURNS @quartas TABLE(
	codigoTime INT,
	nomeGrupo VARCHAR(1)
) 
AS BEGIN

	DECLARE @count int, @grupo CHAR(1), @nomeTime VARCHAR(19), @aux int
	SET @count = 1
	WHILE @count <= 4 
	BEGIN
		SET @aux = 0
		SET @grupo =
			CASE
				WHEN @count = 1 THEN 'A'
				WHEN @count = 2 THEN 'B'
				WHEN @count = 3 THEN 'C'
				WHEN @count = 4 THEN 'D'
			END
		WHILE @aux <= 1
		BEGIN
			SET @nomeTime = 
				(SELECT TOP 1 cl.codigoTime from Classificacao cl INNER JOIN Grupos gp 
				ON cl.codigoTime = gp.codigoTime
				WHERE gp.nomeGrupo = @grupo and cl.codigoTime NOT IN(SELECT codigoTime FROM @quartas)
				ORDER BY cl.pontos DESC)
			INSERT INTO @quartas
			VALUES(@nomeTime, @grupo)
			SET @aux += 1
		END
		SET @count += 1
	END
	RETURN
END

/*PROCEDURE gerar novo campeonato*/
CREATE PROCEDURE sp_gerar_novo_campeonato
AS
	DELETE Datas
	DELETE Jogos
	DELETE Grupos
	DELETE Classificacao
	EXEC sp_data_salva '2021-02-28', 1
	EXEC sp_gerar_grupos
	EXEC sp_gerar_classificacao
	EXEC sp_armazena_jogos
