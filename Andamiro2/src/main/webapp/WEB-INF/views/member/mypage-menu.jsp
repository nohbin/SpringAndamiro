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

	<div class="container border mt-3 rounded-3 w-50">
		<ul class="nav nav-pills nav-fill">
			<li class="nav-item">
				<a class="nav-link " style="color: black;" href='<c:url value="/MemberServlet?command=member_mypage&memberNumber=${loginUser.memberNumber }"/>'>내 레시피</a>
			</li>
			<li class="nav-item">
				<div class="dropdown">
					<a class="btn btn-secondary1 dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"> 요리 후기 </a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><a href="ReviewServlet?command=review">나의 요리 레시피</a></li>
						<li><a href="ReviewServlet?command=myreview">내가 남긴 후기</a></li>
					</ul>
				</div>
			</li>
			<c:if test="${not empty loginUser.subscribe }">
				<li class="nav-item"><a class="nav-link" style="color: black;"
					href='<c:url value="/SubscribeServlet?command=save_recipe_view&subNumber=${loginUser.subscribe }"/>'>저장
						레시피</a></li>
			</c:if>
			<li class="nav-item"><a class="nav-link" style="color: black;"
				href='<c:url value="/MemberServlet?command=mypage_edit&memberNumber=${loginUser.memberNumber }"/>'>회원정보
					수정</a></li>
		</ul>
	</div>

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
	</script>
</body>
</html>