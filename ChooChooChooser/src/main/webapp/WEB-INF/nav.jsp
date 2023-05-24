<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="style" type="text/css" href="css/style.css">

<nav>


<div class = "navbar">
	<ul class = 'nav-container'>
		<li class = 'nav-item'>
				<a href="home.do"><button type='button'
					class='btn btn-outline-success'>Home</button></a>
		</li>
		<li>
				<a href='displayAllTrains.do'><button type='button'
					class='btn btn-outline-success'>Trains</button></a>
		</li>
		<li>
				<form action="trainSearch.do" method="GET">
					<input type="text" name="keyword" type="search">
					<input type="submit" class='btn btn-outline-success' value="Search">
				</form>
		</li>
		
		<c:choose>
			<c:when test="${! empty sessionScope.loggedInUser }">
				<li>
					<c:if test="${loggedInUser.role == 'ADMIN'}">
							<%@ include file="AddTrain.jsp"%>
					</c:if>
				</li>
				<li>
					<a href="login.do"><button type='button' class='btn btn-outline-success'>Profile Page</button></a>
				</li>
				<li>
					<div class="alert alert-success" role="alert">
						<a href="logout.do"><button type='button' class='btn btn-outline-danger'>Logout</button>
							A simple success alert—check it out!</a>
					</div>
				</li>
			</c:when>

			<c:otherwise>
				<li><button type="button" class="btn btn-outline-success"
						data-bs-toggle='modal' data-bs-target='#CreateUserModal'>
						Create an account</button>

					<div class="modal fade" id="CreateUserModal" tabindex="-1"
						aria-labelledby="CreateUserModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="CreateUserModalLabel">Create
										An Account</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class='col-3 offset-2'></div>
									<form action="register.do" method="POST">
										<div class='row 3'>
											<div class='col-5 offset-1'>
												<span class='input-group-text'>First Name:</span>
												<input class='form-control' type="text" name="firstName" />
											</div>
											<div class='col-5'>
												<span class='input-group-text'>Last Name: </span>
												<input class='form-control' type='text' name='lastName' />
											</div>
											<div class='col-5 offset-1'>
												<span class='input-group-text'>Username: </span>
												<input class='form-control' type='text' name='username' />
											</div>
											<div class='col-5'>
												<span class='input-group-text'>Password: </span>
												<input class='form-control' type='password' name='password' />
											</div>
											<div class='col-5 offset-1'>
												<span class='input-group-text'>Upload A Profile Picture (URL): </span> 
												<input class='form-control' type='text' name='profilePhoto' />
											</div>
											<div class='col-9 offset-1'>
												<span class='input-group-text'>About Me : </span>
												<textarea class='form-control' rows='4' name='description'></textarea>
											</div>
										</div>
										<input type='submit' class='btn btn-success' name='create account'>
										<input type='hidden' name='enabled' value='1'>
										<input type='hidden' name='role' value='User'>
									</form>
								</div>
							</div>
						</div>
					</div>
				</li>

				<li><button type="button" class="btn btn-outline-success"
						data-bs-toggle='modal' data-bs-target='#LoginModal'>Login</button>


					<div class="modal fade" id="LoginModal" tabindex="-1"
						aria-labelledby="LoginModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="LoginModalLabel">Sign In</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="login.do" method="POST">
										<div class='col-5'>
											<span class='input-group-text'>Username: </span>
											<input class='form-control' type='text' name='username' />
										</div>
										<div class='col-5'>
											<span class='input-group-text'>Password: </span>
											<input class='form-control' type='password' name='password' />
									
										<input type='submit' class='btn btn-success' name='login'>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</li>
				
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</nav>