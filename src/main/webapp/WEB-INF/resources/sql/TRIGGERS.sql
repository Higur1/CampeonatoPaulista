USE CampeonatoPaulista2021

CREATE TRIGGER t_Times_Alteracao
ON Times
Instead Of UPDATE, INSERT, DELETE
AS
BEGIN
	PRINT 'A tabela Times não pode ser alterada'
END

CREATE TRIGGER t_Grupos_Alteracao
ON Grupos
Instead Of UPDATE, INSERT, DELETE
AS
BEGIN
	PRINT 'A tabela Grupos não pode ser alterada'
END



