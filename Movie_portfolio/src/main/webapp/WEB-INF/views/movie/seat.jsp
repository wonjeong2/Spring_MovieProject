<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/seat/seat.js"></script>
<title>좌석선택</title>
<style>
	.seat {
		cursor: pointer;
	}
</style>
</head>
<body>
	<form action="/kakaoPay" method="post">
		<span> 성인 : </span>
		<select id="adultNum" class="ticketNum" name="adultNum" onchange="changeSelectValue()">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<span> 청소년 : </span> 
		<select id="childNum" class="ticketNum" name="childNum" onchange="changeSelectValue()">
			<option value="0">0</option>		
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<span> 우대권 : </span> 
		<select id="olderNum" class="ticketNum" name="olderNum" onchange="changeSelectValue()">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<br></br>	
		<div>SCREEN</div>
		
		<br>
		<table>
		<c:forEach var="rowData" items="${seat }" >
			<tr>
				<c:forEach var="celData" items="${rowData }">
					<td class="seat" onclick="select('${celData}')">${celData}</td>
				</c:forEach>
			</tr>
		</c:forEach>
		</table>
		
	</form>
	
	<form action="/kakaoPay" method="post" onsubmit="return doSubmit()">
		<input type="hidden2" id="totalSeatCnt" name="totalSeatCnt" value="0">
		<input type="hidden2" id="totalSeatAmount" name="totalSeatAmount" value="0">
	
		<input type="hidden2" name="selectedSeatNumbers" id="selectedSeatNumbers">	
		<input type="submit" value="결제하기">
	</form>

	<script>
		var selectedSeat = new Array()
		function doSubmit() {
			var txt = ''
			
			selectedSeat.forEach(function(item) {
				txt += item + ","
			})
			
			selectedSeatNumbers.value = txt
			
		}
		function changeSelectValue() {
			totalSeatCnt.value = adultNum.selectedIndex + childNum.selectedIndex + olderNum.selectedIndex
			totalSeatAmount.value = (adultNum.selectedIndex * 11000) + (childNum.selectedIndex * 9000) + (olderNum.selectedIndex * 5000)
		}
		
		function select(celData) {
			if(selectedSeat.length == totalSeatCnt.value){
				alert('인원이 초과하였습니다.')
				return
			}
			
			var existIdx = selectedSeat.indexOf(celData)
			
			if(existIdx > -1) { //이미 선택되어 있었음 (배열에서 삭제 처리)
				selectedSeat.splice(existIdx, 1)
			} else { //선택이 안 되어 있었음 (배열에 추가)
				selectedSeat.push(celData)
			}
			
			console.log(selectedSeat)
		}
	</script>
</body>
</html>