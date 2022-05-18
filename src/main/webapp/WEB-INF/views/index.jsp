<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse | Main</title>
    <link rel="stylesheet" href="./css/main1.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--     <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script type="text/javascript" src="./js/main.js"></script> -->
    <script type="text/javascript" src="./js/index.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2b44d4461fe733e0c8e660ed7d2663b"
    ></script>
    <script>
      var map;
      $(function () {
        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.60295171133499, 127.02282579840427), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
          };

        map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커를 표시할 위치와 title 객체 배열입니다
        var positions = [
          {
            title: "돈암삼부아파트",
            latlng: new kakao.maps.LatLng(37.602874980485815, 127.024074908179),
          },
          {
            title: "돈암동부센트레빌아파트",
            latlng: new kakao.maps.LatLng(37.60277610066754, 127.0259693355823),
          },
          {
            title: "돈암현대아파트",
            latlng: new kakao.maps.LatLng(37.60374078756766, 127.0271420873093),
          },
          {
            title: "돈암범양아파트",
            latlng: new kakao.maps.LatLng(37.603392290108424, 127.02795747887419),
          },
          {
            title: "길음뉴타운9단지아파트",
            latlng: new kakao.maps.LatLng(37.60295247998547, 127.02021965472383),
          },
        ];

        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (var i = 0; i < positions.length; i++) {
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(24, 35);

          // 마커 이미지를 생성합니다
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
          });
        }
      });
    </script>
  </head>
  <body>
    <!-- 상단 header start -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <div class="container">
        <div class="collapse navbar-collapse justify-content-end">
			<c:choose>
			<c:when test="${ empty loginInfo }">
				<button class="btn btn-signup text-light" onClick="location.href='${root}/signUp'">signup</button>
            	<button class="btn btn-login text-light" data-toggle="modal" data-target="#myModal">login</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-confirm text-light" onClick="location.href='${root}/main?action=signConfirm'">Profile</button>
				<c:if test="${loginInfo.id eq 'admin'}">
					<button class="btn btn-logout text-light" onClick="location.href='${root}/userList'">UserList</button>
				</c:if>
				<button class="btn btn-logout text-light" onClick="location.href='${root}/logout'">logout</button>
				
			</c:otherwise>
			</c:choose>       
        </div>
      </div>
    </nav>
    <nav class="navbar navbar-expand-sm bg-light navbar-dark shadow">
      <div class="container">
        <a href="${ root }/"
          ><img class="img-thumbnail" src="${ root }/img/logo.jpg" alt="로고" id="logo"
        /></a>
        <ul class="navbar-nav">
        	<c:if test="${ not empty loginInfo }">
        		<li>${ loginInfo.name }(${ loginInfo.id })님, 환영합니다.</li>
        	</c:if>
          <li><a href="${ root }/notice" class="nav-link text-black-50">공지사항</a></li>
          <li><a href="#" class="nav-link text-black-50">오늘의 뉴스</a></li>
        </ul>
      </div>
    </nav>
    <!-- 상단 header end -->

    <!-- 중앙 main content 1 start -->
    <!-- 중앙 banner satrt -->
    <div class="main-background">
      <div class="main-banner">
        <img src="./img/mainbg1.jpg" alt="배너" class="main-banner-img" />
        <div class="main-banner-text">
          <h2 class="h2">Happy House</h2>
          <hr />
          <p>행복한 우리집</p>
        </div>
      </div>
      <div class="container-fluid h-25 row">
        <div class="col-sm-2"></div>
        <form
          action="${root}/house/search"
          method="post"
          class="row col-sm-8 justify-content-center align-content-center"
        >
        <input type="hidden" name="action" id="action" value="houseSearchByDong"/>
          <div class="col pl-1">
            <select name="sido" id="sido" class="form-control bg-dark text-light">
              <option value="">도/광역시</option>
            </select>
          </div>
          <div class="col pl-1">
            <select name="gugun" id="gugun" class="form-control bg-dark text-light">
              <option value="">시/구/군</option>
            </select>
          </div>
          <div class="col pl-1">
            <select name="dong" id="dong" class="form-control bg-dark text-light">
              <option value="">동</option>
            </select>
          </div>
          <button class="btn-apt-search btn-light" id="btn-apt-search">search</button>
        </form>
        <div class="col-sm-2"></div>
      </div>
    </div>
    <!-- 중앙 banner end -->
    <div class="container bg-light">
      <!-- 중앙 map start -->
      <div id="map" class="mt-3" style="width: 100%; height: 500px"></div>
      <!-- 중앙 map end -->
    </div>
    <!-- 중앙 main content start -->
    <div class="container">
      <div class="row">
        <div class="col-sm-3 mt-5">
          <img src="./img/sideAD.jpg" class="rounded img-thumbnail" alt="광고이미지" />
        </div>
        <div class="col-sm-9">
          <div class="row mt-3">
            <div class="col text-center mt-3">
              <div><h3 style="font-weight: bold">주택 관련 기사</h3></div>
              <hr />
              <div class="list-group">
                <a
                  href="https://www.yna.co.kr/view/AKR20210830070600003"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="&lt;인사&gt; 신동아건설"
                  >&lt;인사&gt; 신동아건설</a
                >
                <a
                  href="http://renews.co.kr/news/articleView.html?idxno=64858"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="12.16 대책 후 ‘매수·매도자 모두 일단 관망세’"
                  >12.16 대책 후 ‘매수·매도자 모두 일단 관망세’</a
                >
                <a
                  href="https://www.yna.co.kr/view/AKR20200131051600053"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="구미시, 낙동강 변 국가3산단에 민간공원 조성"
                  >구미시, 낙동강 변 국가3산단에 민간공원 조성</a
                >
                <a
                  href="https://www.newswire.co.kr/newsRead.php?no=910607"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="‘은행’과 ‘보험사’의 주택담보대출 조건, 어떻게 다를까?"
                  >‘은행’과 ‘보험사’의 주택담보대출 조건, 어떻게 다를까?</a
                >
              </div>
            </div>
            <div class="col text-center mt-3">
              <div><h3 style="font-weight: bold">오늘의 뉴스</h3></div>
              <hr />
              <div class="list-group">
                <a
                  href="https://www.newswire.co.kr/newsRead.php?no=910157"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="존슨콘트롤즈, OpenBlue 공개 “135년 쌓아온 빌딩 전문성과 최첨단 기술 결합”"
                  >존슨콘트롤즈, OpenBlue 공개 “135년 쌓아온 빌딩 전문성과 최첨단 기술 결합”</a
                >
                <a
                  href="https://www.newswire.co.kr/newsRead.php?no=910147"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="산업통상자원부, 업종별 비대면·온라인 수출 기반 본격 가동"
                  >산업통상자원부, 업종별 비대면·온라인 수출 기반 본격 가동</a
                >
                <a
                  href="http://www.hmhtimes.com/news/articleView.html?idxno=5797"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="장상인 대표, 제6회 INAK사회공헌대상 프레스클럽부문 ‘시민봉사대상’ 수상"
                  >장상인 대표, 제6회 INAK사회공헌대상 프레스클럽부문 ‘시민봉사대상’ 수상</a
                >
                <a
                  href="https://news.samsung.com/kr/"
                  target="_blank"
                  class="list-group-item list-group-item-action"
                  title="삼성전자, 한샘과 공동사업 강화 위한 업무협약 체결"
                  >삼성전자, 한샘과 공동사업 강화 위한 업무협약 체결</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 중앙 main content end -->

    <!-- 하단 footer start -->

    <div class="container-fluid bg-light text-black-100 ml-5 mt-5 mb-5">
      <h3 class="find-us">Find Us</h3>
      <hr />
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="https://www.ssafy.com/" target="_blank"
            >(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어</a
          >
        </li>
        <li class="nav-item">Tel. 1544-9001</li>
        <li class="nav-item">email. admin@ssafy.com</li>
      </ul>
    </div>
    <div style="height: 40px" class="container-fluid bg-secondary text-center">
      <div style="color: black" class="footer-bottom-text">
        Copyright by SSAFY All rights reserved
      </div>
    </div>
    <!-- 하단 footer end -->
  </body>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <form action="${ root }/login" method="post">
            <div class="row mt-3">
              <div class="col-4 align-self-center">아이디 :</div>
              <div class="col-8"> <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id" id="id" /> </div>
            </div>
            <div class="row mt-3">
              <div class="col-4 align-self-center">비밀번호 :</div>
              <div class="col-8"> <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" id="password" /> </div>
            </div>
            <div class="row justify-content-end">
            	<input class="btn btn-primary m-3" type="button" value="비밀번호찾기" onclick="location.href='${root}/member/searchPw.jsp'"/>
            	<input class="btn btn-primary m-3" type="submit" value="로그인"/>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</html>
