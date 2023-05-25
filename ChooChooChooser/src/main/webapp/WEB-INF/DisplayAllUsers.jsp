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
<div class='container display-all-users'>
	<h1 class='text-center'>Users Currently in our Community</h1>
	<table
		class="table table-striped table-hover table-hover-light table-bordered">
		<thead>
			<tr>
				<th>Photo</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Password</th>
				<th>Access</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
				<c:if test= "${user.role != 'ADMIN'}">
				<tr>
					<td><img id="userList-photo" src='${user.profilePhoto }'></td> 
					<td>${user.username}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.password}</td>
					<td><c:choose>
							<c:when test="${user.enabled == true }">
								<form action="userEnableToggle.do" method='GET'>
								<button class='btn btn-danger'>Disable User</button>
								<input type='hidden' name='userId' value="${user.id}"/>
								</form>
								</c:when>
							<c:when test="${user.enabled == false }">
									<form action="userEnableToggle.do" method='GET'>
									<button class='btn btn-success'>Enable User</button>
									<input type='hidden' name='userId' value="${user.id}"/>
								</form>
							</c:when>
					</c:choose></td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>