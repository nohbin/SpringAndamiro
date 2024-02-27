<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/my.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <style>
    li{
      list-style: none;
    }
    a {
            color: black;
            text-decoration: none;
        }
	.dietImg {
		overflow: hidden;
	}
	
	.dietImg img {
		width: 25rem; height: 20rem;	
		transition: transform 0.3s ease;
	}
	
	.dietImg:hover img {   
		transform: scale(1.2);
	}        
  </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container border mt-3 rounded-3 w-50">
		<ul class="nav nav-pills nav-fill row">
			<li class="nav-item col-12 col-md-3">
			<a class="nav-link" style="color: black;" aria-current="page" href='<c:url value="SubDietServlet?command=rec_diet"/>'>
				추천식단
			</a>
			</li>
			<li class="nav-item col-12 col-md-3"><a class="nav-link " style="color: black;" aria-current="page" href='<c:url value="SubDietServlet?command=simpleDiet"/>'>
				간단식단
			</a>
			</li>
			<li class="nav-item col-12 col-md-3"><a class="nav-link" style="color: black;" aria-current="page" href='<c:url value="SubDietServlet?command=lowDiet"/>'>
				저칼로리식단
				</a>
			</li>
			<li class="nav-item col-12 col-md-3"><a class="nav-link active" style="color: black;" aria-current="page"href='<c:url value="SubDietServlet?command=proteinDiet"/>'>
				프로틴식단
			</a>
			</li>
		</ul>
	</div>
       <div style="height: 1rem;"></div>
		<div class="container">
			<div class="row">
				<div class="mb-3">
	 			  </div>
				 <c:forEach var="diet" items="${dietList}">
					<div class="col-12 col-md-4">
						<div class="text-center">
							<div class="fs-4 fw-bold mb-2" style="color: #e18409;">
								${diet.diet_menu}													
							</div>
							<div class="dietImg">
								<img src="/img/${diet.diet_picture}">	
							</div>
						</div>
					</div>
	 			  </c:forEach> 
	 			  <table>
	 			  	<tr>
	 			  		<td>
	 			  		<c:forEach var="dietDetailfood" items="${dietDetailList1}">
							<div>
								<div>
									<div class="fw-bold lh-base" style="margin-left:13rem;">
										${dietDetailfood.foodName}</div>
								</div>
							</div>
						</c:forEach>
						</td>
	 			  		<td>
	 			  		<c:forEach var="dietDetailfood" items="${dietDetailList2}">
							<div>
								<div>
									<div class="fw-bold lh-base" style="margin-left:13rem;">
										${dietDetailfood.foodName}</div>
								</div>
							</div>
						</c:forEach>	 			  		
	 			  		</td>
	 			  		<td>
	 			  		<c:forEach var="dietDetailfood" items="${dietDetailList3}">
							<div>
								<div>
									<div class="fw-bold lh-base" style="margin-left:13rem;">
										${dietDetailfood.foodName}</div>
								</div>
							</div>
						</c:forEach>	 			  		
	 			  		</td>
	 			  	</tr>
	 			  </table>
			</div>
		</div>	
		<!-- 여기까지  -->
		<div style="height: 2rem;"></div>
		<div class="container">
			 		<button type="button" class="btn btn-outline-success btn-sm"
					onclick="location.href='SubDietServlet?command=proteinDiet'">아침 식단
					</button>
					<button type="button" class="btn btn-outline-success btn-sm"
					onclick="location.href='SubDietServlet?command=proteinLunch'">점심 식단
					</button>
					<button type="button" class="btn btn-outline-success btn-sm"
					onclick="location.href='SubDietServlet?command=proteinDinner'">저녁 식단
					</button>
			<div class="row">
				<div class="col d-flex justify-content-between my-3">
					<span class="h4" style="font-weight: bold;">식단별 영양정보</span> <span>*1인분
						기준 영양정보 입니다.
					</span>
				</div>
			</div>
			<table class="table table-hover" style="height: 300px;">
				<thead class="table-primary text-center head">
					<tr>
						<td>음식명</td>
						<td>칼로리</td>
						<td>영양성분</td>
					</tr>
				</thead>
				<tbody class="table-secondary">
					<c:forEach var="dietDetail" items="${dietDetailList}">
					<tr>
						<td class="h5 border-end">${dietDetail.foodName}</td>
						<td class="h5 border-end">${dietDetail.kcal}</td>
						<td class="h5">${dietDetail.component}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>