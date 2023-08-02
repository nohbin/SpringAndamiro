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
</head>
<body>
<div class="container my-5">
        <ul class="nav nav-tabs">
            <li class="nav-item mynav-item">
                <a class="nav-link" aria-current="page" href="<c:url value="/BoardServlet?command=board_paging&page=1"/>" style="text-decoration: none;  color: inherit">회원관리</a>
            </li>
            <li class="nav-item  mynav-item">
                <a class="nav-link" href="<c:url value="/admin/subscribe/submemList"/>" style="text-decoration: none; color: inherit">구독회원 관리</a>
            </li>
            <li class="nav-item  mynav-item">
                <a class="nav-link" href='<c:url value="/AdminServlet?command=recipe_list_view&page=1"/>' style="text-decoration: none;  color: inherit">레시피관리</a>
            </li>
            <li class="nav-item  mynav-item">
                <a href='<c:url value="/admin/diet/dietList"/>' class="nav-link"  style="text-decoration: none;  color: inherit">식단관리</a>
            </li>
            <li class="nav-item  mynav-item">
                <a href='<c:url value="/admin/diet/dietDetailList"/>' class="nav-link" style="text-decoration: none;  color: inherit">식단상세 관리</a>
            </li>
            <li class="nav-item  mynav-item">
                <a class="nav-link" href="EventServlet?command=event_list" style="text-decoration: none;  color: inherit">이벤트관리</a>
            </li>

        </ul>
    </div>
</body>
</html>