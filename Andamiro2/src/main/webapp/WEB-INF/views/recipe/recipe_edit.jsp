<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/fileupload.css">
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
            <form action="RecipeServlet?command=recipe_edit" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="userid" value="${loginUser.id }">
            	<input type="hidden" name="recipeId" value="${recipe.recipeID }">
                <div class="row my-3">
                    <!-- 요리 제목-->
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                        요리 제목
                    </div>
                    <div class="col-12 col-md-6 form-floating my-3 col-sm align-self-center">
                        <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name = "name" value="${recipe.recipeName }">
                        <label for="floatingInput">&nbsp;&nbsp; 예) 맛있는 제육볶음</label>
                    </div>
                    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
                    <div class="file-upload col-12 col-md-2">
                        <div class="image-upload-wrap">
                            <div class="drag-text">
                                <input class="file-upload-input"  type='file' onchange="readURL(this);" name="mainpic" accept="image/*" value=""/>
                                메인 <br>사진 등록
                            </div>
                        </div>
                        <div class="file-upload-content" style="display: block;">
                            <img class="file-upload-image" src="/img/${recipe.mainPicture }"/>
                            <div class="image-title-wrap">
                                <button type="button" onclick="removeUpload(this)" class="remove-image">삭제</button>
                            </div>
                        </div>
                    </div>
                    <script>

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

                        $(document).ready(function () {
                            $('.image-upload-wrap').bind('dragover', function () {
                                $(this).addClass('image-dropping');
                            });
                            $('.image-upload-wrap').bind('dragleave', function () {
                                $(this).removeClass('image-dropping');
                            });
                        });
                    </script>
                </div>
                <!--요리 소개-->
                <div class="row">
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                        요리 소개
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name ="discription"
                                style="height: 100px">${recipe.recipeDetailVO.recipeDiscription }</textarea>
                            <label for="floatingTextarea2">예) 자취시절 하루 3번 만들어 먹은 제육볶음</label>
                        </div>
                    </div>
                </div>
                <div class="row recipe-tag ">
                    <div class="col-12 col-md-4 align-self-center my-3 title-ingredient" style="font-size: 1.5rem;">
                        태그 등록
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <input type="text" class="form-control" id="floatingInput" name="tag1" value="${recipe.recipetag1 }">
                        <label for="floatingInput">&nbsp;&nbsp;예) #나들이</label>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <input type="text" class="form-control" id="floatingInput" name="tag2" value="${recipe.recipetag2 }">
                        <label for="floatingInput">&nbsp;&nbsp;예) #자취</label>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <input type="text" class="form-control" id="floatingInput" name="tag3" value="${recipe.recipetag3 }">
                        <label for="floatingInput">&nbsp;&nbsp;예) #맛있다</label>
                    </div>
                    
                </div>
                <!-- 카테고리 -->
                <div class="row">
                    <div class="col-12 col-md-4 align-self-center my-3" style="font-size: 1.5rem;">
                        카테고리
                    </div>
                    <!-- 레시피 종류 카테고리  -->
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name="kind">
                        	<option value ="0" >종류</option>
						    <c:forEach items="${recipeKindList}" var="kind" varStatus="status">
						        <c:choose>
						            <c:when test="${recipe.recipeDetailVO.recipeKind == kind.recipeKindId}">
						                <option value="${kind.recipeKindId}" selected="selected">${kind.recipeKind}</option>
						            </c:when>
						            <c:otherwise>
						                <option value="${kind.recipeKindId}">${kind.recipeKind}</option>
						            </c:otherwise>
						        </c:choose>
						    </c:forEach>
                        </select>
                    </div>
                    <!-- 레시피 방법 카테고리  -->
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "how">
                            <option value ="0" >방법</option>
                            <c:forEach items="${recipeHowList}" var="how" varStatus="status">
                           	 <c:choose>
	                            <c:when test="${recipe.recipeDetailVO.recipeHow == how.recipeHowId}">
	                            	<option value="${how.recipeHowId }" selected="selected"> ${how.recipeHow } </option>
	                            </c:when>
                            	<c:otherwise>
                            		<option value="${how.recipeHowId }">${how.recipeHow }</option>
                            	</c:otherwise>
                            	</c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <!-- 레시피 주재료 카테고리 -->
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "mainIngre">
                            <option value ="0" selected>주 재료</option>
                             <c:forEach items="${recipeMainIngreList}" var="mainIngre" varStatus="status">
                             <c:choose>
	                            <c:when test="${recipe.recipeDetailVO.recipeMainIngre == mainIngre.recipeIngreId}">
	                            	<option value="${mainIngre.recipeIngreId }" selected="selected"> ${mainIngre.recipeIngre } </option>
	                            </c:when>
                            	<c:otherwise>
                            		<option value="${mainIngre.recipeIngreId }"> ${mainIngre.recipeIngre } </option>
                            	</c:otherwise>
                            	</c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <!--요리 정보-->
                    <div class="col-12 col-md-4 align-self-center my-3 " style="font-size: 1.5rem;">
                        요리정보
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
					    <select class="form-select" id="floatingSelect" name="person">
					        <option value="0" ${recipe.recipeDetailVO.recipeforperson eq '0' ? 'selected' : ''}>인원</option>
					        <option value="1인분" ${recipe.recipeDetailVO.recipeforperson eq '1인분' ? 'selected' : ''}>1인분</option>
					        <option value="2인분" ${recipe.recipeDetailVO.recipeforperson eq '2인분' ? 'selected' : ''}>2인분</option>
					        <option value="3인분" ${recipe.recipeDetailVO.recipeforperson eq '3인분' ? 'selected' : ''}>3인분</option>
					        <option value="4인분" ${recipe.recipeDetailVO.recipeforperson eq '4인분' ? 'selected' : ''}>4인분</option>
					        <option value="기타" ${recipe.recipeDetailVO.recipeforperson eq '기타' ? 'selected' : ''}>기타</option>
					    </select>
					</div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "time">
                            <option value ="0" selected>시간</option>
                            <option value="10분" ${recipe.recipeDetailVO.recipefortime eq '10분' ? 'selected' : ''}>10분</option>
                            <option value="20분" ${recipe.recipeDetailVO.recipefortime eq '20분' ? 'selected' : ''}>20분</option>
                            <option value="30분" ${recipe.recipeDetailVO.recipefortime eq '30분' ? 'selected' : ''}>30분</option>
                            <option value="40분" ${recipe.recipeDetailVO.recipefortime eq '40분' ? 'selected' : ''}>40분</option>
                            <option value="50분" ${recipe.recipeDetailVO.recipefortime eq '50분' ? 'selected' : ''}>50분</option>
                            <option value="60분" ${recipe.recipeDetailVO.recipefortime eq '60분' ? 'selected' : ''}>60분</option>
                            <option value="기타" ${recipe.recipeDetailVO.recipefortime eq '기타' ? 'selected' : ''}>기타</option>
                        </select>
                    </div>
                    <div class="form-floating col-12 col-md-2 my-3 align-self-center">
                        <select class="form-select" id="floatingSelect" name = "level">
                        
                            <option>난이도</option>
                            <option value="아무나" selected =${recipe.recipeDetailVO.recipeforlevel eq '아무나' ? 'selected' : ''}>아무나</option>
                            <option value="초급" selected =${recipe.recipeDetailVO.recipeforlevel eq '초급' ? 'selected' : ''}>초급</option>
                            <option value="중급" selected =${recipe.recipeDetailVO.recipeforlevel eq '중급' ? 'selected' : ''}>중급</option>
                            <option value="고급" selected =${recipe.recipeDetailVO.recipeforlevel eq '고급' ? 'selected' : ''}>고급</option>
                            <option value="요리사" selected =${recipe.recipeDetailVO.recipeforlevel eq '요리사' ? 'selected' : ''}>요리사</option>
                            <option value="기타" selected =${recipe.recipeDetailVO.recipeforlevel eq '기타' ? 'selected' : ''}>기타</option>
                        </select>
                    </div>
                </div>
                <!--재료 등록-->
                <div class="row ingredient-container">
				    <!-- 기본 재료 입력 -->
				    <div class="col-12 col-md-4 align-self-center my-3 title-ingredient" style="font-size: 1.5rem;">
				        재료 등록
				    </div>
				    <c:set var="recipeingre" value="${recipeIngreList }"/>
				    <c:forEach var="i" begin="0" end="11">
				    <c:choose>
				        <c:when test="${i < recipeingre.size()}">
				            <!-- 이미 요소가 존재하는 경우 -->
				            <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				                <input type="text" class="form-control" id="floatingInput" name="ingre${i + 1}" value="${recipeingre.get(i)}">
				                <label for="floatingInput">&nbsp;&nbsp;예) 소금 1T</label>
				            </div>
				        </c:when>
				        <c:otherwise>
				            <!-- 요소가 존재하지 않는 경우 -->
				            <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				                <input type="text" class="form-control" id="floatingInput" name="ingre${i + 1}" value="">
				                <label for="floatingInput">&nbsp;&nbsp;예) 소금 1T</label>
				            </div>
				        </c:otherwise>
				    </c:choose>
				    	<%-- 3번째 input 태그마다 줄 바꾸기 --%>
					    <c:if test="${(i + 1) % 3 == 0}">
					        <div class="w-100"></div>
					    	<div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				                <input type="hidden" class="form-control" id="floatingInput" >
				            </div> 
				            <div class="form-floating col-12 col-md-2 my-3 align-self-center ingre-input">
				                <input type="hidden" class="form-control" id="floatingInput" >
				            </div>
					    </c:if>
					</c:forEach>
				</div>

				<c:set var="picList" value="${recipePicList}" />
				<c:set var="orderList" value="${recipeOrderList}" />
				
				<c:set var="maxSize" value="${orderList.size() > picList.size() ? orderList.size() : picList.size()}" />
				
				<c:forEach var="i" begin="0" end="4">
			    <c:set var="order" value="${i < orderList.size() ? orderList.get(i) : ''}" />
			    <c:set var="pic" value="${i < picList.size() ? picList.get(i) : ''}" />
			    <div class="row steps-container">
			        <div class="row step-container">
			            <div class="col-12 col-md-4 align-self-center my-3 order-step" style="font-size: 1.5rem;">
			                Step ${i + 1}
			            </div>
			            <div class="col-12 col-md-6 form-floating my-3 col-sm align-self-center describe-order">
			                <input type="text" class="form-control" placeholder="예) 오이를 자릅니다" name="order${i + 1}" value="${order}">
			                <label>&nbsp;&nbsp; 예) 재료를 준비합니다</label>
			            </div>
			            <div class="file-upload col-12 col-md-2">
			                <div class="image-upload-wrap">
			                    <div class="drag-text">
			                        <input class="file-upload-input" type="file" onchange="readURL(this);" accept="image/*" name="pic${i + 1}" value="${pic }">
			                        요리 과정 <br>사진 등록
			                    </div>
			                </div>
			                <c:choose>
			                <c:when test="${not empty pic}">
			                    <div class="file-upload-content" style="display: block;">
			                        <img class="file-upload-image" alt="your image" src="/img/${pic}">
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
			    </div>
				</c:forEach>
                <!-- 사진등록 끝-->
                
                 <div class="col-12 mt-3 mb-5">
                    <button type="submit" class="btn btn-warning btn_add_ingredient">등록하기</button>
                    <button type="reset" class="btn btn-danger btn_add_ingredient">취소하기</button>
                </div> 
            </form>
        </div>
    </div> <!-- recipe-reg 엔딩 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>