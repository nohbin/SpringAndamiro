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
	
	<div class="container" align="center">
		<div style="height: 1rem;"></div>
		<table class="table align-middle table-bordered border-warning border-opacity-50" style="width: 50rem;">
			<tbody class="border-3 rounded-3">
				<tr>
					<th class="text-center" style="width: 10rem;">레시피 이름</th>
					<td style="width: 40rem;">${recipe.recipeName}</td>
				</tr>
				<tr>
					<th class="text-center" style="width: 10rem;">작성자</th>
					<td style="width: 40rem;">${recipe.userId}</td>
				</tr>
				<tr>
					<th class="text-center" style="width: 10rem;">식단이미지</th>
					<td style="width: 40rem;"><img src="resources/img/${recipe.mainPicture}" style="width: 15rem; height: 10rem;"></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 10rem;">조회수</th>
					<td style="width: 40rem;">${recipe.recipeView}</td>
				</tr>
				<tr>
					<th class="text-center" style="width: 10rem;">평점</th>
					<td style="width: 40rem;">${recipe.recipeGrade}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" align="center">
		<br> <br> 
		<input type="button" value="삭제하기" class="btn btn-danger" onclick="location.href='RecipeServlet?command=delete_recipe&recipeId=${recipe.recipeID}'">
		<input type="button" value="목록" class="btn btn-primary" onclick="location.href='AdminServlet?command=recipe_list_view&page=1'"> 
	</div>
	
	

	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>