<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse | SignUp</title>
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/signUp.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script>
    $(document).ready(
    		function() {
    			var isId = true;
    			// 아이디 중복검사

    			$("#id").keyup(
    				function() {
    					var ckid = $("#id").val();
    					console.log(ckid);
    					if (ckid.length < 6 || ckid.length > 16) {
    						$("#idresult").text("아이디는 6자이상 16자이하입니다.")
    								.removeClass('text-primary').removeClass(
    										'text-danger')
    								.addClass('text-dark');
    						isId = false;
    					} else {
    						// 비동기 통신
    						$.ajax({
    							url : '${root}/user/idcheck',
    							data : {
    								'ckid' : ckid
    							},
    							type : 'GET',
    							dataType : 'json',
    							success : function(response) {
    								console.log(response);
    								var cnt = response.idcount; // 0 또는 1
    								if (cnt == 0) {
    									$("#idresult")
    											.text(ckid + "는 사용가능합니다.")
    											.removeClass('text-dark')
    											.removeClass('text-danger')
    											.addClass('text-primary');
    									isId = true;
    								} else {
    									$("#idresult").text(
    											ckid + "는 사용할 수 없습니다.")
    											.removeClass('text-dark')
    											.removeClass('text-primary')
    											.addClass('text-danger');
    									isId = false;
    								}
    							},
    							error : function(request, status, error) {
    								console.log("[error] status : "
    										+ request.status + "\tmsg : "
    										+ error);
    							}
    						});
    					}
    				});

    			// 회원가입
    			$("#registerBtn").click(
    					function() {
    					console.log("isId: ", isId);
    						if (!$("#name").val()) {
    							alert("이름을 입력해주세요.");
    							return;
    						} else if (!$("#id").val()) {
    							alert("아이디를 입력해주세요.");
    							return;
    						} else if (!isId) {
    							alert("아이디를 확인해주세요.");
    							return;
    						} else if (!$("#password").val()) {
    							alert("비밀번호를 입력해주세요.");
    							return;
    						} else if ($("#password").val() != $("#pwdcheck").val()) {
    							alert("비밀번호가 일치하지 않습니다.");
    							return;
    						}else if (!$("#address").val()) {
    							alert("주소를 입력해주세요.");
    							return;
    						}else if (!$("#number").val()) {
    							alert("연락처를 입력해주세요.");
    							return;
    						}
    						else {
    							let userinfo = JSON.stringify({
    								"name" : $("#name").val(), 
    								"id" : $("#id").val(), 
    								"password" : $("#password").val(), 
    								"address" : $("#address").val(),
    								"number" : $("#number").val()
    							});
    							$.ajax({
    								url:'${root}/user/register',  
    								type:'POST',
    								contentType:'application/json;charset=utf-8',
    								dataType:'json',
    								data: userinfo,
    								success: function(response) {
    									if (response === 1) {
    										alert('회원가입에 성공하셨습니다. 로그인 해주세요.');
    										location.href = "/";
    									}
    								},
    								error:function(xhr,status,msg){
    									console.log("상태값 : " + status + " Http에러메시지 : "+msg);
    								}
    							});
    						}
    					});

    		});
    </script>
  </head>
  <body>
<!-- 상단 header start -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <div class="container">
        <div class="collapse navbar-collapse justify-content-end">
			<c:choose>
			<c:when test="${ empty loginInfo.memberId }">
				<button class="btn btn-signup text-light" onClick="location.href='${root}/signUp'">signup</button>
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
        <a href="${ root }/"
          ><img style="float: left; margin-left: 20px; width: 100px; height: 100px" class="img-thumbnail" src="${ root }/img/logo.jpg" alt="로고" id="logo"
        /></a>
        <ul class="navbar-nav">
          <li><a href="${ root }/notice.jsp" class="nav-link text-black-50">공지사항</a></li>
          <li><a href="#" class="nav-link text-black-50">오늘의 뉴스</a></li>
        </ul>
      </div>
    </nav>
    <!-- 상단 header end -->
    <!-- 중단 Content Start -->
        <div class="content">
            <div class="container" style="height:30px"></div>
            <div class="container-fluid row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4 bg-white rounded">
                    <h3 class="text-center mt-3">회원가입</h3>
                    <form id="memberform" action="" method="post">
                    <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                이름 :
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" placeholder="이름" name="name" id="name">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                아이디 :
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id" id="id">
                            </div>
                            <div id="idresult" class="mt-1"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                비밀번호 :
                            </div>
                            <div class="col-8">
                                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" id="password">
                            </div>
                        </div>
                          <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                비밀번호 확인 :
                            </div>
                            <div class="col-8">
                                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="pwdcheck" id="pwdcheck">
                            </div>
                        </div>
                        
                        
                        <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                주소 :
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="address" id="address" placeholder="서울특별시 강남구 테헤란로 ..  ">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-4 align-self-center">
                                전화번호 :
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" placeholder="010-xxxx-xxxx" name="number" id="number">
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <button type="button" class="btn btn-primary m-3" id="registerBtn">회원가입</button>
                        	<button type="reset" class="btn btn-primary m-3">초기화</button>
                        </div>
                    </form>
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
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="button" value="비밀번호찾기" onclick="location.href='${root}/member/searchPw.jsp'"/>
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="submit" value="로그인"/>
            </div>
                </form>
            </div>    
        </div>
    </div>
</div>
</html>