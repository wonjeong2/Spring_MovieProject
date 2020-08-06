<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body>
	<form action="/member/loginPost" method="post">
		<div><input type="text" name="cid" placeholder="아이디"></div>
		<div><input type="password" name="cpw" placeholder="비밀번호"></div>
		<div><input type="submit" value="로그인"></div>
	</form>
	<div><a href="/member/join"><button>회원가입</button></a></div>
	<div>
		<a href="/member/loginKAKAO">카카오 로그인</a>
	</div>
</body>
</html>