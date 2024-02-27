<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/join.css">
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

label[for=name] button {
	color: rebeccapurple;
}
</style>
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="container mt-5">
		<div class="input-form-backgroud row mx-auto" style="width: 300px;">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 text-center">회원가입</h4>
				<h6>* 표시는 필수 입력 칸 입니다.</h6>
				<form class="validation-form" action="/member/signup" method="post" novalidate accept-charset="utf-8" >
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="row">
						<div class="col-12 mb-3">
							<label for="name">아이디(*)</label> 
							<input type="text" class="form-control" id="id" name="id" placeholder="" value="" required oninput="checkId()">
							<b class="id_ok " style="color: black; display:none;" >사용 가능한 아이디 입니다.</b>
							<b class="id_already invalid-feedback" style="color: red; display:none;" >이미 가입된 회원 입니다.</b>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-12 mb-3">
							<label for="name">비밀번호(*)</label> 
							<input type="password" class="form-control" id="password" name="pwd" placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-12 mb-3">
							<label for="name">비밀번호 확인(*)</label> 
							<input type="password" class="form-control" id="passwordconfirm" placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호 확인 을 입력해주세요.</div>
						</div>
						<div class="col-12 mb-3">
							<label for="name">이름(*)</label> 
							<input type="text" class="form-control" id="name" name = "name" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-12 mb-3">
							<label for="name">연락처(*)</label> 
							<input type="text" class="form-control" id="phone" name="phone" placeholder="" value="" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
						<div class="col-12 mb-3">
							<label for="name">이메일(*)</label> 
							<input type="email" class="form-control" id="email" name="email" placeholder="" placeholder="you@example.com" value="" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
					</div>

					<hr class="mb-4">
					<div class="custom-control custom-checkbox text-center">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label><br>
						<button class="btn btn-lg btn-block mt-3" style="background-color: #fac279;" type="submit" onclick="return validateForm()">가입 완료</button>
					</div>
					<div class="mb-5"></div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
			function checkId() {
				var id = $('#id').val();
				
				$.ajax({
					url: "/member/idCheck",
					type:"POST",
					data:{id:id},
					dataType:'json',
					beforeSend : function(xhr){
		                xhr.setRequestHeader(header, token);
		            },
					success:function(count){
						if(count != 1 && id.length > 0){
							$('.id_ok').css("display","inline-block")
							$('.id_already').css("display","none")
						}else if(count == 1 && id.length > 0){
							$('.id_ok').css("display","none")
							$('.id_already').css("display","inline-block")
						}else{
							$('.id_ok').css("display","none")
							$('.id_already').css("display","none")
						}
					},
					error:function(requset, error){
						alert("에러 발생");
					}
				});	
			};
			
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
	

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>