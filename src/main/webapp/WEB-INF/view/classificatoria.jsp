<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href='<c:url value="./resources/css/styles.css"/>'>
<title>Classificatorias</title>
</head>
<body>

	<div class="menu-superior">
		<a href="tabelaGeral">Tabela Geral</a> <a href="classificacao">Grupos</a>
		<a href="jogos">Jogos</a> <a href="classificatoria">Classificatorias</a>
	</div>
		<form action="classificatoria" method="get" class="form">
			<tbody>
					<div class="Times">
						<div class="Times-esp"><c:out value="${lista[0].nomeTime}"></c:out></div>
						<div class="Times-esp-int"><c:out value="${lista[4].nomeTime}"></c:out></div>
					</div>
					<div class="Times">
						<div class="Times-esp"><c:out value="${lista[1].nomeTime}"></c:out></div>
						<div class="Times-esp-int"><c:out value="${lista[5].nomeTime}"></c:out></div>
					</div>
					</br>
					</br>
					</br>
					<div class="Times">
						<div class="Times-esp"><c:out value="${lista[2].nomeTime}"></c:out></div>
						<div class="Times-esp-int"><c:out value="${lista[6].nomeTime}"></c:out></div>
					</div>
					<div class="Times">
						<div class="Times-esp"><c:out value="${lista[3].nomeTime}"></c:out></div>
						<div class="Times-esp-int"><c:out value="${lista[7].nomeTime}"></c:out></div>
					</div>
			</tbody>
		</form>
</body>
</html>