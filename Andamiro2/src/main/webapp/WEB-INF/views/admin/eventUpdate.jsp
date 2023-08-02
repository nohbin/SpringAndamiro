<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>이벤트 수정</title>
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <link rel="stylesheet" href="../resources/css/join.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script type="text/javascript" src="script/board.js"></script>
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="container" align="center">
        <div style="height: 7rem;"></div>
        <h1 class="mb-3">이벤트 수정</h1>
        <form name="frm" method="post" action="EventServlet">
            <input type="hidden" name="command" value="event_update">
            <input type="hidden" name="eventno" value="${eno}">
            <div style="height: 5rem;"></div>
            <table class="table">
                <tr>
                    <th>이벤트 번호</th>
                    <td><input type="number" name="eventno" value="${eno.eventno}"></td>
                </tr>
                <th>이벤트 종류</th>
                <td>
                    <select name="eventkind">
                        <option value="공모전이벤트" ${eno.eventkind eq '공모전이벤트' ? 'selected' : ''}>공모전이벤트</option>
                        <option value="일반이벤트" ${eno.eventkind eq '일반이벤트' ? 'selected' : ''}>일반이벤트</option>
                        <!-- Add more options as needed -->
                    </select>
                </td>
                <tr>
                    <th>진행 여부</th>
                    <td>
                        <select name="ing">
                            <option value="진행중" ${eno.ing eq '진행중' ? 'selected' : ''}>진행중</option>
                            <option value="종료" ${eno.ing eq '종료' ? 'selected' : ''}>종료</option>
                            <option value="진행예정" ${eno.ing eq '진행예정' ? 'selected' : ''}>진행예정</option>
                            <!-- Add more options as needed -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td><input type="text" name="eventTerm" value="${eno.term}"></td>
                </tr>
                <tr>
                    <th>이벤트 썸네일</th>
                    <td><input type="file" name="eventImgsum" value="${eno.imgsum}"></td>
                </tr>
                <tr>
                    <th>이벤트 포스터</th>
                    <td><input type="file" name="eventPoster" value="${eno.poster}"></td>
                </tr>
            </table>
            <br> <br>
            <input type="submit" name="submit" value="등록">
            <input type="button" value="목록" onclick="location.href='EventServlet?command=event_list'">
        </form>
    </div>
    <div style="height: 7rem;"></div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>


