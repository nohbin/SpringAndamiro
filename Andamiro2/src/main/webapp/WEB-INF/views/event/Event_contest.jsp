<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h6 style="font-size: 25px;">
			<br>2023-공모전</h6>
		
		<hr>
		<br>
<div class="container">
    <div style="text-align: center;">
        <img src="resources/img/${gang.poster}" width="60%" height="auto" role="img" aria-label="베너" />
        <hr />

       <button type="button" class="btn btn-warning btn-lg-3" onclick="location.href='EventServlet?command=contest_recipewrite'">참여하기</button>
        <button type="button" class="btn btn-warning btn-lg-3">공유하기</button>
    </div>
</div>


	<bottom> <br>
	<br>
	<br>
	<div class="album py-5 bg-light">
		<div class="container">
			<a href="EventServlet?command=contest_moreview">
				<button type="button" class="btn btn-light   style=" color:
					black; border-radius: 1px; text-align:start; font-weight: 200;">
					<b style="font-size: 18px;">다른 참여자 레시피 보러가기!!</b>
				</button>
				<br>
			<br>
			</a>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<br>
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="225" role="img">

						<div class="card-body">
							<p class="card-text" _msttexthash="930531654" _msthash="16"
								style="direction: ltr; text-align: left;"></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9189752" _msthash="17" style="direction: ltr;">id</button>
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9733568" _msthash="18" style="direction: ltr;">♥</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="225" role="img">

						<div class="card-body">
							<p class="card-text" _msttexthash="930531654" _msthash="16"
								style="direction: ltr; text-align: left;"></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9189752" _msthash="17" style="direction: ltr;">id</button>
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9733568" _msthash="18" style="direction: ltr;">♥</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card shadow-sm">
						<img class="bd-placeholder-img card-img-top" width="100%"
							height="225" role="img">

						<div class="card-body">
							<p class="card-text" _msttexthash="930531654" _msthash="16"
								style="direction: ltr; text-align: left;"></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9189752" _msthash="17" style="direction: ltr;">id</button>
									<button type="button" class="btn btn-sm btn-outline-secondary"
										_msttexthash="9733568" _msthash="18" style="direction: ltr;">♥</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</bottom>

	<jsp:include page="../footer.jsp"></jsp:include>



</body>
</html>