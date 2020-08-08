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
	<div>  
		<c:forEach items="${movieTitleList}" var="item">
	        	<div id="movieTitle">
		       		<button>${item}</button>
	       		</div>
        </c:forEach>
    </div>
    
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
    
    <!-- 시간 뿌리기 -->
    	<div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
  
  
        
<script>
		
        const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");

      
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth();
            for (i = date.getDate(); i <= lastDay.getDate(); i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                //class넣기
                button.classList = "movie-date-wrapper"
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                //weekOfDay[new Date(2020-03-날짜)]
                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                //요일 넣기
                if (dayOfWeek === "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek === "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);

              /*   dayClickEvent(button); */
            }

        



/* 
        function dayClickEvent(button) {
            button.addEventListener("click", function() {
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) = {
                    list.classList.remove("movie-date-wrapper-active");
                })
                button.classList.add("movie-date-wrapper-active");
            })
        } */
    </script>
</body>
</html>