<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All the trains</title>
	<jsp:include page="BootstrapHead.jsp"></jsp:include>
	<link rel="style" type="text/css" href="css/style.css">
</head>
<body class="dark-mode">
	<%@ include file="nav.jsp"%>

	<table class="table table-striped table-hover table-hover-light table-bordered">
		<thead>
			<tr>
				
				<th>Name</th>
				<th class='engine-th' colspan="2">Engine</th>
				<th>Rating<th>
				<c:if test="${loggedInUser.role == 'ADMIN'}">
				<th>Remove Train</th>
				<th>Update Train</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="train" items="${trainList}">
				<tr>
					<td><a href='searchById.do?id=${train.id}'>${train.name}</a></td>
					<c:forEach var="engine" items="${train.engines }">
					<td>${engine.type}</td>
					</c:forEach>
					
					<td>
					
					<c:choose>
					  
					  <c:when test="${trainRide.getAverageRating == 1.0}">
					    <p>&#11088;</p></c:when>    
					  <c:when test="${trainRide.getAverageRating == 2.0}">
					    <p>&#11088;&#11088;</p></c:when>
					  <c:when test="${trainRide.getAverageRating == 3.0}">
					    <p>&#11088;&#11088;&#11088;</p></c:when>
					  
					  <c:otherwise>
					    <p>not rated</p>
					  </c:otherwise>
					
					</c:choose>
					</td>
					
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