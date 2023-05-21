<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<jsp:include page="BootstrapHead.jsp"></jsp:include>

<link rel="style" type="text/css" href="css/style.css">

</head>
<body class="dark-mode">
<%@ include file="nav.jsp"%>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Engine Type</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="train" items="${trains}">
				<tr>
					<td>${train.id}</td>
					<td>${train.name}</td>
					<td>${train.engine.type}</td>
					<td><a href='${train.website}'><button class='btn btn-success'>This Trains Website!</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>

<jsp:include page="BootstrapFoot.jsp"></jsp:include>

</html>