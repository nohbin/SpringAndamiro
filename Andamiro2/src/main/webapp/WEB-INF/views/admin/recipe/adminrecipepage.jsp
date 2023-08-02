<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css?ver=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<script src="resources/js/bootstrap.bundle.min.js?ver=1"></script>
<style>
li {
	list-style: none;
}

a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>

	<jsp:include page="../adminheader.jsp"></jsp:include>

	<div style="height: 3rem;"></div>
	<div class="container">
		총 레시피 수 : ${totalRows }
		<table class="table text-center border">
			<thead>
				<tr>
					<th scope="col">레시피 번호</th>
					<th scope="col">레시피 이름</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">평점</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="recipe" items="${recipeList }" varStatus="status">
					<tr>
						<td>${recipe.recipeID }</td>
						<td><a href='<c:url value="/AdminServlet?command=recipe_detail_edit_view&recipeid=${recipe.recipeID }"/>'>${recipe.recipeName }</a></td>
						<td>${recipe.userId }</td>
						<td>${recipe.recipeView }</td>
						<td>${recipe.recipeGrade }</td>
						<td>${recipe.recipeRegDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
					<a class="page-link ${currentPage == 1 ? 'disabled' : '' }" href="<c:url value="/AdminServlet?command=recipe_list_view&page=${currentPage - 1 }"/>"
						aria-label="이전" tabindex="-1"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="1" end="${totalPages }" varStatus="status">
						<li class="page-item">
							<a class="page-link" href="<c:url value="/AdminServlet?command=recipe_list_view&page=${status.count }"/>">${status.count }</a>
						</li>
					</c:forEach>
					<li class="page-item">
					<a class="page-link ${currentPage == totalPages ? 'disabled' : '' }" href="<c:url value="/AdminServlet?command=recipe_list_view&page=${currentPage + 1 }"/>"
						aria-label="다음"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>



	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>