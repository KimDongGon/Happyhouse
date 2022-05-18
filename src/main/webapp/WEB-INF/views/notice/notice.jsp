<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
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
  	<script type="text/javascript">
  	$(document).ready(function() {
  		//글 목록
		$.ajax({
			url:'${root}/notice/list',  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(notices) {
				
				makeList(notices);
			},
			error:function(xhr, status, error){
				console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
			}	
		});
  		
		$("#registerBtn").click(function() {
			let registerinfo = JSON.stringify({
				"subject" : $("#subject").val(), 
				"content" : $("#content").val()
			   });
			$.ajax({
				url:'${root}/notice/list',  
				type:'POST',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: registerinfo,
				success:function(users) {
					$("#name").val('');
					$("#id").val('');
					$("#password").val('');
					$("#address").val('');
					$("#number").val('');
					$("#noticeViewModal").modal("hide");
					makeList(users);
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
		
		$(document).on("click", ".clickBtn", function() {
			let vid = $(this).parent().parent().attr("data-id");
			
			$.ajax({
				url:'${root}/notice/list/' + vid,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function(notice) {
					$("#vno").text(notice.no);
					$("#vsubject").text(notice.subject);
					//$("#vregtime").text(notice.regtime);
					$("#vcontent").text(notice.content);
					$("#noticeViewModal").modal();
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}				
			});			
		});
		
		function makeList(notices) {
			$("#noticelist").empty();
			$(notices).each(function(index, notice) {
				let str = `
				<tr id="view_${'${notice.no}'}" class="view" data-id="${'${notice.no}'}">
					<td>${'${notice.no}'}</td>
					<td>${'${notice.subject}'}</td>
					<td>관리자</td>
					<td>${'${notice.regtime}'}</td>
					//console.log("regtime : {} " + ${notice.regtime});
					<td>
						<button type="button" class="clickBtn btn btn-outline-primary btn-sm">클릭</button>
					</td>
				</tr>
				
				`;
				$("#noticelist").append(str);
			});//each
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
    <div class="container text-center mt-3">
        <div class="col-lg-12 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="pink">공지사항</mark></h2>
			<c:if test="${ loginInfo.id eq 'admin' }">
				<div class="mb-3 text-right"><button type="button" class="modiBtn btn btn-outline-info" data-toggle="modal" data-target="#noticeRegModal">등록</button></div>
			</c:if>
		  	<table class="table table-hover">
		  		<colgroup>
		            <col width="120">
		            <col width="170">
		            <col width="120">
		            <col width="170">
		            <col width="130">
		        </colgroup>
		    	<thead>
			      	<tr>
			        	<th class="text-center">글번호</th>
			        	<th class="text-center">제 목</th>
			        	<th class="text-center">작성자</th>
			        	<th class="text-center">작성일</th>
			        	<th class="text-center">보기</th>
			      	</tr>
		    	</thead>
		    	<tbody id="noticelist"></tbody>
			</table>
		</div>
		
		<!-- 게시물 등록 모달 -->
		<div class="modal" id="noticeRegModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">공지사항 등록</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <form id="noticeform" method="post" action="">
					<div class="form-group" align="left">
						<label for="name">제목</label>
						<input type="text" class="form-control" id="subject" name="subject" placeholder="">
					</div>
					<div class="form-group" align="left">
						<label for="id">내용</label>
						<textarea class="form-control" name="content" id="content" rows="8"></textarea>
						<!-- <input type="text" class="form-control" id="content" name="content" placeholder=""> -->
					</div>
					
					<div class="form-group" align="center">
						<button type="button" class="btn btn-primary" id="registerBtn">글작성</button>
						<button type="reset" class="btn btn-warning">초기화</button>
					</div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 게시물 정보 모달 -->
		<div class="modal" id="noticeViewModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">공지사항</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		       	<table class="table table-bordered">
		            <thead>
		            	<tr>
		                	<th class="text-center">ID</th>
		                	<td class="text-left" >${ loginInfo.id }</td>
		                	<th class="text-center">작성자</th>
		                	<td class="text-left">${ loginInfo.name }</td>
		            	</tr>
		            </thead>
		            <tbody>
		            	<tr>
		            		<th class="text-center">제목</th>
		               	 	<td class="text-left" id="vsubject" colspan="3"></td>
		            	</tr>
		            	<tr rowspan="3">
		            		<th class="text-center">내용</th>
		            		<td class="text-center" id="vcontent" colspan="3" rows="8"></td>
		            	</tr>
		            	
		            	
		            </tbody>
		        </table>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
    <!-- 중앙 main content end -->
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
