<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css"/>'>
<title>Grupos</title>
</head>
<body>

	<div class="menu-superior">
		<a href="tabelaGeral">Tabela Geral</a>
		<a href="classificacao">Grupos</a>
		<a href="jogos">Jogos</a>
		<a href="classificatoria">Classificatorias</a>
	</div>
	<div align="center" class="container">
		<form action="classificacao" method="post" class="form">
		
			<table class="table">
				<thead>
					<tr>
						<th>Posicao</th>
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
					<div class="nomeGrupo">GRUPO A</div>
					<c:forEach var="c" items="${classificacao}">
						<c:if test="${c.nomeGrupo == 'A'}">
							<tr class="nomeTime">
								<td><c:out value="${c.posicao}"/></td>
								<td><c:out value="${c.nomeTime}"/></td>
								<td><c:out value="${c.pontos}"/></td>
								<td><c:out value="${c.vitorias}"/></td>
								<td><c:out value="${c.empates}"/></td>
								<td><c:out value="${c.derrotas}"/></td>
								<td><c:out value="${c.golsPro}"/></td>
								<td><c:out value="${c.golsContra}"/></td>
								<td><c:out value="${c.saldoGols}"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			</br>
			<table class="table">
				<thead>
					<tr>
						<th>Posicao</th>
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
					<div class="nomeGrupo">GRUPO B</div>
					<c:forEach var="c" items="${classificacao}">
						<c:if test="${c.nomeGrupo == 'B'}">
							<tr class="nomeTime">
								<td><c:out value="${c.posicao}"/></td>
								<td><c:out value="${c.nomeTime}"/></td>
								<td><c:out value="${c.pontos}"/></td>
								<td><c:out value="${c.vitorias}"/></td>
								<td><c:out value="${c.empates}"/></td>
								<td><c:out value="${c.derrotas}"/></td>
								<td><c:out value="${c.golsPro}"/></td>
								<td><c:out value="${c.golsContra}"/></td>
								<td><c:out value="${c.saldoGols}"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			</br>
			<table class="table">
				<thead>
					<tr>
						<th>Posicao</th>
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
					<div class="nomeGrupo">GRUPO C</div>
					<c:forEach var="c" items="${classificacao}">
						<c:if test="${c.nomeGrupo == 'C'}">
							<tr class="nomeTime">
								<td><c:out value="${c.posicao}"/></td>
								<td><c:out value="${c.nomeTime}"/></td>
								<td><c:out value="${c.pontos}"/></td>
								<td><c:out value="${c.vitorias}"/></td>
								<td><c:out value="${c.empates}"/></td>
								<td><c:out value="${c.derrotas}"/></td>
								<td><c:out value="${c.golsPro}"/></td>
								<td><c:out value="${c.golsContra}"/></td>
								<td><c:out value="${c.saldoGols}"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			</br>
			<table class="table">
				<thead>
					<tr>
						<th>Posicao</th>
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
					<div class="nomeGrupo">GRUPO D</div>
					<c:forEach var="c" items="${classificacao}">
						<c:if test="${c.nomeGrupo == 'D'}">
							<tr class="nomeTime">
								<td><c:out value="${c.posicao}"/></td>
								<td><c:out value="${c.nomeTime}"/></td>
								<td><c:out value="${c.pontos}"/></td>
								<td><c:out value="${c.vitorias}"/></td>
								<td><c:out value="${c.empates}"/></td>
								<td><c:out value="${c.derrotas}"/></td>
								<td><c:out value="${c.golsPro}"/></td>
								<td><c:out value="${c.golsContra}"/></td>
								<td><c:out value="${c.saldoGols}"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
	</form>
	</div>
</body>
</html>