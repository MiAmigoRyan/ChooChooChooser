<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Trains</title>
<jsp:include page="BootstrapHead.jsp"></jsp:include>
</head>
<body>
<%@ include file="nav.jsp"%>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="train" items="${trainList}">
				<tr>
					<td>${train.id}</td>
					<td>${train.name}</td>
					<td><a href='${train.website}'><button class='btn btn-success'>This Trains Website!</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>