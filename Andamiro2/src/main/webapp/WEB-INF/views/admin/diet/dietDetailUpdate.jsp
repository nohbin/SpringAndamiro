<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script>
	function updateCheck(){
		if (document.frm.foodName.value.length == 0) {
			alert("음식명을 입력하세요.");
			return false;
		}
		if (document.frm.kcal.value.length == 0) {
			alert("칼로리를 입력하세요.");
			return false;
		}
		if (document.frm.component.value == 0) {
			alert("영양성분을 첨부하세요.");
			return false;
		}
		alert("식단상세 정보가 수정되었습니다.");
		return true;
	}
</script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<div class="container">
	   <div style="height: 7rem;"></div>
		<h1 class="mb-3 text-center"> 식단상세정보 수정</h1>
		<form name="frm" role="form" style="display: inline;" class="mb-3" action="/admin/diet/dietDetailUpdate" method="post" onsubmit="return updateCheck();">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="dietDetailID" value="<c:out value="${dietDetail.dietDetailID}"/>">
			<div style="height: 3rem;"></div>
              <div class="form-group">
                  <label class="fw-bold mb-2">음식명</label> 
                  <input class="form-control mb-2" name="foodName" value='<c:out value="${dietDetail.foodName}"/>'>
               </div>
               <div class="form-group">
                  <label class="fw-bold mb-2">칼로리</label>
                   <input class="form-control mb-2" name="kcal" value='<c:out value="${dietDetail.kcal}"/>'>
               </div>
               <div class="form-group">
                  <label class="fw-bold mb-2">영양성분</label>  
                  <input class="form-control mb-2" name="component" value='<c:out value="${dietDetail.component}"/>'>
               </div>
               <button type="submit" data-oper='dietDetailUpdate' class=" btn btn-outline-warning ms-2 m-md-3">수정</button>
         </form>
               
		<form role="form" style="display: inline" method="post" action="/admin/diet/detailRemove">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="dietDetailID" value="${dietDetail.dietDetailID }" />
				<button type="submit" data-oper='remove' class="btn btn-outline-danger ms-2 m-md-3" >삭제</button>
		</form>
				
		<form role="form" style="display: inline" method="get" action="/admin/diet/dietDetailList">
				<button type="submit" data-oper='list' class="btn btn-outline-secondary ms-2 m-md-3">목록</button>
		</form> 
			
	</div>
	<div style="height: 7rem;"></div>
	<jsp:include page="../../footer.jsp"></jsp:include>		
</body>
</html>



