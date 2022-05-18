<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse | Notice</title>
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/searchHouseDeal.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script type="text/javascript" src="../js/searchHouseDeal.js"></script>
  </head>
  <body>
<!-- 상단 header start -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <div class="container">
        <div class="collapse navbar-collapse justify-content-end">
			<c:choose>
			<c:when test="${ empty loginInfo.memberId }">
				<button class="btn btn-signup text-light" onClick="location.href='${root}/member/signUp.jsp'">signup</button>
            	<button class="btn btn-login text-light" data-toggle="modal" data-target="#myModal">login</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-confirm text-light" onClick="location.href='${root}/main?action=signConfirm'">Profile</button>
				<button class="btn btn-logout text-light" onClick="location.href='${root}/main?action=logout'">logout</button>
			</c:otherwise>
			</c:choose>       
        </div>
      </div>
    </nav>
    <nav class="navbar navbar-expand-sm bg-light navbar-dark shadow">
      <div class="container">
        <a href="${ root }/index.jsp"
          ><img style="float: left; margin-left: 20px; width: 100px; height: 100px" class="img-thumbnail" src="${ root }/img/logo.jpg" alt="로고" id="logo"
        /></a>
        <ul class="navbar-nav">
          <li><a href="${ root }/notice.jsp" class="nav-link text-black-50">공지사항</a></li>
          <li><a href="#" class="nav-link text-black-50">오늘의 뉴스</a></li>
        </ul>
      </div>
    </nav>
    <!-- 상단 header end -->

    <!-- 중앙 main content start -->
    <div class="container bg-light mt-5">
      <h2 class="text-center text-secondary" style="font-weight: bold">[공지사항]</h2>
      <hr />
      <table class="table table-hover mt-5">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>첫 공지입니다.</td>
            <td>관리자</td>
            <td>2022.03.14</td>
            <td>107</td>
            <td>
              <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#btn1">
                조회
              </button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Happy House</td>
            <td>관리자</td>
            <td>2022.03.14</td>
            <td>77</td>
            <td>
              <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#btn2">
                조회
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <hr />

      <div class="text-center">
        <ul class="pagination justify-content-center">
          <li><a href="#" style="margin-right: 5px" class="text-secondary">◀</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">1</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">2</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">3</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">4</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">5</a></li>
          <li><a href="#" style="margin-right: 5px" class="text-secondary">▶</a></li>
        </ul>
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

    <!-- Moadl1 start -->
    <div class="modal" id="btn1">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">공지사항</h4>
                    <button type=button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table mt-2">
                        <tbody>
                            <tr>
                                <th>제목*</th>
                                <th>첫 공지입니다.</th>
                            </tr>
                            <tr>
                                <th>내용*</th>
                                <th>ssafy 7기 화이팅 !!</th>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Moadl2 start -->
    <div class="modal" id="btn2">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">공지사항</h4>
                    <button type=button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table mt-2">
                        <tbody>
                            <tr>
                                <th>제목*</th>
                                <th>Happy House</th>
                            </tr>
                            <tr>
                                <th>내용*</th>
                                <th>Happy House 공식 홈페이지</th>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

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
          <form action="${ root }/main?action=login" method="post">
          <input type="hidden" name="action" value="login" />
            <div class="row mt-3">
              <div class="col-4 align-self-center">아이디 :</div>
              <div class="col-8"> <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="memberId" id="_logid" /> </div>
            </div>
            <div class="row mt-3">
              <div class="col-4 align-self-center">비밀번호 :</div>
              <div class="col-8"> <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="memberPw" id="_logpwd" /> </div>
            </div>
            <div class="row justify-content-end">
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="button" value="비밀번호찾기" onclick="location.href='${root}/member/searchPw.jsp'"/>
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="submit" value="로그인"/>
            </div>
                </form>
            </div>    
        </div>
    </div>
  </div>
  </body>
</html>
