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
		if (document.frm.diet_kind.value.length == 0) {
			alert("식단 종류를 입력하세요.");
			return false;
		}
		if (document.frm.diet_menu.value.length == 0) {
			alert("식단 메뉴를 입력하세요.");
			return false;
		}
		if (document.frm.diet_picture.value == 0) {
			alert("식단 이미지를 첨부하세요.");
			return false;
		}
		alert("식단이 수정되었습니다.");
		return true;
	}
</script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<div class="container">
	   <div style="height: 7rem;"></div>
		<h1 class="mb-3 text-center"> 식단 수정</h1>
		<form name="frm" role="form" style="display: inline;" class="mb-3" method="post" action="/admin/diet/dietUpdate" onsubmit="return updateCheck();" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div style="height: 3rem;"></div>
              <div class="form-group">
                  <label class="fw-bold mb-2">식단 번호</label> 
                  <input class="form-control mb-2"" name="dietNumber" value='<c:out value="${diet.dietNumber}"/>' readonly="readonly">
               </div>
               <div class="form-group">
                  <label class="fw-bold mb-2">식단 종류</label>
                   <input class="form-control mb-2" name="diet_kind" value='<c:out value="${diet.diet_kind }"/>'>
               </div>
               <div class="form-group">
                  <label class="fw-bold mb-2">식단 메뉴</label>  
                  <input class="form-control mb-2" name="diet_menu" value='<c:out value="${diet.diet_menu }"/>'>
               </div>
               <div class="form-group">
               	 <label class="fw-bold mb-2">식단 이미지</label>
                 <input type="file" class="form-control mb-2" name="diet_picture" value="${diet.diet_picture}">			
               </div>
               <button type="submit" data-oper='dietUpdate' class=" btn btn-outline-warning ms-2 m-md-3">수정</button>
         </form>
               
		<form role="form" style="display: inline" method="post" action="/admin/diet/remove">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="dietNumber" value="${diet.dietNumber}" />
				<button type="submit" data-oper='remove' class="btn btn-outline-danger ms-2 m-md-3" >삭제</button>
		</form>
				
		<form role="form" style="display: inline" method="get" action="/admin/diet/dietList">
				<button type="submit" data-oper='list' class="btn btn-outline-secondary ms-2 m-md-3">목록</button>
		</form>              			
				
			
	</div>
	<div style="height: 7rem;"></div>
	<jsp:include page="../../footer.jsp"></jsp:include>		
</body>
</html>



