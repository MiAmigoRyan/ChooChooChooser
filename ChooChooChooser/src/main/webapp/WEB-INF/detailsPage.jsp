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
<div class="container details-page">
	<c:choose>
		<c:when test="${ not empty train }">
			<div class="row">
			
				<div class='col'>
					<div class='row-sm-auto'>
						<h1>${train.name}</h1>
						<h3>Engines: 
							<c:forEach var='engine' items='${train.engines}'>
								${engine.type}, 
							</c:forEach>
						</h3>
						<h3>Rail Gauge: ${train.railGauge.type}</h3>
						<c:choose>
							<c:when test="${train.yearRound == true}">
								<h3>This train runs year round!</h3>
							</c:when>
							<c:otherwise>
								<h3>This train does not run year round.</h3>
							</c:otherwise>
						</c:choose>
						<blockquote id='details-page-train-description'>${train.description}</blockquote>
					</div>
					<h3>Routes:</h3>
					<c:forEach var='route' items='${train.routes}'>
						<div class='row'>
							<div class='col-6 align-self-center align-items-center'>
								<c:choose>
									<c:when test="${not empty route.photo}">
										<img id="routePhoto" src="${route.photo}"
											alt="Photo of ${route.description}"
											width=100%/>
									</c:when>
									<c:otherwise>
										Route photo not available at this time.
									</c:otherwise>
								</c:choose>
							</div>
							<div class='col-6 align-self-center align-items-center'>
								<h4>${route.description}</h4>
								<blockquote id='details-page-route-info'>
									Region: ${route.region.name}<br>
									Begins at ${route.startStation.name}<br>
									Ends at ${route.endStation.name}<br>
								</blockquote>
							</div>
						</div>
						<br>
					</c:forEach>
				</div>
				
				
				<div class="col-5">
					<div class="row-sm-auto">
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
					<div class="row-sm-auto map-container">
						<iframe 
							src="https://www.google.com/maps?q='${train.name}'&z=13&output=embed" 
							width=100%
							frameborder="0" 
							style="border:0" 
							allowfullscreen>
						</iframe>
					</div>
					<br>
					<div class="row-sm-auto website-button">
						<a href='${train.website}'><button class='btn btn-success'>This Train's Website!</button></a>
					</div>
					<br>
					<div class="row-sm-auto comment-button">
						<c:if test="${! empty sessionScope.loggedInUser}">
							<div class="row-sm-auto wishlist-button">
								<form action="addToWishlist.do" method=POST>
									<button class='btn btn-success'>Add this train to your Wishlist</button>
									<input type="hidden" name="id" value="${train.id}"/>
								</form>
							</div>
							<br>
							<div class="row-sm-auto ride-button">
								<%@include file= "AddTrainRide.jsp"%>
							</div>
							<br>
							<%@include file= "AddTrainComment.jsp"%>
						</c:if>
					</div>
					<div class=row-sm-auto>
						<c:choose>
							<c:when test="${not empty train.trainComments}">
								<h4>Comments from riders</h4>
								<c:forEach var="comment" items="${train.trainComments}">
									<c:if test="${comment.enabled }">
									<h5>${comment.user.firstName} ${comment.user.lastName}</h5>
										<blockquote id='details-page-individual-comment'>
											${comment.comment}
											<br>
											<c:if test="${! empty sessionScope.loggedInUser}">
												<%@include file= "ReplyTrainComment.jsp"%>
											</c:if>
											${comment.commentDate}
											<c:choose>
												<c:when test="${loggedInUser.id == comment.user.id}">
													<form action="removeComment.do" method='GET'>
													<button class='btn btn-danger'>Delete Comment</button>
													<input type='hidden' name='trainCommentId' value="${comment.id}"/>
													</form>
												</c:when>
										
											
												<c:when test="${loggedInUser.role == 'ADMIN'}">
													<form action="removeComment.do" method='GET'>
													<button class='btn btn-danger'>Delete Comment</button>
													<input type='hidden' name='trainCommentId' value="${comment.id}"/>
													</form>
												</c:when>
											</c:choose>	
										</blockquote>
										<hr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h3>This train doesn't have any comments yet.</h3>
							</c:otherwise>
						</c:choose>
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