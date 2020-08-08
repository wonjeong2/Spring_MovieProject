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
	<form action="/seat" method="post">
	<div>
		영화
	</div>    
		<c:forEach items="${movieTitleList}" var="item">
			<input type="radio" name="movieTitle" value="${item}">${item}</option>
		</c:forEach>
    <!-- 극장(지역) 뿌리기 -->
    <div>극장</div>

    	<select name="location">
			<option value="대구">대구</option>
			<option value="대구수성">대구수성</option>
			<option value="대구스타디움">대구스타디움</option>
			<option value="대구아카데미">대구아카데미</option>
			<option value="대구월성">대구월성</option>
			<option value="대구이시아">대구이시아</option>
			<option value="대구칠곡">대구칠곡</option>
			<option value="대구한일">대구한일</option>
			<option value="대구현대">대구현대</option>
	</select>
    <!-- 시간 뿌리기 
    	<div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
-->
	<div>날짜</div>
		<select name="date">
			<c:forEach items="${date}" var="item">
				<option value="${item}">${item}</option>
			</c:forEach>
		</select>
	<input type="submit" value="좌석선택">
    </form>
</body>
</html>