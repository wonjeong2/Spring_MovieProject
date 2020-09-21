<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet"  href="/resources/css/main.css">
<script src="/resources/js/main.js"></script>
<title>Main</title>
</head>
<body>
	
    <section class="sec">
        <header>
            <a href="/main"><img src="/resources/img/movieIcon.png" class="logo"></a>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="/movieList">Movie</a></li>
                <c:if test="${loginUser.i_user eq null}">
                	<li><a href="/member/signIn">Sign In</a></li>
                </c:if>	
            </ul>
        </header>
        <div class="content">
            <div class="textBox">
                <h2>That's What<br><span>I like</span></h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
                It has survived not only five centuries, but also the leap into electronic typesetting, 
                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing
                Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of
                Lorem Ipsum.</p>
                <a href="#">View All Movies</a>    
            </div>
            <div class="imgBox">
                <img src="/resources/img/red.jpg" class="whiteBox">
            </div>
        </div>
        <ul class="thumb">
            <li><img src="/resources/img/red.jpg" onclick="imgSlider('/resources/img/red.jpg');changeBgColor('#ef4136')"></li>
            <li><img src="/resources/img/white.jpg" onclick="imgSlider('/resources/img/white.jpg');changeBgColor('#fff')"></li>
        </ul>
    </section>

<script>
function imgSlider(anything){
    document.querySelector('.whiteBox').src = anything;
}
function changeBgColor(color){
    const sec = document.querySelector('.sec');
    sec.style.background = color;
}
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>		
</body>
</html>