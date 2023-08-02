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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<jsp:include page="../adminheader.jsp"></jsp:include>
	<div class="container" align="center">
		<table class="table align-middle">
			<tr>
				<td colspan="5" style="border: white; text-align: right">
				<input type="button" value="식단 등록" class="btn btn-outline-warning" onclick="location.href='dietWrite'"> 
				</td>		
			</tr>
			<tr class="text-center">
				<th>식단번호</th><th>식단종류</th><th>식단메뉴</th><th>식단이미지</th>
			</tr>
			<c:forEach var="diet" items="${dietList }">
				<tr class="record text-center">
					<%-- <td class="fs-5">${diet.dietNumber }</td>
					<td class="fs-5">${diet.diet_kind}</td>
					<td class="fs-5">${diet.diet_menu}</td> --%>
					<td class="fs-5">
					<c:out value="${diet.dietNumber}"></c:out>
					</td>
					<td class="fs-5">
					<c:out value="${diet.diet_kind}"></c:out>
					</td>
					<td class="fs-5">
					<c:out value="${diet.diet_menu}"></c:out>
					</td>					
					<td>
					<a  href='<c:out value="dietView?dietNumber=${diet.dietNumber}"/>'>
					<img src="/resources/upload/${diet.diet_picture}" style="width:15rem; height:10rem;">
					</a>
					</td>
					
				</tr>
			</c:forEach>
		</table>
		<div class="d-flex justify-content-center">
	        <nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="AdminServlet?command=diet_list&page=${currentPage - 1 }" aria-label="이전" tabindex="-1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${totalPages }" varStatus="status">
						<li class="page-item">
							<a class="page-link" href="AdminServlet?command=diet_list&page=${status.count }">${status.count }</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="AdminServlet?command=diet_list&page=${currentPage + 1 }" aria-label="다음">
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