<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/my.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <script>
    function showPopup() { window.open("pay","pop",
     "width=850, height=700, left=100, top=200");
    }
  </script> 
  <style>
    li{
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
 <div style="height: 4rem;"></div>
  <div class="container border border-warning rounded-3 my-3 p-3" style="width: 50rem;">
    <div class="container text-center mb-2" style="width: 17rem;">
      <div class="fs-4 rounded-2 fw-bold" style="background-color: #f7dd4ae1;">
        안다미로 구독 혜택
      </div>
    </div>
    <div class="container text-center fs-5 lh-3">
      매일 업데이트 되는 전문가가 구성한 식단 제공!<br>
      식단별 영양정보 제공 ! <br>
      레시피를 저장 기능 제공! <br>              
    </div>
  </div>  
  <div style="height: 2rem;"></div>
  <div class="container border border-warning rounded-3 my-3 p-3" style="width: 50rem;">
    <div class="container text-center mb-2" style="width: 10rem;">
      <div class="fs-4 rounded-2 fw-bold" style="background-color: #f7dd4ae1;">
        이용료 안내
      </div>
    </div>
    <div class="container text-center fs-5 lh-3">
      월 3300원의 가격으로 모든 혜택을 즐기세요!       
    </div>
  </div> 
  <div style="height: 2rem;"></div>
  <div class="container border border-warning rounded-3 my-3 p-3" style="width: 50rem;">
    <div class="justify-content-center row fs-5 rounded-2 fw-bold  mx-2 mb-2 px-2 " style="background-color: #f7dd4ae1; width: 10rem;" >
      구독 관련 Q&A 
    </div>
    <button class="accordion"> 1. '간단식단'이 무엇인가요?</button>
    <div class="panel ">
    <p>> 간단식단은 조리시간이 30분 이하인 음식으로 구성된 식단을 말합니다.</p>
    </div>

    <button class="accordion">2. 레시피 저장 기능이 무엇인가요?</button>
    <div class="panel">
    <p>> 레시피 저장기능은 즐겨 찾는 요리의 레시피를 저장할 수 있어 편리하게 레시피를 찾아볼 수 있는 기능입니다.</p>
    </div>

    <button class="accordion">3. 식단의 영양정보는 어디서 확인 가능하나요?</button>
    <div class="panel">
    <p>> 식단 메뉴 하단의 '식단별 영양정보'에서 확인할 수 있습니다. 선택한 메뉴별로 영양정보를 확인할 수 있습니다.</p>
    </div>
  </div>

  <div style="height: 2rem;"></div>
  <div class="container text-center">
    <input type="button" value="결제" onclick="showPopup()" class="btn btn-outline-warning btn-lg fw-bold fs-2" style="width: 20rem; text-decoration: none; color:  rgb(134, 77, 2);">
  </div>
  <div style="height: 2rem;"></div>
<jsp:include page="../footer.jsp"></jsp:include>
	<script>
      var acc = document.getElementsByClassName("accordion");
      var i;
    
      for (i = 0; i < acc.length; i++) {
          acc[i].addEventListener("click", function () {
              this.classList.toggle("activeMenu");
              var panel = this.nextElementSibling;
              if (panel.style.maxHeight) {
                  panel.style.maxHeight = null;
              } else {
                  panel.style.maxHeight = panel.scrollHeight + "px";
              }
          });
      }
    </script>
</body>
</html>