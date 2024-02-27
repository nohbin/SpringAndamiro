<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css?ver=1">
<link rel="stylesheet" href="./resources/css/main.css?ver=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap">
<body>
   <jsp:include page="../header.jsp"></jsp:include>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-5">
                <!-- Display event details here from the 'event' model attribute -->
                <h2>${event.title}</h2>
                <p>${event.description}</p>
                <!-- Add more details here as needed -->
            </div>
        </div>
    </section>

 <div class="container">
    <div class="row row-cols-1 row-cols-sm-3 row-cols-md-3 g-3 my-3">
        <c:forEach var="eventItem" items="${list}">
            <div class="col mb-5">
                <div class="card shadow-sm">
                    <c:choose>
                      
                        <c:when test="${eventItem.eventkind eq '공모전이벤트'}">
                            <!-- Event_contest.jsp로 이동하는 링크를 생성 -->
                             <a href="<c:url value='/Event_contest'/>?eventno=${eventItem.eventno}">
                                <!-- eventItem.imgsum을 사용하여 이미지를 출력 -->
                                <img src="resources/img/${eventItem.imgsum}" class="bd-placeholder-img card-img-top"
                                    width="100%" height="200" role="img" aria-label="베너" focusable="false" alt="왜안뜨냐?" />
                            </a>
                        </c:when>
                      
                        <c:otherwise>
                           
                          <a href="<c:url value='Event_nomal'/>?eventno=${eventItem.eventno}">
                              
                                <img src="resources/img/${eventItem.imgsum}" class="bd-placeholder-img card-img-top"
                                    width="100%" height="200" role="img" aria-label="베너" focusable="false" alt="왜안뜨냐?" />
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <p class="card-text">
                            <font style="vertical-align: inherit;" size="4px" color="black">${eventItem.ing}</font>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group"></div>
                            <small class="text-muted">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">${eventItem.eterm}</font>
                                </font>
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>



    <!-- Rest of the page content -->

    <jsp:include page="../footer.jsp"></jsp:include>>
</body>
</html>
