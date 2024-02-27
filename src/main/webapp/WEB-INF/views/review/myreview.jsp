<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css?ver=1">
<link rel="stylesheet" href="../resources/css/main.css?ver=1">
<script src="resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">

<script src="js/bootstrap.bundle.js"></script>
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
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../member/mypage-menu.jsp"></jsp:include>

	<!-- 내 레시피 목록 -->
	<div class="container text-center border mt-3 rounded-5">

		<section class="container">
			<table class="table justify-content-center mt-5 mb-5">
				<thead>
					<tr class="border-2 mt-3 ">
						<th scope="col">레시피</th>
						<th scope="col">레시피 제목</th>
						<th scope="col">후기</th>
						<th scope="col">받은 평점</th>
						<th scope="col">작성일</th>
						<th scope="col">수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${reviewList}">
						<tr>
							<th scope="row"><a href="recipe_Detail.html"><br>${review.recipeId }</a></th>
							<td class=""><b>${review.recipeName }</b></td>
							<td>${review.review }</td>
							<td><b> ${review.recipegrade }점</b></td>
							<td>${review.regdate}</td>
							<td>
								<button class="btn btn-primary" type="button" value="delete" onclick="window.location.href='ReviewServlet?command=myreview_delete&num=${review.reviewNum}'">
									삭제
								</button>
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal"
									data-bs-target="#staticBackdrop_${review.recipeId}"
									onclick="handleButtonClick(${review.recipeId})">수정</button>
								<form action="ReviewServlet?command=myreview_update" method="post" enctype="multipart/form-data">
									<input type="hidden" name="memberId" value="${loginUser.id }">
									<input type="hidden" name="recipeid" value="${review.recipeId}">
									<input type="hidden" name = "reviewnum" value="${review.reviewNum }">
									<!--후기 작성 form -->
									<!-- 모달 -->
									<div class="modal fade" id="staticBackdrop_${review.recipeId}"
										data-bs-backdrop="static" data-bs-keyboard="false"
										tabindex="-1"
										aria-labelledby="staticBackdropLabel_${review.recipeId}"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5"
														id="staticBackdropLabel_${review.recipeId}">
														<b>작성자 : [${loginUser.id }] 님</b>
													</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="form-floating w-50 mx-auto mb-2">
														<select class="form-select" id="floatingSelect_${review.recipeId}" aria-label="Floating label select example" name="recipegrade">
															<c:forEach begin="0" end="4" varStatus="status">
																<option value="${status.count}" ${status.count eq review.recipegrade ? 'selected' : ''}>${status.count}</option>
															</c:forEach>
														</select> 
														<label for="floatingSelect_${review.recipeId}">점수</label>
													</div>
													<div class="form-floating">
														<textarea class="form-control" placeholder="" id="floatingTextarea2_${review.recipeId}" style="height: 200px" name="review">${review.review }</textarea>
														<label for="floatingTextarea2_${review.recipeId}">레시피 후기를 입력해주세요</label>
													</div>
													<div class="file-upload col-12">
														<div class="image-upload-wrap">
															<div class="drag-text">
																<input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="img" /> 
																후기 <br>사진 등록
															</div>
														</div>
														<c:choose>
											                <c:when test="${not empty review.img}">
											                    <div class="file-upload-content" style="display: block;">
											                        <img class="file-upload-image" alt="your image" src="/img/${review.img}">
											                        <div class="image-title-wrap">
											                            <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
											                        </div>
											                    </div>
											                </c:when>
											                <c:otherwise>
											                <div class="file-upload-content">
											                        <img class="file-upload-image" alt="your image">
											                        <div class="image-title-wrap">
											                            <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
											                        </div>
											                    </div>
											                </c:otherwise>
										                </c:choose>
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
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>

		<script>
			var navLinks = document.querySelectorAll('.nav-link');
			navLinks.forEach(function(link) {
				link.addEventListener('mouseover', function() {
					navLinks.forEach(function(link) {
						link.classList.remove('active');
					});
					this.classList.add('active');
				});
			});
			
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						let $uploadContent = $(input).closest('.file-upload')
								.find('.file-upload-content');
						let $uploadImage = $uploadContent
								.find('.file-upload-image');
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

			$(document).ready(function() {
				$('.image-upload-wrap').bind('dragover', function() {
					$(this).addClass('image-dropping');
				});
				$('.image-upload-wrap').bind('dragleave', function() {
					$(this).removeClass('image-dropping');
				});
			});

			function handleButtonClick(recipeId) {

				console.log("Clicked button with recipeId:", recipeId);

			}
		</script>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>