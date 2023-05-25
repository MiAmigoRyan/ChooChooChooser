<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Page</title>
	<jsp:include page="BootstrapHead.jsp"></jsp:include>
	<link rel="style" type="text/css" href="css/style.css">
</head>
<body class="dark-mode">

	<%@ include file="nav.jsp"%>
	<div class="container">
		<c:choose>
			<c:when test="${! empty loggedInUser}">
				<h1>TBD</h1>
				<form action="#" method="GET">
					<div class="row">
						<div class="col-sm-8">
							Search : <input class="form-control" type="text" name="keyword" />
						</div>
						<input class="col btn btn-primary" type="submit" value="Search" />
					</div>
				</form>


				<c:if test="${loggedInUser.role == 'ADMIN'}">
					<a href="displayAllUsers.do"><button type='button'
					class='btn btn-outline-success'>Users</button></a>
					<%@ include file="AddTrain.jsp"%>
				</c:if>
				<div class="col-2">
					<img src="${loggedInUser.profilePhoto}" alt="No Photo">
				</div>
					
				<div class='col'>
					<c:choose>
						<c:when test="${not empty loggedInUser.profilePhoto}">
							<img id='userPhoto' src="${loggedInUser.profilePhoto}"
								alt="${loggedInUser.firstName} ${loggedInUser.lastName}'s profile photo">
						</c:when>
						<c:otherwise>
							User profile photo not available at this time.
						</c:otherwise>
					</c:choose>
				
					<h2>${loggedInUser.firstName} ${loggedInUser.lastName}</h2>
					<blockquote id='user-description'class="text-center">
						${loggedInUser.description}
					</blockquote>
				</div>
				
				<div class='col-8'>
					<div class='row'>
						<span> <h3> Trains I've Ridden: </h3></span>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Remove</th>
									<th colspan="3">Ride Photos</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ride" items="${loggedInUser.rides}">
									<c:if test="${ride.enabled }">
										<tr>
											<td>${ride.id }</td>
											<td>${ride.train.name}</td>
											<td><a href='removeFromRiddenList.do?trainId=${ride.id }'><button class='btn btn-danger'>Remove this train</button></a></td>
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
								<th>ID</th>
								<th>Name</th>
								<th>Remove</th>
								<th>Move</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="train" items="${loggedInUser.wishList}">
									<tr>
									<td>${train.id }</td>
									<td>${train.name}</td>
									<td><a href='removeFromWishlist.do?id=${train.id }'><button class='btn btn-danger'>Remove this train</button></a></td>
									<td><%@ include file="TransferTrainRide.jsp"%></td>
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