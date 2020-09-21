<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet"  href="/resources/css/movieList.js">
<script src="/resources/axios_js/axios.min.js"></script>
<title>MovieChart</title>
</head>
<body>



<!-- section 부분 -->
	<section>
		<c:forEach items="${list }" var="item">
			  <div class="card" style="width: 18rem;">
			  <span class="movieAge">${item.movieAge }</span>
			  <img src="${item.img }" class="card-img-top">
			  <div class="card-body">
			    <h5 class="card-title">${item.movieTitle }</h5>
			    <p class="card-text">예매율:${item.movieRate }</p>
			    <p class="card-text">개봉일:${item.openDate }</p>
 			    <a href="/reserve" class="btn btn-primary" target="_blank">예매하기</a>  
			  </div>
			</div>
		</c:forEach>
	</section>
	
<!-- footer 영역 -->
	<footer>
		<div class="footer_container">
			<div class=footer_logo id="facebook">
				<a href="https://www.facebook.com/" target="_blank"><img src="/resources/img/facebook.png" alt="페이스북 바로가기"></a>
			</div>
			<div class=footer_logo id="instagram">
				<a href="https://www.instagram.com/?hl=ko" target="_blank"><img src="/resources/img/instargram.png" alt="인스타그램 바로가기"></a>
			</div>
		</div>
	</footer>
	
	
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>			
</body>
</html>