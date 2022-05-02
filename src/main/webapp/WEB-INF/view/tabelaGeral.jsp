<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css"/>'>
<title>Tabela Geral</title>
</head>
<body>
	<div class="menu-superior">
		<a href="tabelaGeral">Tabela Geral</a>
		<a href="classificacao">Grupos</a>
		<a href="jogos">Jogos</a>
		<a href="classificatoria">Classificatorias</a>
	</div>
	<div align="center" class="container">
		<form action="tabelaGeral" method="post">
			
			<table class= "tabelaGeral">
				<thead>
					<tr class="descricaoTabelaGeral">
						<th>Posição</th>
						<th>Time</th>
						<th>Pontos</th>
						<th>Vitorias</th>
						<th>Empates</th>
						<th>Derrotas</th>
						<th>Gols Pro</th>
						<th>Gols Contra</th>
						<th>Saldo de Gols</th>
					</tr>
			
				</thead>
				<tbody>
					<c:if test="${not empty times}">
						<c:forEach var="t" items="${times}">
							<tr class="descricaoTabelaGeral">
								<td><c:out value="${t.posicao}"/></td>
								<td><c:out value="${t.nome}"/></td>
								<td><c:out value="${t.pontos}"/></td>
								<td><c:out value="${t.vitorias}"/></td>
								<td><c:out value="${t.empates}"/></td>
								<td><c:out value="${t.derrotas}"/></td>
								<td><c:out value="${t.golsPro}"/></td>
								<td><c:out value="${t.golsContra}"/></td>
								<td><c:out value="${t.saldoGols}"/></td>
							</tr>
						
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<input type="submit" id="botao" name="botaoTabela" value="Gerar Tabela">
			<input type="submit" id="botao" name="botaoNovaTabela" value="Nova Tabela">
		</form>
	</div>
</body>
</html>