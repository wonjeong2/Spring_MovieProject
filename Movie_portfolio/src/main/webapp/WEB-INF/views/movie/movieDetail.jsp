<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/movieDetail.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="/resources/js/movieDetail.js"></script>
<script src="resources/axios_js/axios.min.js"></script>
<title>Movie Star</title>

</head>
<body>

	<div id="cmtModContainer">
		<div id="cmtModWin">
			<form id="cmtFrm" action="/modCmt" method="post">
				<div class="rate">
					<i class="fa fa-star" data-rate="1"></i> <i class="fa fa-star"
						data-rate="2"></i> <i class="fa fa-star" data-rate="3"></i> <i
						class="fa fa-star" data-rate="4"></i> <i class="fa fa-star"
						data-rate="5"></i>
				</div>
				<input id="hidden" type="hidden" name="star" value="0"> <input
					type="hidden" name="movieTitle" value="${movie.movieTitle }">
				<input type="hidden" name="i_comment">
				<div>
					<textarea name="ctnt"></textarea>
				</div>
				<div>
					<input type="submit" value="수정">
				</div>
			</form>
			<button onclick="closeCmtModWin()">취소</button>
		</div>
	</div>

	<div class="wrap">
		<div class="movie_form">
			<img src="${movie.img }">
			<div class="movie_info">
				<h4>${movie.movieTitle }</h4>
				<h3>${movie.openDate }</h3>
				<h3>${movie.movieAge }</h3>
				<h3>${movie.movieRate }</h3>
				<i class="fa fa-star" style="color: #f05522;">${movie.star }</i>
			</div>
		</div>
		<form id="make_star" method="post" action="/movieCmt"
			onsubmit="return check()">
			<input type="hidden" name="movieTitle" value="${movie.movieTitle }">
			<div class="rate">
				<i class="fa fa-star" data-rate="1"></i> <i class="fa fa-star"
					data-rate="2"></i> <i class="fa fa-star" data-rate="3"></i> <i
					class="fa fa-star" data-rate="4"></i> <i class="fa fa-star"
					data-rate="5"></i>
			</div>
			<input id="hidden" type="hidden" name="star" value="0">
			<textarea id="ctnt" name="ctnt"></textarea>
			<input type="submit" value="Comment">
		</form>
		<div id="cmtList">
			<table>
				<c:forEach items="${cmtList}" var="item">
					<tr>
						<td><span id="cmt_star" data-rate="${item.star }"> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</span></td>
						<td>${item.ctnt }</td>
						<td>${item.cid }</td>
						<td><c:if test="${item.i_user == loginUser.i_user}">
								<a
									href="/cmtDel?i_comment=${item.i_comment }&i_user=${item.i_user}&movieTitle=${item.movieTitle}">삭제</a>
								<a href="#"
									onclick="showCmtModWin(${item.i_comment}, '${item.ctnt.trim()}')">수정</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


</body>
</html>