<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav>
	<ul>


		<c:choose>
			<c:when test="${! empty sessionScope.loggedInUser }">
				<li><a href="home.do">Home</a></li>
				<li><a href="logout.do">logout</a></li>
			</c:when>

			<c:otherwise>
				<li><a href="home.do">Home</a></li>
				<form action="login.do" method="POST">
					<div class='col-5'>
						<span class='input-group-text'>Username: </span> <input
							class='form-control' type='text' name='username' />
					</div>
					<div class='col-5'>
						<span class='input-group-text'>Password: </span> <input
							class='form-control' type='password' name='password' />
					</div>
					<input type='submit' class='btn btn-success' name='login'>
				</form>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>