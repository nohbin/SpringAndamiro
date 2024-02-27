<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css">
<link rel="stylesheet" href="../../resources/css/join.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<div class="container" align="left">
	   <div style="height: 3rem;"></div>
		<div class="fs-3 fw-bolder ms-3">식단 상세 정보</div>
		 <div style="height: 3rem;"></div>
		<table class="table table align-middle table-bordered border-warning border-opacity-50" style="width: 60rem;">
			<tbody class="border-3 rounded-3">
			<tr><th class="text-center fs-5" style="width: 10rem">음식명</th>
				<td style="width: 40rem;">${dietDetail.foodName}</td>
			</tr>
			<tr>	
				<th class="text-center fs-5" style="width: 10rem">칼로리</th>
				<td style="width: 40rem;">${dietDetail.kcal}</td>
			</tr>
			<tr><th class="text-center fs-5" style="width: 10rem">영양성분</th>
				<td style="width: 40rem;">${dietDetail.component}</td>
			</tr>
			</tbody>
		</table>
		</div>
		<div style="height: 3rem;"></div>
		<div class="container" align="center">
		<br> <br> 
				
		<button data-oper='modify' class="btn btn-outline-secondary"
		onclick="location.href='/admin/diet/dietDetailUpdate?dietDetailID=<c:out value="${dietDetail.dietDetailID}"/>'">
		수정하기 </button>		    
		<button data-oper='list' class="btn btn-outline-secondary"
		onclick="location.href='/admin/diet/dietDetailList'">목록 </button> 
		
		<form id='operForm' action="/admin/diet/dietDetailUpdate" method="get">
			<input type='hidden' id='dietDetailID' name='dietDetailID' value='<c:out value="${dietDetail.dietDetailID}"/>' >
		</form>		
		
	<script type="text/javascript">
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){    //수정 버튼 누르면 dietDetailID 값 같이 전달하고 submit
			operForm.attr("action","/admin/diet/dietDetailUpdate").submit();	
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#dietDetailID").remove();  //form태그 내의 dietDetailID 태그 지움 
			operForm.attr("action","/admin/diet/dietDetailList")
			operForm.submit();
		});
		
	});
	</script>		
	</div>
	<div style="height: 10rem;"></div>
<jsp:include page="../../footer.jsp"></jsp:include>	
</body>
</html>