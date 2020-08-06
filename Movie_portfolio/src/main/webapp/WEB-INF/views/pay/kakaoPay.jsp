<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>pay</title>
</head>
<body>
	
	
	

<script>
	$(function(){
		var IMP = window.IMP;
		IMP.init('imp47838988');//부여받은 가맹점 식별코드
		var msg;
		
		IMP.request_pay({
			pg:'kakaopay', //결제경로
			pay_method:'card', //결제 수단
			merchant_uid:'merchant'+new Date().getTime(),  //결제시간
			name:'영화예매',
			amount:10000
		},function(rsp){
			if(rsp.success){
				jQuery.ajax({ //결제정보를 조회를 위해 ajax로 imp_uid전달
					url:"/payments/complete",
					type:'POST',
					dataType:'json',
					data:{
						imp_uid:rsp.imp_uid
					}
				}).done(function(data) {
					if(everythings_fine){
						msg='결제가 완료되었습니다.';
						msg+='\n고유ID:'+rsp.imp_uid;
						msg+='\n상점 거래ID:'+rsp.merchant_uid;
						msg+='\결제 금액:'+rsp.paid_amount;
						msg+='카드 승인번호:'+rsp.apply_num;
						
						alert(msg);
					}
					//성공시 이동할 페이지
					location.href="/myReservePage"
				});
			}else{
				msg = '결제에 실패하였습니다.';
				msg += '에러내용:'+rsp.error_msg;
				//실패시 이동할 페이지
				alert(msg);
				location.href="/movieList"
		}
		
		});
	});
</script>	
</body>
</html>