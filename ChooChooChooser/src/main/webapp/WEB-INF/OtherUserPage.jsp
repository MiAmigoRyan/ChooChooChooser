<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Train Ride User</title>
	<jsp:include page="BootstrapHead.jsp"></jsp:include>
	<link rel="style" type="text/css" href="css/style.css">
</head>
<body class="dark-mode">
<%@ include file="nav.jsp"%>
<div class="container user-page">
	<c:choose>
	
		<c:when test="${! empty user}">
			<div class='row'>
					
				<div class='row-sm-auto text-center'>
					<h1>User Profile & Lists</h1>
					<hr>
				</div>
					
				<div class='col'>
					<c:choose>
						<c:when test="${not empty user.profilePhoto}">
							<img id='userPhoto' src="${user.profilePhoto}"
								alt="${user.firstName} ${user.lastName}'s profile photo">
						</c:when>
						<c:otherwise>
							User profile photo not available at this time.
						</c:otherwise>
					</c:choose>
				
					<h2>${user.firstName} ${user.lastName}  |  ${user.role}</h2>
					<blockquote id='user-description'class="text-center">
						${user.description}
					</blockquote>
				</div>
				
				<div class='col-8'>
					<div class='row'>
						<span> <h3> Trains I've Ridden: </h3></span>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Remove</th>
									<th colspan="3">Ride Photos</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ride" items="${user.rides}">
									<c:if test="${ride.enabled }">
										<tr>
											<td>${ride.train.name}</td>
											<td><c:forEach var="photo" items="${ride.photos}">
												<td><img id='ridePhoto' src="${photo.photo}" width="50%"/></td>
											</c:forEach>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<br><hr><br>
					<div class='row'>
						<span><h3>Trains I Want to Ride: </h3></span>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
								<th>Name</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="train" items="${user.wishList}">
									<tr>
									<td>${train.name}</td>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:when>
		
		<c:otherwise>
			<p>NOT LOGGED IN</p>
		</c:otherwise>
		
	</c:choose>
</div>
</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>