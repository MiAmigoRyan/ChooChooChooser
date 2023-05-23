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
				<th>Name</th>
				<th>Engine Type</th>
				<c:if test="${loggedInUser.role == 'ADMIN'}">
				<th>Remove Train</th>
				<th>Update Train</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="train" items="${trains}">
				<tr>
					<td><a href='searchById.do?id=${train.id}'>${train.name}</a></td>
					<td>${train.engine.type}</td>
					<c:if test="${loggedInUser.role == 'ADMIN'}">
						<td>
							<form action="removeTrain.do" method='GET'>
								<input type='hidden' name='trainId' value="${train.id}"/>
								<input type='submit' value='Delete Train' />
							</form>
						</td>
						<td><%@ include file='UpdateTrain.jsp' %></td>
					</c:if> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>