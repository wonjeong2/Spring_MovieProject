<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/resources/css/movieList.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="/resources/axios_js/axios.min.js"></script>
<title>MovieChart</title>
</head>
<body>
	<section>
		<c:forEach items="${list }" var="item">
		<div class="card">
	        <div class="poster"><img src="${item.img }"></div>
	        <div class="details">
	            <h2>${item.movieTitle }</h2>
	            <div class="rating">
	                <i class="fa fa-star" aria-hidden="true"></i>
	                <i class="fa fa-star" aria-hidden="true"></i>
	                <i class="fa fa-star" aria-hidden="true"></i>
	                <i class="fa fa-star" aria-hidden="true"></i>
	                <i class="fa fa-star-o" aria-hidden="true"></i>
	                <span>4/5</span>
	            </div>
	            <div class="info">
	            	<p class="card-text">예매율:${item.movieRate }</p>
				    <p class="card-text">개봉일:${item.openDate }</p>
	            </div>
	        </div>
	    </div>
	    </c:forEach>
    </section>

</body>
</html>