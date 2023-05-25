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

<div class="row text-center">
			<h1>Scenic Trains Across the US</h1>
			<h3>A Train enthusiast Community</h3>
		</div>

<div class="carousel-container">
<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <c:forEach var="train" items="${trainList}" varStatus="status">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" 
              <c:if test="${status.first}">class="active" aria-current="true"</c:if> 
              aria-label="Slide ${status.index+1}"></button>
    </c:forEach>
  </div>
  <div class="carousel-inner">
    <c:forEach var="train" items="${trainList}" varStatus="status">
      <div class="carousel-item <c:if test="${status.first}">active</c:if>">
        <img src="${train.photo}" alt="train photo">
		<div class="carousel-caption d-none d-md-block">
      	<h5><a class='carousel-href-tag' href='searchById.do?id=${train.id }'>${train.name }</a></h5>
      	<p>${train.description }</p>
      	</div>
      </div>
    </c:forEach>	
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>

</body>
<jsp:include page="BootstrapFoot.jsp"></jsp:include>
</html>