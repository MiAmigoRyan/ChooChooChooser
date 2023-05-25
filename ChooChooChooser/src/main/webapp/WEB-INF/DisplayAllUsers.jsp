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

	<table
		class="table table-striped table-hover table-hover-light table-bordered">
		<thead>
			<tr>
				<th class="userList-photo">Photo</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Password</th>
				<th>Enabled</th>
				<th>Remove User</th>
				<th>Update User</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td><img src='${user.profilePhoto }'></td>
					<td>${user.username}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.password}</td>
					<td><c:choose>
							<c:when test="${user.enabled == true }">
								<p>enabled</p></c:when>
							<c:when test="${user.enabled == false }">
								<p>disabled</p></c:when>
					</c:choose></td>
					<td>
						<form action="disableUser.do" method='GET'>
							<button class='btn btn-danger'>Disable User</button>
							<input type='hidden' name='userId' value="${user.id}"/>
						</form>
					</td>
					<td><%@ include file='UpdateUser.jsp'%></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>