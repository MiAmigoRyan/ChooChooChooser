<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Train Details</title>
	<jsp:include page="BootstrapHead.jsp"/>
	<link rel="style" type="text/css" href="css/style.css">
	
</head>
<body class="dark-mode">
<jsp:include page="nav.jsp"/>
<div class="container">
	<c:choose>
		<c:when test="${ not empty train }">
			<div class="row">
			
			
				<div class="col">
					<div class=row>
						<h1>${train.name}</h1><br>
						<h3>Engine Type: ${train.engine.type}</h3><br>
						<h3>Rail Gauge: ${train.railGauge.type}</h3><br>
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
					
					<br>
					<div class="row align-self-center">
						<div class="col-sm-auto">
							<form action="addToWishlist.do" method=POST>
								<button class='btn btn-success'>Add this train to your Wishlist</button>
								<input type="hidden" name="id" value="${train.id}"/>
							</form>
						</div>
						<div class="col-sm-auto">
							<%@include file= "AddTrainRide.jsp"%>
						</div>
					</div>
					<br>
					<div class=row>
						<c:choose>
							<c:when test="${not empty train.trainComments}">
								<h4>Comments from riders</h4>
								<c:forEach var="comment" items="${train.trainComments}">
									<blockquote>
										${comment.comment}
										<br>
										${comment.commentDate}
									</blockquote>
									<br><hr><br>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h3>This train doesn't have any comments yet.</h3><br>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				
				<div class="col-5">
					<div class="row">
						<c:choose>
							<c:when test="${not empty train.photo}">
								<img id="trainPhoto" src="${train.photo}"
									alt="Photo of ${train.name}"
									class="img-thumbnail"
									height="400"
									width="300"/>
							</c:when>
							<c:otherwise>
								Train photo not available at this time.
							</c:otherwise>
						</c:choose>
					</div>
					<br>
					<div class="row map-container">
						<iframe 
							src="https://www.google.com/maps?q='${train.name}'&z=13&output=embed" 
							width="400" 
							height="300" 
							frameborder="0" 
							style="border:0" 
							allowfullscreen>
						</iframe>
					</div>
					<br>
					<div class="row align-self-center">
						<a href='${train.website}'><button class='btn btn-success'>This Train's Website!</button></a>
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