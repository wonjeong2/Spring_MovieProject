<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석선택</title>
</head>
<body>
	<form action="/kakaoPay" method="post">
	<span> 성인 : </span>
		<select id="ticketNum" class="ticketNum" name="adultNum">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<span> 청소년 : </span> 
		<select id="ticketNum" class="ticketNum" name="childNum">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<span> 우대권 : </span> 
		<select id="ticketNum" class="ticketNum" name="olderNum">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<br></br>	
		<div>SCREEN</div>
		
		<br>
		<c:forEach var="rowData" items="${seat }" >
			<tr>
				<c:forEach var="celData" items="${rowData }">
					<td>${celData}</td>
				</c:forEach>
		</br>
			</tr>
		</c:forEach>

		<input type="submit" value="결제하기">
	</form>

	<script>
		function select() {

		}
	</script>
</body>
</html>