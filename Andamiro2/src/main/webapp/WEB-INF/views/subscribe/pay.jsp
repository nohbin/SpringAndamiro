<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/my.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <style>
     li{
      list-style: none;
    }
    
    label{
 	 display: block;
  	 margin-top: 10px;
	}
  </style>
  <title>결제창</title>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <script>
 
 /*  var token = $("meta[name='_csrf']").attr('content');
  var header = $("meta[name='_csrf_header']").attr('content');
  	$(function(){
  	    if(token && header) {
  	        $(document).ajaxSend(function(event, xhr, options) {
  	            xhr.setRequestHeader(header, token);
  	        });
  	    } */

    function closePopup(){
      window.close();
    }
    
    function pay(){    
    	if(checkPay()) {
	      requestPay();
    	}
    }
    
    function checkPay() {    	
		var checkbox = document.querySelector('input[name="termcheck"]');
    	if (!checkbox.checked) {
    	    alert("약관동의를 체크해주세요.");
    	    return false;
    	} 
    	if(${not empty loginUser.subscribe}){
    		alert("이미 구독중인 회원 입니다.");
    		return false;
    	}
    	return true;
      }
    
    function requestPay(){
   	    const userCode = "imp38388127";
		IMP.init(userCode);
       	var memberNumber = ${loginUser.memberNumber};
       	IMP.request_pay({
       		pg: "kakao",
       	    pay_method: "kakaopay",
    	    merchant_uid: "order_no"+memberNumber,
    	    name : '안다미로 구독 서비스',
    	    amount : 10,
    	    
    	}, function(rsp) { // callback 로직
			if(rsp.success) {
				var msg = '결제가 완료되었습니다.';
				alert(msg);
				sendPayDataToServer(rsp);  // 결제 정보를 서버로 전송 */
			
			}else {
				var msg = '결제에 실패하였습니다.'
				msg += '오류 : ' + rsp.error_msg;
				alert(msg);
			}			  
    	});
       	
    }
    
    function sendPayDataToServer(paymentData) { 
    	  var token = $("meta[name='_csrf']").attr('content');
    	  var header = $("meta[name='_csrf_header']").attr('content');
   	 	  var username = '${loginUser.getUsername()}' ;  
        $.ajax({
            url: '/subscribe/pay',
            type: 'post',
            data: {username: username}, 
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
            	alert("결제");
            
                console.log(response);
                alert("구독 가입이 완료되었습니다");
                window.close();
                window.opener.parent.location.href = '/main'; 
                /* window.location.href = "/main"; */
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
    
  </script> 
</head>
<body> 
  <div class="container border border-warning rounded-3 my-3 p-3" style="width: 20rem;">
    <div class="container text-center mb-2" style="width: 14rem;">
      <div class="fs-4 rounded-2 fw-bold" style="background-color: #f7dd4ae1;">
        구매상품명
      </div>
    </div>
    <div class="container text-center fs-5 lh-3">
      안다미로 밥상 구독 서비스<br>              
    </div>
  </div>  
  <div style="height: 3rem;"></div>
	  <div class="container">
	    <div class="container">
	      <div class="fs-4 text-center rounded-2 fw-bold" style="background-color: #f7dd4ae1; width: 7rem; margin-left:17rem">
	        결제내용
	      </div>
	    </div>
	    <div class="container fs-5 lh-lg border border-warning rounded-3 my-3 py-2" style="width: 30rem;">
	      <ul>
	        <li>구매 상품명 : 안다미로 밥상 구독 서비스</li>
	        <li>	        
	        이용기간 : <%= getCurrentDate() %> ~ <%= getFutureDate(30) %>
	        </li>
	        <li>결제 금액 : 3300원</li>
	      </ul>          
	    </div>
	  </div>  
	  <div style="height: 3rem;"></div>
	  <div class="container">
	    <div class="mb-2 fs-4">
	      약관동의
	    </div>
	    <div class="fw-bold mb-4">
	        <input type="checkbox" name="termcheck" value="약관">&nbsp; 주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.
	    </div>
	    <div>
	    </div>    
	  </div>
	  <div class="container text-center">
	    <button class=" btn btn-light fs-2 btn-lg me-2" style="width: 10rem" onclick="closePopup()">
	      취소
	    </button>
		<button onclick="pay()" class=" btn btn-outline-warning btn-lg ms-2 fw-bold fs-2" style="width: 10rem; text-decoration: none; color: #000;">
	      결제
	    </button>
	  </div>
  <div style="height: 3rem;"></div>
</body>
</html>
<%!
  // 현재 날짜를 가져오는 함수
  public String getCurrentDate() {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd");
    Calendar calendar = Calendar.getInstance();
    return dateFormat.format(calendar.getTime());
  }

  // 현재로부터 n일 후의 날짜를 가져오는 함수
  public String getFutureDate(int n) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd");
    Calendar calendar = Calendar.getInstance();
    calendar.add(Calendar.DAY_OF_MONTH, n);
    return dateFormat.format(calendar.getTime());
  }
%>   