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
 <a href="detailsPage.do"><button>Detail's Page</button></a>
<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Engine Type</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="train" items="${trainList}">
				<tr>
					<td>${train.id}</td>
					<td>${train.name}</td>
					<td>${train.engine.type}</td>
					<td><a href='${train.website}'><button class='btn btn-success'>This Trains Website!</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	

</body>

<jsp:include page="BootstrapFoot.jsp"></jsp:include>

</html>