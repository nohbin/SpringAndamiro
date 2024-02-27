<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>레시피 등록</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/fileupload.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<style>
a {
	color: black;
	text-decoration: none;
}
li{
	list-style: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
var token = $("meta[name='_csrf']").attr('content');
var header = $("meta[name='_csrf_header']").attr('content');
	$(function(){
	    if(token && header) {
	        $(document).ajaxSend(function(event, xhr, options) {
	            xhr.setRequestHeader(header, token);
	        });
	    }
		fetchCategories();
		
		$('.image-upload-wrap').bind('dragover', function () {
	        $(this).addClass('image-dropping');
	    });
	$('.image-upload-wrap').bind('dragleave', function () {
	        $(this).removeClass('image-dropping');
	    });
		 
	})
			 
	 function fetchCategories() {
        $.ajax({
            url: '/api/getCategories', 
            type: 'post',
            dataType: 'json',
            success: function (data) {
            	console.log(data)
            	var recipeKindSelect = $('.recipeKind');
            	recipeKindSelect.empty();
            	recipeKindSelect.append($('<option value="0" selected>종류</option>'));
            	var kindList = data.kindList;
            	kindList.forEach(function(item) {
            	    recipeKindSelect.append($('<option value="' + item.recipeKindId + '">' + item.recipeKind + '</option>'));
            	    console.log(item.recipeKind);
            	});

            	var recipeHowSelect = $('.recipeHow');
            	recipeHowSelect.empty();
            	recipeHowSelect.append($('<option value="0" selected>방법</option>'));
            	var howList = data.howList;
            	howList.forEach(function(item) {
            	    recipeHowSelect.append($('<option value="' + item.recipeHowId + '">' + item.recipeHow + '</option>'));
            	});
            	
            	var mainIngreSelect = $('.recipeMainIngre');
            	mainIngreSelect.empty();
            	mainIngreSelect.append($('<option value="0" selected>주 재료</option>'));
            	var mainIngreList = data.mainIngreList;
            	mainIngreList.forEach(function(item) {
            	    mainIngreSelect.append($('<option value="' + item.recipeIngreId + '">' + item.recipeIngre + '</option>'));
            	});
            },
            error: function (xhr, status, error) {
                // 에러 처리
                alert("데이터 안불러와지는중")
            }
        });
    }
	
	 function readURL(input) {
     	event.stopPropagation();
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
     	event.stopPropagation();
         let $upload = $(button).closest('.file-upload');
         let $uploadContent = $upload.find('.file-upload-content');
         let $uploadImage = $uploadContent.find('.file-upload-image');
         
         // 이미지 초기화
         $uploadImage.attr('src', '#');
         $uploadContent.hide();
     }
     
     function addIngredient() {
			event.stopPropagation();
		    let ingredientCount = $('.ingre-input').length; // 초기 재료 개수
		
		    if (ingredientCount >= 12) {
		        // 최대 개수인 경우 처리할 내용
		        return;
		    }
		
		    const lastIngredientContainer = $('.ingredient-container:last');
		    const newIngredientContainer = lastIngredientContainer.clone();
		
		    const newInputs = newIngredientContainer.find('.ingre-input input');
		
		    newInputs.each(function (index, input) {
		        const newName = 'ingre' + (ingredientCount + index + 1);
		        $(input).attr('name', newName);
		    });
		
		    newIngredientContainer.insertAfter(lastIngredientContainer);
		    newIngredientContainer.find('.title-ingredient').empty();
		    newIngredientContainer.find('input').val('');
		
		    ingredientCount += newInputs.length; // 새로운 재료 개수만큼 증가
		}

</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container border my-3 rounded-5 text-center recipe-reg">
        <div class="container mx-auto" style="width: 80%;">
            <div class="row">
                <div class="col-12 border-bottom" style="font-weight: 900; font-size: 2rem;">
                    <i class="bi bi-yin-yang"></i>
                    요리 등록
                </div>
            </div>
            <form action="recipe_reg" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	<input type="hidden" name="memberNumber" value="${memberNumber }">
            	<input type="hidden" name="userId" value="${id }">
                <div class="row my-3">
                    <!-- 요리 제목-->
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                       		요리 제목
                    </div>
                    <div class="col-12 col-md-6 form-floating my-3 col-sm align-self-center">
                        <input type="text" class="form-control" id="floatingInput" placeholder="floatingName" name = "recipeName">
                        <label for="floatingInput">&nbsp;&nbsp; 예) 맛있는 제육볶음</label>
                    </div>
                    <div class="file-upload col-12 col-md-2">
                        <div class="image-upload-wrap">
                            <div class="drag-text">
                                <input class="file-upload-input" type='file' onchange="readURL(this);" name="mainPicture" accept="image/*" value="메인 사진 등록"/>
                               	 	메인 <br>사진 등록
                            </div>
                        </div>
                        <div class="file-upload-content">
                            <img class="file-upload-image"/>
                            <div class="image-title-wrap">
                                <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--요리 소개-->
                <div class="row">
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                        	요리 소개
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name ="recipeDiscription"
                                style="height: 100px"></textarea>
                            <label for="floatingTextarea2">예) 자취시절 하루 3번 만들어 먹은 제육볶음</label>
                        </div>
                    </div>
                </div>
                <div class="row recipe-tag ">
                    <div class="col-12 col-md-4 align-self-center my-3 title-ingredient" style="font-size: 1.5rem;">
                        	태그 등록
                    </div>
                    <c:forEach begin="1" end="3" var="index">
	                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
	                        <input type="text" class="form-control" id="floatingInput" name="recipetag${index }">
	                        <label for="floatingInput">&nbsp;&nbsp;예) #나들이</label>
	                    </div>
                    </c:forEach>
                    
                </div>
                <!-- 카테고리 -->
                <div class="row">
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                   		카테고리
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select recipeKind" id="floatingSelect recipeKind" name="recipeKind" >
                            <!-- DB 에서 받아온 값 AJAX 처리 -->
                        </select>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select recipeHow" id="floatingSelect recipeHow" name = "recipeHow">
                             <!-- DB 에서 받아온 값 AJAX 처리 -->
                        </select>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select recipeMainIngre" id="floatingSelect recipeMainIngre" name = "recipeMainIngre">
                            <!-- DB 에서 받아온 값 AJAX 처리 -->
                        </select>
                    </div>
                    <!--요리 정보-->
                    <div class="col-12 col-md-4 align-self-center my-3 " style="font-size: 1.5rem;">
                   		요리정보
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "recipeforperson">
                            <option value ="0" selected>인원</option>
                            <option value="1인분">1인분</option>
                            <option value="2인분">2인분</option>
                            <option value="3인분">3인분</option>
                            <option value="4인분">4인분</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "recipefortime">
                            <option value ="0" selected>시간</option>
                            <option value="10분">10분</option>
                            <option value="20분">20분</option>
                            <option value="30분">30분</option>
                            <option value="40분">40분</option>
                            <option value="50분">50분</option>
                            <option value="60분">60분</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "recipeforlevel">
                            <option selected>난이도</option>
                            <option value="아무나">아무나</option>
                            <option value="초급">초급</option>
                            <option value="중급">중급</option>
                            <option value="고급">고급</option>
                            <option value="요리사">요리사</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                </div>
                <!--재료 등록-->
                <div class="row ingredient-container">
				    <!-- 기본 재료 입력 -->
				    <div class="col-12 col-md-4 align-self-center my-3 title-ingredient" style="font-size: 1.5rem;">
				        	재료 등록
				    </div>
				    <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				        <input type="text" class="form-control" id="floatingInput" name="ingre1">
				        <label for="floatingInput">&nbsp;&nbsp;예) 소금 1T</label>
				    </div>
				    <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				        <input type="text" class="form-control" id="floatingInput" name="ingre2">
				        <label for="floatingInput">&nbsp;&nbsp;예) 소금 1T</label>
				    </div>
				    <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				        <input type="text" class="form-control" id="floatingInput" name="ingre3">
				        <label for="floatingInput">&nbsp;&nbsp;예) 소금 1T</label>
				    </div>
				</div>

				<!-- 추가 버튼 -->
				<div class="col-12 mt-3 mb-5">
				    <button type="button" class="btn btn-warning btn_add_ingredient" onclick="addIngredient()">재료 추가하기 (*최대 12개)</button>
				</div>
				
                <div class="row">
                    <div class="col-12 border-bottom" style="font-size: 2rem; font-weight: 900;">
                        <i class="bi bi-card-image"></i>
                      	  	조리 방법 등록
                    </div>
                </div>
                <c:forEach begin="1" end="5" var="index">
	                <div class="row steps-container">
	                    <div class="row step-container">
	                        <div class="col-12 col-md-4 align-self-center my-3 order-step" style="font-size: 1.5rem;">
	                            Step ${index }
	                        </div>
	                        <div class="col-12 col-md-6 form-floating my-3 col-sm align-self-center describe-order">
	                            <input type="text" class="form-control" placeholder="예) 오이를 자릅니다" name="order${index }">
	                            <label>&nbsp;&nbsp; 예) 재료를 준비합니다</label>
	                        </div>
	                        <div class="file-upload col-12 col-md-2">
	                            <div class="image-upload-wrap">
	                                <div class="drag-text">
	                                    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="pic${index }" />
	                                   		 요리 과정 <br>사진 등록
	                                </div>
	                            </div>
	                            <div class="file-upload-content">
	                                <img class="file-upload-image" alt="your image"/>
	                                <div class="image-title-wrap">
	                                    <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                <!-- 사진등록 끝-->
                 <div class="col-12 mt-3 mb-5">
                    <button type="submit" class="btn btn-warning btn_add_ingredient">등록하기</button>
                    <button type="reset" class="btn btn-danger btn_add_ingredient">취소하기</button>
                </div> 
            </form>
        </div>
    </div> 
    <!-- recipe-reg 엔딩 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>