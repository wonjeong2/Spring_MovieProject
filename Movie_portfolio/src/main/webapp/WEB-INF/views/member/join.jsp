<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>Join</title>
</head>
<body>
	<form action="/member/joinPost" method="post">
		<div><input type="text" name="cid" placeholder="아이디">${data.cid }</div>
		<div><input type="password" name="cpw" placeholder="비밀번호">${data.cpw }</div>
		<div><input type="password" name="cpwConfirm" placeholder="비밀번호확인">${data.cpw }</div>
		<div>
			Phone : 010 - <input type="text" name="ph" id="ph">
			<button  type="button" onclick="sendPhAuthNumber()">인증번호 보내기</button>
		</div>
		<div>
			인증번호:<input type="text" name="phAuthNumber">
		</div>
		<div id="phAuthResult"></div>
		<div><input type="text" name="nm" placeholder="이름">${data.nm }</div>
		<div><input type="text" name="email" placeholder="email">${data.email }</div>
		<div><input type="submit" value="회원가입"></div>
	</form>
	
<script>
	function sendPhAuthNumber() {
		if(ph.value.length < 8){
			alert('Phone 번호를 확인해 주세요')
			return
		}
		console.log('ph :'+ph.value)
		axios.get('/member/phAuth',{
			params: {
				ph:ph.value
			}
		}).then(function(res){
			
			if(res.data.result == 1){
				alert('통신완료')
			}else{
				alert('에러 발생')
			}
			
		})
	}
</script>	
</body>
</html>