<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="BootstrapHead.jsp"></jsp:include>
</head>
<body>
<%@ include file="nav.jsp"%>
<div class="container">
		<h1>Lookup a train</h1>		
		<form action="#" method="GET">
			<div class="row">
				<div class="col-sm-8">
					Search : <input class="form-control" type="text" name="keyword" />
				</div>
				<input class="col btn btn-primary" type="submit" value="Search" />
			</div>
		</form>
		<c:choose>
			<c:when test="${! empty loggedInUser}">
				<div class="col-2"><img src="${loggedInUser.profilePhoto}" alt="No Photo"></div>
				<div class="col-6 offset-2">
				<h2 class='fullName'><c:out value="${loggedInUser.firstName} "></c:out>
				<c:out value="${loggedInUser.lastName}"></c:out></h2></div>
				<div class="col-12"><blockquote><c:out value="${loggedInUser.description}"/></blockquote></div>
				<span>I Want to Ride: </span>
				<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="train" items="${loggedInUser.wishList}">
					<tr>
						<td>${train.id }</td>
						<td>${train.name}</td>
				</c:forEach>
				</table>						
			</c:when>
			<c:otherwise>
				<p>NOT LOGGED IN</p>
			</c:otherwise>
		</c:choose>
	</div>

</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>