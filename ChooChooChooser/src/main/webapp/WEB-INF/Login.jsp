<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<jsp:include page="BootstrapHead.jsp"></jsp:include>
	<link rel="style" type="text/css" href="css/style.css">
</head>
<body class="dark-mode">
<%@ include file="nav.jsp"%>
<form action="login.do" method="POST">
								<div class='col-5'>
									<span class='input-group-text'>Username: </span> <input
										class='form-control' type='text' name='username' />
								</div>
								<div class='col-5'>
									<span class='input-group-text'>Password: </span> <input
										class='form-control' type='password' name='password' /> <input
										type='submit' class='btn btn-success' name='login'>
								</div>
							</form>
</body>