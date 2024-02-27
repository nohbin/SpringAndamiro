<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <link rel="stylesheet" href="../resources/css/join.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container" align="center">
    <div style="height: 5rem;"></div>
    <h1>이벤트 리스트</h1>
    <table class="table align-middle">
        <tr>
            <td colspan="5" style="border: white; text-align: right">
                <input type="button" value="이벤트 등록" class="btn btn-outline-warning" onclick="location.href='EventServlet?command=event_write_form'">
            </td>
        </tr>
        <tr class="text-center">
            <th>이벤트 번호</th>
            <th>기간</th>
            <th>진행여부</th>
            <th>이벤트 썸네일</th>
            
        </tr>
        <c:forEach var="allList" items="${allList}">
            <tr class="record text-center">
                <td class="fs-5">${allList.eventno}</td>
                <td class="fs-5">${allList.ing}</td>
                <td class="fs-5">${allList.term}</td>
                <td class="fs-5">
                   <a href="./EventServlet?command=event_view&eventno=${allList.eventno}">
    <img src="./resources/img/${allList.imgsum}" style="width:15rem; height:10rem;">
</a>

                </td>
                
                
            </tr>
        </c:forEach>
    </table>
</div>
<div style="height: 7rem;"></div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
