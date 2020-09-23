<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/resources/css/movieList.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title>MovieChart</title>
</head>
<body>

	<div class="swiper-container">
		<div class="menu">
			<span><a href="/main">Home</a></span>
			<c:if test="${loginUser.i_user eq null}">
				<span><a href="/member/signIn">Sign In</a></span>
			</c:if>
			<c:if test="${loginUser.i_user ne null}">
				<span><a href="/member/logout">Logout</a></span>
			</c:if>
		</div>
        <div class="swiper-wrapper">
        	<c:forEach items="${list}" var="item">
            <div class="swiper-slide">
                <div class="card">
                    <div class="sliderText">
                        <img src="${item.img}">
                    </div>
                    <div class="content">
                    	<h3>${item.movieTitle}</h3>
                        <div class="group-one">${item.openDate }<span>예매율:${item.movieRate }</span></div>
                        <div class="group-two">${item.movieAge }</div>
                        <div class="group-three">
                        	<span>
                        		<i class="fa fa-star"></i>
                        	</span>
                        </div>
                        <a href="/movieDetail?movieTitle="${item.movieTitle}>View</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>	    
    
    
<script>
        var swiper = new Swiper('.swiper-container', {
          effect: 'coverflow',
          grabCursor: true,
          centeredSlides: true,
          slidesPerView: 'auto',
          coverflowEffect: {
            rotate: 30,
            stretch: 0,
            depth: 500,
            modifier: 1,
            slideShadows: true,
          },
          pagination: {
            el: '.swiper-pagination',
          },
        });
        
        function moveDetail(movieTitle){
        	location.href='/movieDetail?movieTitle='+movieTitle
        }
 </script> 
</body>
</html>