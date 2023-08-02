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
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/fileupload.css">
<script src="resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<style>
li {
	list-style: none;
}

a {
	color: black;
	text-decoration: none;
}

img {
	border-radius: var(- -bs-border-radius-2xl) !important;
}

.align-right {
	text-align: right;
}

a i {
	font-size: 3rem;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="recipe-wrap">
		<!--조리준비 Tab-->
		<div class="container border my-3 rounded-5 text-center recipe-show">
			<div class="container text-center mt-3 mb-3">
				<div class="row row-cols-12">
					<div class="col-12 mb-3 border-bottom h1 display-2">${recipe.recipeName }</div>
					<div class="col-12 mb-3 border-bottom h3 display-5">${recipe.recipeDetailVO.recipeDiscription }</div>
					<div class="col-12 col-md-6">
						<img src="/img/${recipe.mainPicture }" alt="" class="rounded-5 img-thumbnail">
					</div>
					<div class="col-12 col-md-6 align-self-center">
						<div class="row" style="font-weight: 700; font-size: 2rem;">
							<div class="col">
								<span class="col">${recipe.recipeDetailVO.recipeforperson }</span>
							</div>
							<div class="col">
								<span class="col">${recipe.recipeDetailVO.recipefortime }</span>
							</div>
							<div class="col">
								<span class="col">${recipe.recipeDetailVO.recipeforlevel }</span>
							</div>
						</div>
						<div class="container">
							<div class="title_ingre my-3" style="font-weight: 900; font-size: 2rem;">재료</div>
							<div class="ready_ingre mt-3">
								<ul class="row justify-content-between">
									<c:forEach var="recipeingre" items="${recipeIngreList }">
										<li class="col-5 border-bottom"><a class="float">${recipeingre }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container border my-3 rounded-5 text-center recipe-detail">
			<div class="row justify-content-center">
				<div class="col-sm-12 border-bottom h1 display-3 " style="color: orange">조리 순서</div>
			</div>
				<div class="d-flex justify-content-end">
					<c:if test="${not empty loginUser.subscribe }">
						<a href="SubscribeServlet?command=save_recipe&subNumber=${loginUser.subscribe }&recipeid=${recipe.recipeID}"> 
							<i class="bi bi-folder-plus"></i>
						</a>
					</c:if>
				</div>
				<div class="row">
					<div class="col-12">
						<c:forEach var="recipeOrder" items="${recipeOrderList}" varStatus="st">
							<div class="row align-items-center">
								<div class="col-12 col-md-6">
									<div id="stepdescr${st.index + 1}" class="step_sub">
										<i class="bi bi-${st.count}-circle h1" style="color: orange"></i>&nbsp;&nbsp;&nbsp;<span class="h2">${recipeOrder}</span>
									</div>
								</div>
								<div class="col-12 col-md-6 my-5">
								  	<c:if test="${st.index < recipePicList.size()}">
										<c:set var="recipePic" value="${recipePicList.get(st.index)}" />
										<div id="stepImg${st.index + 1}">
											<i class="bi bi-${st.count}-square display-4 mb-5" style="color: orange"></i><br><img src="/img/${recipePic}" class="img-fluid img-thumbnail mt-3" style="width: 30rem;">
										</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			<!--Recipe detail end-->
			<!--후기 보기-->
			<div class="container border my-3 rounded-5 text-center recipe-review">
				<div class="container text-center">
					<div class="row row-cols-2">
						<div class="col-12">
							<div class="p-5">
								<b class="h1 display-3" style="color: orange">요리후기</b>
							</div>
						</div>
					</div>
					<!-- 후기 리스트 -->
					<div class="container">
						 <table class="table table-hover">
							<tr>
								<td colspan="10" style="border: white; text-align: right">
							</tr>
							<tr class="text-center">
								<th>작성자</th>
								<th>후기</th>
								<th>평점</th>
								<th>사진</th>
							</tr>
						
						<c:forEach var="review" items="${reviewList }">
							<tr class="record text-center">
								<td>${review.userId }</td>
								<td>${review.review}</td>  
								<td>${review.recipegrade }</td>
								<td><img src="/img/${review.img}" class="rounded-3 img-thumbnail" style=" width: 5rem;"></td>
								
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- 후기 end-->
				<!--후기 작성 form -->
				<c:if test="${not empty loginUser }">
					<button type="button" class="btn btn-outline-success mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						후기 작성
					</button>
				</c:if>
				<!-- 모달 -->
			<form action="ReviewServlet?command=review_write" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memberId" value="${loginUser.id }">
            	<input type="hidden" name="recipeid" value="${recipe.recipeID}">
            	<input type="hidden" name="recipename" value="${recipe.recipeName }">
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">
									<b>작성자 : [${loginUser.id }] 님</b>
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="form-floating w-50 mx-auto mb-2">
									<select class="form-select" id="floatingSelect" aria-label="Floating label select example" name = "grade">
										<option selected>점수</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select> <label for="floatingSelect">점수</label>
								</div>
								<div class="form-floating">
									<textarea class="form-control" placeholder="" id="floatingTextarea2" style="height: 200px" name = "reviewtext"></textarea>
									<label for="floatingTextarea2">레시피 후기를 입력해주세요</label>
								</div>
								<div class="file-upload col-12">
									<div class="image-upload-wrap">
										<div class="drag-text">
											<input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="reviewImage" /> 
											후기 <br>사진 등록
										</div>
									</div>
									<div class="file-upload-content">
										<img class="file-upload-image" />
										<div class="image-title-wrap">
											<button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
										</div>
									</div>
								</div>
							</div>
							<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-secondary">작성하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                   let $uploadContent = $(input).closest('.file-upload').find('.file-upload-content');
                   let $uploadImage = $uploadContent.find('.file-upload-image');
                   $uploadContent.show();
                   $uploadImage.attr('src', e.target.result);
               };
               reader.readAsDataURL(input.files[0]);
           } else {
               removeUpload(input);
           }
       }

       function removeUpload(button) {
       
           let $upload = $(button).closest('.file-upload');
           let $uploadContent = $upload.find('.file-upload-content');
           let $uploadImage = $uploadContent.find('.file-upload-image');
           
           // 이미지 초기화
           $uploadImage.attr('src', '#');
           $uploadContent.hide();
       }

       $(document).ready(function () {
           $('.image-upload-wrap').bind('dragover', function () {
               $(this).addClass('image-dropping');
           });
           $('.image-upload-wrap').bind('dragleave', function () {
               $(this).removeClass('image-dropping');
           });
       });
   </script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>