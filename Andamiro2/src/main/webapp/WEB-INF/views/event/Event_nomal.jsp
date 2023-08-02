<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
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





	<div class="container">
		<div style="text-align: center;">


			<img src="resources/img/${eventvo.poster}" width="60%" height="auto"
				role="img" aria-label="베너" />
			<hr />


			<button type="button" class="btn btn-warning btn-lg-3">참여하기</button>
			<button type="button" class="btn btn-warning btn-lg-3">공유하기</button>
		</div>
	</div>
	



	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>