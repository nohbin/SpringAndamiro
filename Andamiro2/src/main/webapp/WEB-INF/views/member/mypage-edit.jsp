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

	<div class="container mt-5">
        <div class="input-form-backgroud row mx-auto" style="width: 300px;">
            <div class="input-form col-md-12 mx-auto">
                <h3 class="mb-3 text-center">회원 정보 수정</h3>
                <h5> * 표시는 필수 입력 칸 입니다.</h5>
                <form class="validation-form" action="MemberServlet" method="post" novalidate accept-charset="utf-8" >
					<input type="hidden" name="command" value="member_edit">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label for="name">이름(변경 불가)</label>
                            <input type="text" class="form-control" id="name" placeholder="" value=" ${loginUser.name }" readonly>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="name">이메일(변경불가)</label>
                            <input type="email" class="form-control" id="email" placeholder="" placeholder="test@sample.com" value="${loginUser.email }" readonly>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="name">아이디</label>
                            <div class="input-group">
                            <input type="hidden" name="originalId" value="${loginUser.id }">
                            <input type="hidden" name="membernumber" value="${loginUser.memberNumber }">
		                       <c:set var="id" value="${param.id}"></c:set>
                               <c:choose>
									<c:when test="${not empty id}">
										<input type="text" class="form-control" id="id" name="changeid" placeholder="" value="${id}" required readonly>
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" id="id" name="id" placeholder="" value="${loginUser.id }" required readonly>	
									</c:otherwise>
								</c:choose>
	                            <div class="input-group-append">
									<input class="btn" style="background-color: #fac279;" type="button" value="중복확인" onclick="open_win('MemberServlet?command=member_Idcheck_form','edit')" required>
								</div>
								<script type="text/javascript">
									function open_win(url, name) {
										window.open(url, name, 'width=500, height=230 left =600 top = 250');
									}
								</script>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="name">비밀번호(*)</label>
                            <input type="password" class="form-control" id="password" name ="pwd" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                비밀번호를 입력해주세요.
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="name">비밀번호 확인(*)</label>
                            <input type="password" class="form-control" id="passwordconfirm" placeholder="" value=""
                                required>
                            <div class="invalid-feedback">
                                비밀번호 확인 을 입력해주세요.
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="name">연락처(*)</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="" value="${loginUser.phone }" required>
                            <div class="invalid-feedback">
                                연락처를 입력해주세요.
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox text-center">
                        <input type="checkbox" class="custom-control-input" id="aggrement" required>
                        <label class="custom-control-label " for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                        <div class="invalid-feedback">
                            개인정보 수집 및 이용 동의에 체크 해주세요.
                        </div><br>
                        <button class="btn btn-lg btn-block mt-3" style="background-color: #fac279;" type="submit" onclick="return validateForm()">수정 완료</button>
                    </div>
                    <div class="mb-5"></div>
                </form>
            </div>
        </div>
        <script>
		    function validateForm() {
		        const form = document.querySelector('.validation-form');
		        const password = document.getElementById('password').value;
		        const passwordConfirm = document.getElementById('passwordconfirm').value;
		
		        if (password !== passwordConfirm) {
		            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		            return false;
		        }
		
		        if (form.checkValidity() === false) {
		            event.preventDefault();
		            event.stopPropagation();
		        }
		
		        form.classList.add('was-validated');
		    }
		</script>
    </div>
	


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>