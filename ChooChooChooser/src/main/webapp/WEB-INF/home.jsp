<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<section id="image-carousel" class="splide" aria-label="Train Photos">
	<div class="splide__track">
		<ul class="splide__list">
			<c:forEach var="train" items="${trainList}">
				<li class="splide__slide">
					<img src="${train.photo}" alt="Photo of ${train.name}">
					<div>
						<a href='searchById.do?id=${train.id}'>${train.name}</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>

</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>