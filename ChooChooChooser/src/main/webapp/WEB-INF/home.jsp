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
 <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
	    <c:forEach var="train" items="${trainList}" varStatus="status">
	    <div class="carousel-item ${status.index == 0 ? 'active' : ' ' }">
			<div class="carousel-item active">
		<a href= "${train.website }">
    			<img src=${train.photo } class="d-block w-100" alt="train">
		</a>
    		</div>
	    </div>
		</c:forEach>
  </div>
</div>

	

</body>

<jsp:include page="BootstrapFoot.jsp"></jsp:include>

</html>