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
    <script type="text/javascript">
$(document).ready(function() {
		
		//회원 목록
		$.ajax({
			url:'${root}/admin/user',  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(users) {
				makeList(users);
			},
			error:function(xhr, status, error){
				console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
			}	
		});
		
		$("#registerBtn").click(function() {
			let registerinfo = JSON.stringify({
				"name" : $("#name").val(), 
				"id" : $("#id").val(), 
				"password" : $("#password").val(), 
				"address" : $("#address").val(),
				"number" : $("#number").val()
			   });
			$.ajax({
				url:'${root}/admin/user',  
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
					$("#userRegModal").modal("hide");
					makeList(users);
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
		
		$(document).on("dblclick", "tr.view", function() {
			let vid = $(this).attr("data-id");
			$.ajax({
				url:'${root}/admin/user/' + vid,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function(user) {
					$("#vid").text(user.id);
					$("#vname").text(user.name);
					$("#vaddress").text(user.address);
					$("#vnumber").text(user.number);
					$("#userViewModal").modal();
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}				
			});			
		});
		
		// 회원 정보 수정 보기
		$(document).on("click", ".modiBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			$("#view_" + mid).css("display", "none");
			$("#mview_" + mid).css("display", "");
		});
		
		// 회원 정보 수정 실행 
		$(document).on("click", ".modifyBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			let modifyinfo = JSON.stringify({
						"id" : mid, 
						"password" : $("#password" + mid).val(), 
						"address" : $("#address" + mid).val(),
						"number" : $("#number" + mid).val()
					   });
			$.ajax({
				url:'${root}/admin/user',  
				type:'PUT',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: modifyinfo,
				success:function(users) {
					makeList(users);
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
		
		// 회원 정보 수정 취소.
		$(document).on("click", ".cancelBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			$("#view_" + mid).css("display", "");
			$("#mview_" + mid).css("display", "none");
		});
		
		// 회원 탈퇴
		$(document).on("click", ".delBtn", function() {
			if(confirm("정말로 탈퇴처리 하시겠습니까?")) {
				let delid = $(this).parents("tr").attr("data-id");
				$.ajax({
					url:'${root}/admin/user/' + delid,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					success:function(users) {
						makeList(users);
					},
					error:function(xhr,status,msg){
						console.log("상태값 : " + status + " Http에러메시지 : "+msg);
					}
				});
			}
		});
	});
	
function makeList(users) {
	$("#userlist").empty();
	$(users).each(function(index, user) {
		let str = `
		<tr id="view_${'${user.id}'}" class="view" data-id="${'${user.id}'}">
			<td>${'${user.id}'}</td>
			<td>${'${user.password}'}</td>
			<td>${'${user.name}'}</td>
			<td>${'${user.address}'}</td>
			<td>${'${user.number}'}</td>
			<td>
				<button type="button" class="modiBtn btn btn-outline-primary btn-sm">수정</button>
				<button type="button" class="delBtn btn btn-outline-danger btn-sm">삭제</button>
			</td>
		</tr>
		<tr id="mview_${'${user.id}'}" data-id="${'${user.id}'}" style="display: none;">
			<td>${'${user.id}'}</td>
			<td><input type="text" name="password" id="password${'${user.id}'}" value="${'${user.password}'}"></td>
			<td>${'${user.name}'}</td>
			<td><input type="text" name="address" id="address${'${user.id}'}" value="${'${user.address}'}"></td>
			<td><input type="text" name="number" id="number${'${user.id}'}" value="${'${user.number}'}"></td>
			<td>
				<button type="button" class="modifyBtn btn btn-primary btn-sm">수정</button>
				<button type="button" class="cancelBtn btn btn-danger btn-sm">취소</button>
			</td>
		</tr>
		`;
		$("#userlist").append(str);
	});//each
}
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
          <li><a href="${ root }/notice.jsp" class="nav-link text-black-50">공지사항</a></li>
          <li><a href="#" class="nav-link text-black-50">오늘의 뉴스</a></li>
        </ul>
      </div>
    </nav>
    <!-- 상단 header end -->

    <!-- 중앙 main content 1 start -->
    <div class="container text-center mt-3">
        <div class="col-lg-12 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="pink">회원목록</mark></h2>
			<div class="mb-3 text-right"><button type="button" class="modiBtn btn btn-outline-info" data-toggle="modal" data-target="#userRegModal">등록</button></div>
		  	<table class="table table-hover">
		  		<colgroup>
		            <col width="120">
		            <col width="120">
		            <col width="120">
		            <col width="170">
		            <col width="120">
		            <col width="130">
		        </colgroup>
		    	<thead>
			      	<tr>
			        	<th class="text-center">아이디</th>
			        	<th class="text-center">비밀번호</th>
			        	<th class="text-center">이름</th>
			        	<th class="text-center">주소</th>
			        	<th class="text-center">전화번호</th>
			        	<th class="text-center">수정/삭제</th>
			      	</tr>
		    	</thead>
		    	<tbody id="userlist"></tbody>
			</table>
		</div>
		<!-- 회원 등록 모달 -->
		<div class="modal" id="userRegModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원등록</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <form id="memberform" method="post" action="">
					<div class="form-group" align="left">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="">
					</div>
					<div class="form-group" align="left">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" placeholder="">
					</div>
					<div class="form-group" align="left">
						<label for="password">비밀번호</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="">
					</div>
					<div class="form-group" align="left">
						<label for="address">주소</label><br>
						<input type="text" class="form-control" id="address" name="address" placeholder="">
					</div>
					<div class="form-group" align="left">
						<label for="number">전화번호</label>
						<input type="text" class="form-control" id="number" name="number" placeholder="">
					</div>
					<div class="form-group" align="center">
						<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
						<button type="reset" class="btn btn-warning">초기화</button>
					</div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 회원 정보 모달 -->
		<div class="modal" id="userViewModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원정보</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		       	<table class="table table-bordered">
		            <colgroup>
		                <col width="120">
		                <col width="*">
		                <col width="120">
		                <col width="*">
		            </colgroup>
		            <tbody>
		            <tr>
		                <th class="text-center">ID</th>
		                <td class="text-left" id="vid"></td>
		                <th class="text-center">회원명</th>
		                <td class="text-left" id="vname"></td>
		            </tr>
		            <tr>
		            	<th class="text-center">주소</th>
		                <td class="text-left" id="vaddress"></td>
		                <th class="text-center">전화번호</th>
		                <td class="text-left" id="vnumber"></td>
		            </tr>
		            <!-- <tr>
		                <th class="text-center">주소</th>
		                <td class="text-left" colspan="3" id="vaddress"></td>
		            </tr> -->
		            </tbody>
		        </table>
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
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="button" value="비밀번호찾기" onclick="location.href='${root}/member/searchPw.jsp'"/>
            	<input style="background: skyblue; padding:5px; margin-top:10px; margin-right:10px" type="submit" value="로그인"/>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</html>
