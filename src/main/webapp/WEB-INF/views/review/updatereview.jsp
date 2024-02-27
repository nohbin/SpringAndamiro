<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css?ver=1">
<link rel="stylesheet" href="../resources/css/main.css?ver=1">
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

.box {
	display: block;
	position: relative;
}

.review-wrab {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="review-wrab">
		<form action="ReviewServlet" method="post">
			<input type="hidden" name="command" value="myreview_update">
			<input type="hidden" name="num" value="${review.num}">
			<h1>리뷰 수정</h1>
			<div class="box">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디</h1>
			</div>
			<div class="box">
				<div class="box">
					<select class="box" id="floatingSelect"
						aria-label="Floating label select example" name="recipegrade">
						<option selected></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
			<div class="form-floating">
				<textarea class="box" placeholder="" id="floatingTextarea2"
					style="height: 200px" name="review">${review.review}</textarea>
				<label for="floatingTextarea2">후기를 입력</label>
			</div>
			<div class="box">
				<div class="box">
					<div class="box">
						<input class="box" type='file' onchange="readURL(this);"
							accept="image/*" name="review">${review.img} <br>사진
						등록
					</div>
				</div>
				<div class="box">
					<img class="box" src="#" alt="your image" />
					<div class="box">
						<button type="button"
							onclick="window.location.href='ReviewServlet?command=myreview_delete&num=${review.num}'"
							class="remove-image">삭제</button>
					</div>
				</div>
			</div>
			<div class="box">
				<button type="button" class="btn btn-secondary"
					onclick="closeWindow()">닫기</button>
				<input type="submit" value="수정" onclick="updateReview()">
			</div>

		</form>
	</div>



	<script>
        function updateReview() {
        	  window.opener.location.reload();
              window.close();   
    </script>
    <script>
    function closeWindow() {
        window.opener.location.reload();
        window.close();
    }       
    
    </script>
	<script>
                                    let uploadIndex = 1;

                                    function createImageUpload() {
                                        let uploadElement = `
                                        <div class="file-upload">
                                        <div class="image-upload-wrap">
                                        <div class="drag-text">
                                        <input class="file-upload-input" type="file" onchange="readURL(this);" accept="image/*" />
                                        사진 등록
                                        </div>
                                        </div>
                                        <div class="file-upload-content">
                                        <img class="file-upload-image" src="#" alt="your image" />
                                        <div class="image-title-wrap">
                                        <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
                                        </div>
                                        </div>
                                        </div>
                                        `;
                                        $('#image-uploads').append(uploadElement);
                                        uploadIndex++;
                                    }

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
                                    
                                    function open_win(url) {

                                        window.open(url, "_blank");
                                    }
                                </script>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
