<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석선택</title>
</head>
<body>
<div>SCREEN</div>

<c:forEach var="rowData" items="${seat }">
	<tr>
		<c:forEach var="celData" items="${rowData }">
			<td>${celData}</td>
		</c:forEach> 
	</tr>
</c:forEach>

</body>
</html>