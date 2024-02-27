<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<style>
li {
	list-style: none;
}
a {
	color: black;
	text-decoration: none;
}
img {
	width: 10rem;
	height: auto;
}
.img-thumbnail {
	object-fit: fill;
	height: 200px !important; /* 원하는 높이로 조정하세요 */
	width: 100%; /* 너비는 부모 요소에 맞게 설정됩니다 */
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	
	<jsp:include page="mypage-menu.jsp"></jsp:include>

	 

	<div class="container text-center border mt-3 rounded-5">
		<input type="hidden" name = "recipeID" value="${recipe.recipeID }">
		<div class="row mt-3 row-cols-3">
			<c:forEach var="recipe" items="${recipeList }">
				<div class="col-12 col-md-4 mt-3 mb-3">
					<a href='RecipeServlet?command=recipe_detail&recipID=${recipe.recipeID }'> 
					<img src="/img/${recipe.mainPicture }" class="rounded-3 img-thumbnail">
					</a>
					<div class="">
						<div class=""><h5>${recipe.recipeName }</h5></div>
						<div class="">
							<span>${recipe.recipetag1 } </span><div class="vr"></div><span> ${recipe.recipetag2 } </span><div class="vr"></div><span> ${recipe.recipetag3 } </span>
						</div>
						<div class="">
							<b><span id="doc">댓글수 : ${recipe.reviewCount } </span></b>
							<div class="vr"></div>
							<b><span id="doc">조회수 : ${recipe.recipeView }</span></b>
							<div class="vr"></div>
							<b><span>평점 : ${recipe.recipeGrade }</span></b>
						</div>
						<input type="button" class="btn btn-warning btn_add_ingredient" value="수정" onclick="location.href='RecipeServlet?command=edit_recipe_form&recipeId=${recipe.recipeID }&memberNumber=${loginUser.memberNumber }'">
						<input type="button" class="btn btn-danger btn_add_ingredient" value="삭제" onclick="location.href='RecipeServlet?command=delete_recipe&recipeId=${recipe.recipeID }&memberNumber=${loginUser.memberNumber }'">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>