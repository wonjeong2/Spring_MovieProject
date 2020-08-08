<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>  
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>movieChart</title>
</head>
<body>
	<!-- 영화제목 뿌리기 -->
	<div>
		영화
	</div>    
    <select name="year">
		<c:forEach items="${movieTitleList}" var="item">
			<option value="${item}">${item}</option>
		</c:forEach>
	</select>
    <!-- 극장(지역) 뿌리기 -->
    <div>극장</div>
	    <div id="location" onclick="getvalue()">
	    	<button onclick="getvalue()">대구</button>
	    	<button>대구수성</button>
	    	<button>대구스타디움</button>
	    	<button>대구아카데미</button>
	    	<button>대구월성</button>
	    	<button>대구이시아</button>
	    	<button>대구칠곡</button>
	    	<button>대구한일</button>
	    	<button>대구현대</button>
	    </div>
    
    <!-- 시간 뿌리기 
    	<div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
-->
	<div>날짜</div>
	<div>  
		<c:forEach items="${date}" var="item">
	        	<div>
		       		<button>${item}</button>
	       		</div>
        </c:forEach>
    </div>
    
</body>
</html>