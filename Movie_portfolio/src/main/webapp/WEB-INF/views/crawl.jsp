<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/bootstrap_css/bootstrap.css">
<link rel="stylesheet"  href="/resources/common_css/style.css">
<script src="/resources/bootstrap_js/bootstrap.js"></script>
<script src="/resources/common_js/common_js.js"></script>
<script src="/resources/axios_js/axios.min.js"></script>
<title>Main</title>
</head>
<body>
<!-- nav영역 -->
	<c:import url = "/resources/layout/nav.jsp" var = "navbar">
	</c:import>
	${navbar }
	
	
  <!-- 메인 슬라이드 -->

<div class="wrap">  
  <div class="container_visual">
    <!-- Promotion -->
    <!-- 슬라이딩기능: 이미지 (type = 'th')를 순차적(javascript) 으로 노출 -->
    <ul class="visual_img">
       <c:forEach items="${list}" var="item">
        <li>
        	<div id="movieList" style="display:inline-block; margin-right:50px;">
	       		<img src="${item.img}" style="display:block;" >
       		</div>
        </li>
        </c:forEach>
    </ul>
  </div>
  <span class="nxt_fix" style="display:none;"></span>
</div>


<!-- footer 영역 -->




<script type="text/javascript">
//크롤링 이미지 슬라이더 기능 구현
var image_ul = document.querySelector(".visual_img");

window.onload = function() {
	var imgCnt = 0;
	/* Animation: sliding setting */
	image_ul.querySelectorAll("li").forEach(()=> {
		imgCnt ++;
	});
	image_ul.style.width = (image_ul.offsetWidth * imgCnt) + "px";
  	// width 이미지 갯수만큼 늘리기 - display:inline 으로 한 이유.
	slideShow(imgCnt);
}

/* Animation: sliding */
function slideShow(imgCnt) {
    image_ul.style.left = "0px";
	var count = 1;
	
	setInterval( () => {
		console.log('count: ' + count);
		console.log('image_ul.style.left: ' + image_ul.style.left);
	
		image_ul.style.left = (parseInt(image_ul.style.left) - image_ul.offsetWidth) + "px";
		count += 1;
		
		if( count > imgCnt ) {
			// 처음으로
			count = 1;
			image_ul.style.left = "0px";
		}
	},2000);	
}

var image_ul = document.querySelector(".visual_img");

window.onload = function() {
	var imgCnt = 0;
	/* Animation: sliding setting */
	image_ul.querySelectorAll("li").forEach(()=> {
		imgCnt ++;
	});
	image_ul.style.width = (image_ul.offsetWidth * imgCnt) + "px";
	
	slideShow(imgCnt);
}

/* Animation: sliding */
function slideShow(imgCnt) {
	var curIndex = 0;
	
	setInterval( () => {
		image_ul.style.transition = "transform 2s ease-out";
		image_ul.style.transform = "translate3d(-" + 414*(curIndex+1)+"px, 0px, 0px)";
		curIndex++;
		
		console.log(curIndex);
		if( curIndex === imgCnt-1 ) {
			curIndex = -1;
		}
	},2000);	
}
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>		
</body>
</html>