<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Train Details</title>
	<jsp:include page="BootstrapHead.jsp"/>
</head>
<body class="dark-mode">
<jsp:include page="nav.jsp"/>
<div class="container">
	<c:choose>
		<c:when test="${ not empty train }">
			<div class="row">
			
			
				<div class="col-8 align-self-center align-items-center">
					<div class=row>
						<h1>${train.name}</h1><br>
						<h3>Engine Type: ${train.engine}  |  Rail Gauge: ${train.railGauge}</h3><br>
						<c:choose>
							<c:when test="${train.yearRound = true}">
								<h3>This train runs year round!</h3><br>
							</c:when>
							<c:otherwise>
								<h3>This train does not run year round.</h3><br>
							</c:otherwise>
						</c:choose>
						<blockquote>${train.description}</blockquote>
					</div>
					<div class=row>
						<div class="col map-container">
							<iframe 
								src="https://www.google.com/maps?q='${train.name} ${train.route.startStation.name}'&z=10&output=embed" 
								width="50%" 
								height="50%" 
								frameborder="0" 
								style="border:0" 
								allowfullscreen>
							</iframe>
						</div>
						<div class="col">
							<c:choose>
								<c:when test="${not empty train.trainComments}">
									<c:forEach var="comment" items="train.trainComments">
										<h4>${comment.content}</h4>
										<h4>${comment.commentDate}</h4>
										<br><hr><br>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h3>This train doesn't have any comments yet.</h3><br>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				
				<div class="col-4 align-self-center align-items-center">
					<div class="row">
						<c:choose>
							<c:when test="${not empty train.photo}">
								<img id="trainPhoto" src="${train.photo}"
									alt="Photo of ${train.name}"/>
							</c:when>
							<c:otherwise>
								Train photo not available at this time.
							</c:otherwise>
						</c:choose>
					</div>
					<br>
					<div class="row">
						<a href='${train.website}'><button class='btn btn-success'>This Train's Website!</button></a>
					</div>
					<div class="row">
					<!-- TODO addToWishlist.do in Controller -->
						<!-- If not logged in user, pop up login or create account modal -->
						<form action="addToWishlist.do" method=POST>
							<input type="submit" value="Add this train to your Wishlist"/>
							<input type="hidden" name="id" value="${train.id}"/>
						</form>
					</div>
					<div class="row">
					<!-- TODO addToRides.do in Controller -->
						<!-- If not logged in user, pop up login or create account modal -->
						<form action="addToRides.do" method=POST>
							<input type="submit" value="Been on this train? Submit a review!"/>
							<input type="hidden" name="id" value="${train.id}"/>
						</form>
					</div>
				</div>
				
				
			</div>
		</c:when>
		<c:otherwise>
			<h3>Train not found</h3>
		</c:otherwise>
	</c:choose>
</div>	
<jsp:include page="BootstrapFoot.jsp"/>
</body>
</html>