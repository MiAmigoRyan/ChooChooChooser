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
<div class='container train-search-result'>
	<h1 class='text-center'>Search Results</h1>
	<table class="table table-striped table-hover table-hover-light table-bordered">
		<thead>
			<tr>

				<th>Name</th>
				<th class='engine-th'>Engine</th>
				<th>Rating</th>
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
					<td>
						<ul>
							<c:forEach var="engine" items="${train.engines }">
								<li>${engine.type}</li>
							</c:forEach>
						</ul>
					</td>
					<td>
					
					<c:choose>

						<c:when test='${Double.isNaN(train.averageRating) }'>
							<p>not rated</p>
						</c:when>
						<c:when test="${train.averageRating >= 3.0}">
							<p>&#11088;&#11088;&#11088;</p>
						</c:when>
						<c:when test="${train.averageRating >= 2.0}">
							<p>&#11088;&#11088;</p>
						</c:when>
						<c:when test="${train.averageRating >= 1.0}">
							<p>&#11088;</p>
						</c:when>
						<c:otherwise>
							<p>not rated</p>
						</c:otherwise>
							
					</c:choose>
						
					</td>
					
					<c:if test="${loggedInUser.role == 'ADMIN'}">
						<td>
							<form action="removeTrain.do" method='GET'>
								<button class='btn btn-danger'>Delete Train</button>
								<input type='hidden' name='trainId' value="${train.id}"/>
							</form>
						</td>
						<td><%@ include file='UpdateTrain.jsp'%></td>
					</c:if> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	
</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>