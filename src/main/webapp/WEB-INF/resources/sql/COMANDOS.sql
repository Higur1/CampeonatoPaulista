/*COMANDOS*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	/*Comando para gerar os grupos*/
	EXEC sp_gerar_grupos
	/*Comando para gerar classificacao*/
	EXEC sp_gerar_classificacao
	/*Comando para gerar os jogos*/
	EXEC sp_armazena_jogos
	/*Comando para atualizar os jogos com os gols*/
	EXEC sp_atualizar_jogos
	
	/*Comando para selecionar tabela geral*/
	EXEC sp_gerar_tabela_geral
	/*Comando para mostrar os jogos*/
	EXEC sp_mostrar_jogos
	/*Comando para selecionar jogos por data*/
	EXEC  sp_selecionar_por_data '2021-03-28'
	/*Comando para visualizar os times das quartas*/
	EXEC sp_gerar_quartas

	/*Exclui e cria um novo campeonato*/
	EXEC sp_gerar_novo_campeonato
	
	