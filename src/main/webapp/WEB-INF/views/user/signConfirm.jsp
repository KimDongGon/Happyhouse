<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse | SignConfirm </title>
    <link rel="stylesheet" href="../css/main.css"/>
    <link rel="stylesheet" href="../css/signConfirm.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	function deleteMember(memberId) {
    	if(confirm("정말로 탈퇴하시겠습니까?")){
    		location.href="${ root }/main?action=delete&memberId="+memberId;
    	}
    }
	</script>
   <!-- <script type="text/javascript" src="../js/signConfirm.js"></script> -->
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

    <div class="content">
        <div class="container" style="height:60px"></div>
        <div class="container-fluid row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4 bg-white rounded">
                    <h3>회원 정보</h3>
                    <div class="table-bordered">
                        <form action="${ root }/main?action=signChangeView" method="post">
                        <table class="table table-striped">
                            <colgroup>
                                <col width="150px">
                                <col width="500px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>아이디</td>
                                    <td>${ dto.memberId }</td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>${ dto.memberName }</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>${ dto.memberEmail }</td>
                                </tr>
                                <tr>
                                    <td>전화번호</td>
                                    <td>${ dto.memberPhone }</td>
                                </tr>
                                <tr>
                                	<td>등급</td>
                                	<td>${ dto.grade }</td>
                                <tr>
                                	<td colspan="2">
                                	<div class="row justify-content-end m-2">
                        				<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="submit" value="회원정보수정" />
            							<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" 
            							type="button" value="회원탈퇴"
            							onClick="deleteMember('${ dto.memberId }');"/>
            				
                        			</div>
                                	</td>
                                </tr>	
                            </tbody>
                        </table>
                        </form>
                    </div>

            </div>
            <div class="col-sm-4"></div>
        </div>
    </div>

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
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="button" 
            	value="비밀번호찾기" onclick="location.href='${root}/member?action=signChangeView'"/>
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="submit" value="로그인"/>
            </div>
                </form>
            </div>    
        </div>
    </div>
</div>
</html>