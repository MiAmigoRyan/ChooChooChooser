<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About Us</title>
	<jsp:include page="BootstrapHead.jsp"></jsp:include>
	<link rel="style" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="dark-mode">
<%@ include file="nav.jsp"%>
  <div class="jumbotron text-center">
    <h1><em>MEET THE TEAM</em></h1>

	<div class="about-us-desc text-center">
    <p>We are a group of Java Bootcamp students who collaborated on this Scenic Trains Website. We leveraged Spring Tool Suite 4 (STS4) and embraced Agile methodologies to deliver a high-quality web application. Our project management was streamlined using Trello, allowing us to organize tasks and track progress. We developed a robust full stack website using Java, JSP, and MySQL, implementing CRUD functionalities for seamless interaction. HTTP sessions were utilized for efficient user session management. CSS styling was applied to create visually appealing interfaces. Our project was built on the principles of object-oriented programming (OOP), ensuring a scalable solution. We are excited to share our project with you. Reach out to us through the links below.
  	<br>Thanks for visiting!</p>
	</div>
  </div>

	<div class="container about-us-photo-container flex-fill">
		<div class="row d-flex">
			<div class="col-lg-4 mb-4 about-us-containers">
				<img class="about-us-photo"
					src="https://media.licdn.com/dms/image/D4E03AQHuba6RDaXOww/profile-displayphoto-shrink_800_800/0/1675184837788?e=1690416000&v=beta&t=JKarauhKcaUdfW8ztlVvDZJL6acHcXKDcOVQuCCvogs"
					alt="photo of samantha" class="img-fluid">
				<div class="name-line">
					<p>
						<span>Samantha Addingtion</span>
					<br>
					<h4>
						<a href="https://github.com/skaddington"><i class="fab fa-github"></i></a> 
						<a href="https://www.linkedin.com/in/samantha-addington-b91325b4/"><i class="fab fa-linkedin"></i></a>
						<a href="mailto:skaddington92@gmail.com"><i class="far fa-envelope"></i></a>
					</h4>	
					</p>
				</div>
					<a>Marine Corps Veteran, ATC trainee, and graduate of an
						intensive Java Full-Stack coding bootcamp, looking for a
						challenging software development or QA position.</a>
			</div>
			<div class="col-lg-4 mb-4 about-us-containers">
				<img class="about-us-photo"
					src="https://media.licdn.com/dms/image/D4D03AQGgZu5nnDxENw/profile-displayphoto-shrink_800_800/0/1684108028955?e=1690416000&v=beta&t=t-AM1WEtBovMSfARiobKdI5-mjP0TLzRocHsGGmz3LA"
					alt="Photo of Patrick" class="img-fluid">
				<div class="name-line">
					<p>
						<span>Patrick Hansen</span>
			
					<br>
					<h4>
						<a href="https://github.com/Hanyloick"><i class="fab fa-github"></i></a> 
						<a href="https://www.linkedin.com/in/patrick-hansen-3b7610272/"><i class="fab fa-linkedin"></i></a>
						<a href="mailto:skaddington92@gmail.com"><i class="far fa-envelope"></i></a>
					</h4>
					</p>
				</div>
				<a>Professional chef and graduate of a Java Full Stack
					development bootcamp, looking for a software development/QA
					position.</a>
			</div>
			<div class="col-lg-4 mb-4 about-us-containers">
				<img class="about-us-photo"
					src="https://media.licdn.com/dms/image/C5603AQGNzC_QYzcn2A/profile-displayphoto-shrink_800_800/0/1661013706962?e=1690416000&v=beta&t=5dCneLoBaCxF9VCyDKfcZnZrBRCjcB2Lv-no6kWjMjs"
					alt="Photo of Ryan" class="img-fluid">
				<div class="name-line">
					<p>
						<span>Ryan Arment</span>
					<br>
						<h4>
						<a href="https://github.com/MiAmigoRyan"><i class="fab fa-github"></i></a> 
						<a href="https://www.linkedin.com/in/ryan-arment-0aa9a214/"><i class="fab fa-linkedin"></i></a>
						<a href="mailto:arment.ryan@gmail.com"><i class="far fa-envelope"></i></a>
						</h4>
					</p>
				</div>
				<a>Java Full Stack Bootcamp Graduate. Former climbing coach of
					US Olympic Sport Climbers and 10 time National Youth Climbing Team
					Champions, AMGA Certified Rock Guide, transitioned into a software
					developer role, seeking challenging development position.</a>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>