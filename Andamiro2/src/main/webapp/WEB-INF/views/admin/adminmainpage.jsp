<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css?ver=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<script src="resources/js/bootstrap.bundle.min.js?ver=1"></script>
<style>
li {
	list-style: none;
}
a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	

	<jsp:include page="adminheader.jsp"></jsp:include>

    <div style="height: 3rem;"></div>
    <div class="container">
        <div class="container d-flex flex-wrap justify-content-center">
            <form class="d-flex" role="search" action="#">
                <input class="form-control me-2" type="text" placeholder="검색어를 입력하세요." aria-label="Search"
                    style="width: 20rem;">
                <button class="btn btn-outline-secondary" type="submit">검색</button>
            </form>
        </div>
    </div>
    <div style="height: 3rem;"></div>
    <div class="container">
    총 회원 : ${totalRows }
        <table class="table text-center border">
            <thead>
                <tr>
                    <th scope="col">회원 번호</th>
                    <th scope="col">회원 아이디</th>
                    <th scope="col">회원 이름</th>
                    <th scope="col">회원 연락처</th>
                    <th scope="col">회원 이메일</th>
                    <th scope="col">회원 가입일</th>
                    <th scope="col">구독 여부</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="member" items="${memberList }" varStatus="status">
	                <tr>
	                    <td>${member.memberNumber }</td>
	                    <td>${member.id }</td>
	                    <td>${member.name }</td>
	                    <td>${member.phone }</td>
	                    <td>${member.email }</td>
	                    <td>${member.joinDate }</td>
	                    <td>${member.subscribe }</td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="d-flex justify-content-center">
	        <nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link ${currentPage == 1 ? 'disabled' : '' }" href="BoardServlet?command=board_paging&page=${currentPage - 1 }" aria-label="이전" tabindex="-1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${totalPages }" varStatus="status">
						<li class="page-item">
							<a class="page-link" href="BoardServlet?command=board_paging&page=${status.count }">${status.count }</a>
						</li>
					</c:forEach>
					<li class="page-item">
						<a class="page-link ${currentPage == totalPages ? 'disabled' : '' }" href="BoardServlet?command=board_paging&page=${currentPage + 1 }" aria-label="다음">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
    	</div>
    </div>
    
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>