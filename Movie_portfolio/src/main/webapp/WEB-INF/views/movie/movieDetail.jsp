<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/movieDetail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/movieDetail.js"></script>
<title>평점</title>

<style>
img {
	width: 50px;
	height: 50px;
}

#movieImg>img {
	width:400px;
	height:400px;	
}
</style>

</head>
<body>
	<div id="movieImg">
		<img src="${movie.img}" /> 
		<div>${movie.movieTitle}</div>

	</div>
	<div>
		<form action="movieDetail?movieTitle=${movie.movieTitle}" method="post" name="cmtform">

			<table width="700px">
				<tbody>
					<tr>
						<!-- 작성자 -->
						<td width="100px" rowspan="2">${loginUser.nm }</td>
						<td width="500px" height="50px" colspan="2">
							<div>
								<span> <!-- 순서대로 1~5번째 별
                                onmousover - 마우스가 별 위에 올려져있을 때 효과
                                onclick - 마우스로 별을 클릭 했을 때 나타나는 효과
                                onmouseout - 마우스가 별 밖으로 나갔을 때 나타나는 효과
                            --> <img id="image1" onmouseover="show(1)"
									onclick="mark(1)" onmouseout="noshow(1)"
									src="./resources/img/star0.png"> <img id="image2"
									onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)"
									src="./resources/img/star0.png"> <img id="image3"
									onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)"
									src="./resources/img/star0.png"> <img id="image4"
									onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)"
									src="./resources/img/star0.png"> <img id="image5"
									onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)"
									src="./resources/img/star0.png">
									<button type="button" onclick="chogiwha()">리셋</button>
								</span> <br>
								<!-- 별점에 따른 코멘트 -->
								<input id="startext" type="hidden1">
							</div> 
							<!-- 평점 --> 
							<input id="num" type="hidden1" name="cmt_star">
						</td>
						
						<!-- submit -->
						<c:if test="${loginUser.i_user != null}">
							<td width="100px" rowspan="2"><input type="submit"
								name="submit" value="등록하기"></td>
						</c:if>
						<c:if test="${loginUser.i_user == null}">
							<td width="100px" rowspan="2">
							<input type="button" value="로그인하기" onclick="login()">
							</td>
						</c:if>
						<!-- 영화제목 -->

					</tr>
					<tr>
						<c:if test="${loginUser.i_user == null}">
							<!-- 로그인 안 되어있을 때-->
							<td widht="500px" height="100px" colspan="2"><textarea
									name="content" cols="65" rows="7" readonly="">로그인 후 이용 가능한 서비스입니다.</textarea>
							</td>
						</c:if>
						<c:if test="${loginUser.i_user != null }">
							<!-- 로그인 되어있을 때-->
							<td width="500px" height="100px" colspan="2"><textarea
									name="content" cols="65" rows="7"></textarea></td>
						</c:if>
					</tr>
				</tbody>
			</table>
			<!-- 
		${rating.cmt_num }
		${rating.cmt_wirtier}
		${rating.cmt_star}
		${rating.cmt_content}
		${rating.cmt_move}
		${rating.cmt_reg_date}
		 -->
		</form>
	</div>

	<script>
		var locked = 0;

		//마우스를 별 위에 올려만 놨을 때 효과(onmouseover)
		function show(star) {

			var i;
			var image;
			var el;

			//locekd가 0일 때(별을 클릭하기 전)
			if (locked == 0) {

				for (i = 1; i <= star; i++) {
					image = 'image' + i;
					//document(html문서).getElementById()
					//ex> document.getElementById(image1)이라고 하면
					//html문서 안에 image1이라는 id를 가진 엘리먼트의 주소값을 el에 담는다.
					el = document.getElementById(image);
					//i = 1 일 때, el.src = image1.src = star1.png파일을 사용한다
					el.src = "./resources/img/star1.png";
				}
			}

		}

		//별 클릭전 마우스가 별 밖으로 이동했을 때 효과(onmouseout)
		function noshow(star) {

			var i, image, el;

			//별을 클릭하고 난 이후로는 noshow함수의 효과를 사용할 수 없다.
			if (locked) {
				return;
			}

			for (i = 1; i <= star; i++) {
				image = 'image' + i;
				el = document.getElementById(image);
				el.src = "./resources/img/star0.png";
			}

		}

		//별 클릭 시 후에 다시 별점이 바뀌지 않게 하기 위해 사용함
		function lock(star) {
			show(star);
			locked = 1;
		}

		//별 클릭시 효과(onclick)
		function mark(star) {

			//별을 클릭 한 이후 별점을 재설정 할 때

			if (locked) {
				locked = 0;
				noshow(5);
				mark(star);
				return;
			}

			//lock함수
			lock(star);
			//docuemnt는 html문서.id=cmtform 안에 있는 num이라는 아이디를 가진 곳의 value값을 ''안에 있는 값으로 바꿔준다.
			document.cmtform.num.value = star;

			switch (star) {
			case 1:
				cmtform.startext.value = '괜히봤어요';
				break;
			case 2:
				cmtform.startext.value = '기대하진 마세요';
				break;
			case 3:
				cmtform.startext.value = '무난했어요';
				break;
			case 4:
				cmtform.startext.value = '기대해도 좋아요';
				break;
			case 5:
				cmtform.startext.value = '개꿀잼';
				break;
			}
		}

		//리셋버튼(필요없을 예정)
		function chogiwha() {
			location.href = "/board/Rating";
		}
			
		function login() {
			location.href = "/member/signIn";
		}
		
		
	</script>
</body>
</html>