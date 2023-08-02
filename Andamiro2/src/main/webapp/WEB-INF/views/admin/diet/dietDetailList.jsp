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
<jsp:include page="../adminheader.jsp"></jsp:include>
	<div class="container" align="right">
	<div style="height: 1rem;"></div>
		<input type="button" value="식단상세 등록" class="btn btn-outline-warning" onclick="location.href='/admin/diet/dietDetailWrite'"> 
	</div>	
	<div class="container" align="center">
		<table class="table table-hover">
			<tr class="text-center">
				<th>상세식단번호</th><th>식단번호</th><th>음식명</th><th>칼로리</th><th>영양성분</th>
			</tr>
			<c:forEach var="dietDetail" items="${dietDetailList }"> <!--dietDetail: 현재 순회 중인 데이터 지칭하는 변수 -->
				<tr class="record text-center">
					<td>
					<c:out value="${dietDetail.dietDetailID }"></c:out>
					</td>
					<td>
					<c:out value="${dietDetail.dietNumber}"></c:out>
					</td>
					<td><a href='dietDetailView?dietDetailID=<c:out value="${dietDetail.dietDetailID }"/>'>
					<c:out value="${dietDetail.foodName}"></c:out></a></td>
					<td>
					<c:out value="${dietDetail.kcal}"></c:out>
					</td>
					<td>
					<c:out value="${dietDetail.component}"></c:out>
					</td>
					
				</tr>
			</c:forEach>
		</table>
		
		
	  <!-- 페이징처리 -->	
	  <div class="d-flex justify-content-center">
	        <nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="AdminServlet?command=dietDetail_list&page=${currentPage - 1 }" aria-label="이전" tabindex="-1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${totalPages }" varStatus="status">
						<li class="page-item">
							<a class="page-link" href="AdminServlet?command=dietDetail_list&page=${status.count }">${status.count }</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="AdminServlet?command=dietDetail_list&page=${currentPage + 1 }" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
      </div>

	</div>
	<div style="height: 7rem;"></div>
<jsp:include page="../../footer.jsp"></jsp:include>	
</body>
</html>