<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME PAGE</title>
<jsp:include page="BootstrapHead.jsp"></jsp:include>

<link rel="style" type="text/css" href="css/style.css">

</head>
<body class="dark-mode">
<%@ include file="nav.jsp"%>


	<button type="button" class="btn btn-outline-success"
		data-bs-toggle='modal' data-bs-target='#exampleModal'>
		Create an account
		</button>


	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class='col-3 offset-2'>
						<h1>Create An Account</h1>
					</div>
					<form action="register.do" method="POST">
						<div class='row 3'>
							<div class='col-5 offset-1'>
								<span class='input-group-text'>First Name:</span> <input
									class='form-control' type="text" name="firstName" />
							</div>
							<div class='col-5'>
								<span class='input-group-text'>Last Name: </span> <input
									class='form-control' type='text' name='lastName' />
							</div>
							<div class='col-5 offset-1'>
								<span class='input-group-text'>Username: </span> <input
									class='form-control' type='text' name='username' />
							</div>
							<div class='col-5'>
								<span class='input-group-text'>Password: </span> <input
									class='form-control' type='password' name='password' />
							</div>
							<div class='col-5 offset-1'>
								<span class='input-group-text'>Upload A Profile Picture
									(URL): </span> <input class='form-control' type='text' name='profilePhoto' />
							</div>
							<div class='col-9 offset-1'>
								<span class='input-group-text'>About Me : </span>
								<textarea class='form-control' rows='4' name='description'></textarea>

								<input type='submit' class='btn btn-success' name='create account'>

							</div>
						</div>
						<input type='hidden' name='enabled' value='1'> <input
							type='hidden' name='role' value='User'>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>

<jsp:include page="BootstrapFoot.jsp"></jsp:include>

</html>