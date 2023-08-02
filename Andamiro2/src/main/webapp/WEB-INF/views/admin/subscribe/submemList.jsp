<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.css">
<link rel="stylesheet" href="../../resources/css/join.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<jsp:include page="../adminheader.jsp"></jsp:include>
	<div class="container" align="center">
		 <div style="height: 1rem;"></div>
		 <table class="table table-hover">
			<tr>
				<td colspan="10" style="border: white; text-align: right">
			</tr>
			<tr class="text-center">
				<th>구독번호</th>
				<th>회원번호</th>
				<th>구독시작일</th>
				<th>구독종료일</th>
			</tr>
			<c:forEach var="subscribe" items="${submemList }">
				<tr class="record text-center">
					<td>
						<a href="submemView?subNumber=${subscribe.subNumber}">
						${subscribe.subNumber}
						</a>
					</td>
					<td>${subscribe.memberNumber}</td>  
					<td>${subscribe.sub_start}</td>
					<td>${subscribe.sub_end }</td>
				</tr>
			</c:forEach>
		 </table>
    	<div class="d-flex justify-content-center">
	        <nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link ${currentPage == 1 ? 'disabled' : '' }" href="AdminServlet?command=submem_list&page=${currentPage - 1 }" aria-label="이전" tabindex="-1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${totalPages }" varStatus="status">
						<li class="page-item">
							<a class="page-link" href="AdminServlet?command=submem_list&page=${status.count }">${status.count }</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link ${currentPage == totalPages ? 'disabled' : '' }" href="AdminServlet?command=submem_list&page=${currentPage + 1 }" aria-label="다음">
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