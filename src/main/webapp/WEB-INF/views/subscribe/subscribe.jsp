<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
          <div class="container" style="width: 45rem;">
            <div class="row text-center rounded-4 my-4" style="background-color: #ffee07a6;" >
              <div class="col pt-3 lh-2 fs-5">
                구독을 통해 안다미로 식탁의 모든 기능을 누릴 수 있습니다.<br>
                여러 종류의 식단을 영양정보와 함께 매일 제공하고 있습니다.<br>
                안다미로 구독 서비스와 함께 어렵게만 느껴졌던 요리를 즐겨보세요! 
              </div>
              <div class="row">
                <div class="col my-3">
                    <a href="/subscribe/subBtn" style="text-decoration: none; color: black;">  
	                  <button class="btn btn-outline-warning fw-bold" role="button">
                      구독하기
                      </button>
                    </a>
                </div>
              </div> 
            </div>  
          </div>
      </div>    
      <div class="container">
        <div class="row">
          <div class="col border border-warning rounded-3 p-4 mx-3">
            <div class="row">
              <img src="../resources/img/rew1.png" class="img-fluid2">
            </div>
            <div class="row fw-bold fst-italic mb-2">
              고객님의 사용후기__
            </div>
            <div class="row fs-6 lh-lg">
              안다미로 사이트를 이용한지는 꽤 되었지만 처음에는 구독을 하지 않아도 레시피를 볼 수 있어서 가입하지 않았습니다.
              그러다 자주 찾아보는 레시피를 요리할 때 레시피 저장 기능이 유용할 것 같아 구독 서비스를 이용하기 시작했습니다.<br>
              사용하고 보니 지금까지 몇 년 동안은 안다미로를 전혀 활용하지 못하고 있었다는 생각이 들었습니다.
              구독 서비스를 통해 더 많은 요리를 시도하고 새로운 음식을 탐험하는 즐거운 시간이 되고 있습니다.
            </div>
          </div> 
          <div class="col border border-warning rounded-3 p-4 mx-3">
            <div class="row">
              <img src="../resources/img/rew2.png" class="img-fluid2">
            </div>
            <div class="row fw-bold fst-italic mb-2">
              고객님의 사용후기__
            </div>
            <div class="row fs-6 lh-lg">
              매일 저녁 메뉴를 고민하는 것도 일처럼 느껴질 때가 있는데 안다미로 구독 서비스를 통해 해결할 수 있었습니다. 영양소가 갖추어진 식단을 
              제공받을 수 있어 메뉴 고민의 어려움 없이 양질의 식사를 할 수 있게 되었습니다.<br>또 식단마다 영양성분, 칼로리 등을 확인할 수 있어 조절을
              하며 먹을 수 있습니다. 매일 업데이트 되는 식단으로 늘 새로운 식탁을 만나게 됩니다.
            </div>
          </div> 
          <div class="col border border-warning rounded-3 p-4 mx-3">
            <div class="row">
              <img src="../resources/img/rew3.jpg" class="img-fluid2">
            </div>
            <div class="row fw-bold fst-italic mb-2">
              고객님의 사용후기__
            </div>
            <div class="row fs-6 lh-lg">
              처음에는 구독 서비스가 필요하지 않다고 생각했지만, 한 번 사용해보니 너무나 편리하고 만족스러웠습니다. 
              특히 레시피 저장 기능은 레시피가 필요할 때마다 일일이 찾아보지 않아도 되어 매우 유용합니다.<br> 
              구독 서비스를 통해 실용적이고 편리한 기능들을 경험하게 되었고, 이제는 그것들이 일상에서 빠질 수 없는 도구가 되었습니다. 
              앞으로도  구독 서비스를 이용할 것입니다.
            </div>
          </div>     
        </div>
      </div>   
      <div style="height: 3rem;"></div>
      <div class="container text-center fw-bold fs-3 mb-4" style="width: 20rem;">
          <div class="text-center bg-warning rounded-3" style="color: rgb(134, 77, 2);">
            구독서비스 혜택
          </div>
        </div>
      <div class="container border border-warning rounded-3 p-4 ">
        <div class="row mb-3">
          <div class="col text-center">
            <img src="../resources/img/bene1.png" class="img-fluid3"> 
          </div>
          <div class="col text-center">
            <img src="../resources/img/bene2.png" class="img-fluid3"> 
          </div>
          <div class="col text-center">
            <img src="../resources/img/bene3.png" class="img-fluid3"> 
          </div>
        </div>
        <div class="row fs-6">
          <div class="col  lh-base">
            더 이상 식단에 고민하지 않아도 됩니다! 간단 식단, 저칼로리 식단, 추천 식단 등 다양한 기호에 맞춘 식단이 매일 업데이트 됩니다! 
          </div>
          <div class="col  lh-base">
            식단에 구성된 레시피의 칼로리와 영양성분을 알 수 있습니다. 다이어트와 가족 건강 관리에 도움이 됩니다!  
          </div>
          <div class="col  lh-base">
            즐겨찾는 레시피를 찾을 때마다 검색할 필요가 없는 레시피 저장 기능이 제공됩니다. 자주 만드는 요리의 레시피를 
            더욱 편리하게 즐길 수 있습니다. 
          </div>
        </div>
      </div> 
      <div style="height: 7rem;"></div>
      <div class="container text-center">
        <a href="/subscribe/subBtn" class="fw-bold fs-2"  style="text-decoration: none; color:  rgb(134, 77, 2);"> 
    	    <button type="button" class="btn btn-outline-warning btn-lg fw-bold " style="width: 20rem;">
        	  구독하기
	        </button>
        </a>
      </div>    
      <div style="height: 7rem;"></div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>