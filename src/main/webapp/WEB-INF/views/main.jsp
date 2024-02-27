<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css?ver=1">
<link rel="stylesheet" href="./resources/css/main.css?ver=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<style>
li {
	list-style: none;
}

.text-white>span>img {
	border-radius: 50%;
	overflow: hidden;
	-webkit-box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.30);
	box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.30);
}

a {
	color: black;
	text-decoration: none;
}

.sin {
	left: 15%;
	position: relative;
}

.slider1 {
	width: 80%;
	height: 480px;
	position: relative;
	margin: 0 auto;
	overflow: hidden;
	object-fit: fill;
	text-align: center;
	margin-top: 15px;
	border: 2px solid gray;
}

.slider1 input[type=radio] {
	display: none;
}

ul.imgs1 {
	padding: 0;
	margin: 0;
	width: 100%;
}

ul.imgs1 li {
	position: absolute;
	left: 640px;
	width: 100%;
	transition-delay: 0.1s;
	list-style: none;
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
	color: #fac279;
}

.bullets2 {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 20px;
	z-index: 2;
}

.bullets2 label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.55);
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.slider1 input[type=radio]:nth-child(1):checked ~.bullets1>label:nth-child(1)
	{
	background-color: #d63939;
}

.slider1 input[type=radio]:nth-child(2):checked ~.bullets1>label:nth-child(2)
	{
	background-color: red;
}

.slider1 input[type=radio]:nth-child(3):checked ~.bullets1>label:nth-child(3)
	{
	background-color: red;
}

.slider1 input[type=radio]:nth-child(4):checked ~.bullets1>label:nth-child(4)
	{
	background-color: #fff;
}

.slider1 input[type=radio]:nth-child(1):checked ~ul.imgs1>li:nth-child(1)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider1 input[type=radio]:nth-child(2):checked ~ul.imgs1>li:nth-child(2)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider1 input[type=radio]:nth-child(3):checked ~ul.imgs1>li:nth-child(3)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider1 input[type=radio]:nth-child(4):checked ~ul.imgs1>li:nth-child(4)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider1 .imgs1>li img {
	width: 100%;
	position: relative;
}

.text-img {
	position: absolute;
	top: -680px;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.image-container {
	position: relative;
	display: inline-block;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<div
			class="slider1 container rounded-5 main_content text-center mt-5 border-2 border-top border">
			<input type="radio" name="slide1" id="slide7" checked> <input
				type="radio" name="slide1" id="slide8"> <input type="radio"
				name="slide1" id="slide9">
			<ul id="imgholder1" class="imgs1">
				<li><img src="./resources/img/mainbackground.png"
					height="530px"></li>
				<li><img src="./resources/img/summer.jpg" height="max">
					<div class="image-container">
						<img src="./resources/img/summer.jpg" height="530px">
						<div class="text-img">
							<h1 class="display-3 fw-bold">2023 3분기 공모전</h1>
							<h3 class="fw-normal text-muted mb-3">
								<b>신청기간 2023.6.17~2023.07.02</b>
							</h3>
							<div class="d-flex gap-3 justify-content-center lead fw-normal">
								<a class="icon-link" href="#" style="color: black;"> <b>신청하기</b>
									<svg class="bi">
                            <use xlink:href="#chevron-right" />
                        </svg>
								</a> <a class="icon-link" href="#" style="color: black;"> <b>접수방법</b>
									<svg class="bi">
                            <use xlink:href="#chevron-right" />
                        </svg>
								</a>
							</div>


						</div>
					</div></li>

				<li><img src="./resources/img/maingudok.png" height="max"></li>
			</ul>
			<div class="bullets2">
				<label for="slide7">&nbsp;</label> <label for="slide8">&nbsp;</label>
				<label for="slide9">&nbsp;</label>
			</div>
		</div>


		<div
			class="container rounded-5 main_content text-center mt-5 border-2 border-top border">
			<h1>
				2023 2분기 수상작품 <span class="badge bg-secondary">더보기</span>
			</h1>
			<div class="slider mb-5">
				<input type="radio" name="slide" id="slide1" checked> <input
					type="radio" name="slide" id="slide2"> <input type="radio"
					name="slide" id="slide3"> <input type="radio" name="slide"
					id="slide4">
				<ul id="imgholder" class="imgs">
					<li><img src="./resources/img/sliderfood.jpg" height="480">
						<h1 class="display-3 fw-bold">2분기 우승 작품</h1></li>
					<li><img src="./resources/img/sliderfood1.jpg" height="480"></li>
					<li><img src="./resources/img/c.jpg" height="480"></li>
					<li><img src="./resources/img/d.jpg" height="480"></li>
				</ul>
				<div class="bullets">
					<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
					<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
				</div>
			</div>
		</div>

		<section class="container mt-4 ">
			<form action="BestMainServlet" method="post" name="main">
				<dl class="bestrecipe d-flex justify-content-center">

					<dt>
						<h1>
							<span id="headline">베스트 </span>레시피 <a
								href="BestMainServlet?=command=main"></a>
						</h1>
					</dt>
					<dd class="bestmenu">
						<ul class="bestmenu1">
							<c:forEach items="${bestRecipeList}" var="best"
								varStatus="status">
								<li class="rankingnum">
									<p class="rankingnum-st1">
										<b>${status.index + 1}</b>
									</p>
									<div class="rankingimg">
										<input type="hidden" name="recipeID" value="${best.recipeID}">
										<a href="RecipeServlet?command=recipe_detail&recipID=${best.recipeID }"><img
											src="resources/img/${best.mainPicture }" width="200" height="150"></a>
									</div>

									<div class="rankingtitle mt-3">
										<b>제목 : ${best.recipeName }</b>
									</div>
									<div class="membericon">
										유저 ID : ${best.userid}  <a href="RecipeServlet?command=recipe_list"><span
											class="me-2 badge rounded-pill text-bg-warning">더보기</span></a>
									</div>
									<div class="rivew">
										<span>작성일 : ${best.recipeRegDate}</span> <span>평점 :
											${best.recipeGrade }</span> <span>조회수 : ${best.recipeView}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</dd>
				</dl>
			</form>
		</section>
		<section class="container my-5 ">
			<div class="sin">
				<h1>
					<span id="headline">오늘의</span>&nbsp;식단
				</h1>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-lg-3 mb-2 mt-2 d-flex">
					<div class="card" style="width: 18rem;">
						<img src="./resources/img/morning.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">오늘의 아침식단</h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">고구마,계란,요거트,바나나</li>
							<li class="list-group-item">AM : 7~9시 권장</li>
						</ul>
						<div class="card-body">
							<a href='<c:url value="/SubDietServlet?command=rec_diet"/>' class="card-link">
								<b>아침식단 보러가기</b>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 mb-2 mt-2 d-flex ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/img/lunch.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">오늘의 점심식단</h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">현미밥,목살150g,브로콜리,소고기100g</li>
							<li class="list-group-item">PM : 12~2시 사이권장</li>
						</ul>
						<div class="card-body">
							<a href='<c:url value="/SubDietServlet?command=rec_diet"/>' class="card-link"><b>점심식단 보러가기</b></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 mb-2 mt-2 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="./resources/img/diner.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">오늘의 저녁식단</h5>
							<p class="card-text"></p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">양배추, 닭가슴살, 계란, 땅콩</li>
							<li class="list-group-item">PM : 6 ~ 8시 사이 권장</li>
						</ul>
						<div class="card-body">
							<a href='<c:url value="/SubDietServlet?command=rec_diet"/>' class="card-link"><b>저녁식단 보러가기</b></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>