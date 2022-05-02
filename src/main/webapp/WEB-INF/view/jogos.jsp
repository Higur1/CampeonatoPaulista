<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css"/>'>
<title>Jogos</title>
</head>
<body>
	<div class="menu-superior">
		<a href="tabelaGeral">Tabela Geral</a>
		<a href="classificacao">Grupos</a>
		<a href="jogos">Jogos</a>
		<a href="classificatoria">Classificatorias</a>
	</div>
	<div align="center" class="container">
		<form action="jogos" method="post">
			<table class= "tabelaGeral">
				<tr>
					<th><input type="date" id="botaoData" name="botaoData"></th>
					<th>Time A</th>
					<th>Gols Pro</th>
					<th>Gols Contra</th>
					<th>Time B</th>
					<th>Estadio</th>
				</tr>
			
				<c:forEach var="j" items="${jogos}">
				<tr> 
					<td><c:out value="${j.data}"/></td>
					<input type="hidden" value="${j.data}" name="data">
					<td><c:out value="${j.timeA}"/></td>
					<input type="hidden" value="${j.id}" name="id{}">
					<td><input type="number" id="golsA" name="golsA{}" value="${j.golsPro}" class="gols"></td>
					<td><input type="number" id="golsB" name="golsB{}" value="${j.golsContra}" class="gols"></td>
					<td><c:out value="${j.timeB}"/></td>
					<td><c:out value="${j.estadio}"/></td>
				</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>