<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse | aptInfo</title>
    <link rel="stylesheet" href="${root}/css/main.css" />
    <link rel="stylesheet" href="${root}/css/searchHouseDeal.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2b44d4461fe733e0c8e660ed7d2663b&libraries=services"
  ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${root}/js/main.js"></script>
    <script type="text/javascript" src="${root}/js/searchHouseDeal.js"></script>
    <script>
    	$(document).ready(function() {
    		$(document).on("click", ".sortBtn", function() {
    			var idx = $(this).index();
    			var sortType = ($(this).attr("data-sort") === 'asc') ? 'desc' : 'asc';
    			
    			$("#table > tbody").empty();
    			var array = makeArray();
            	
            	var result = quickSort(array, idx);
            	
            	makeList(result, sortType, $("#aptName").val());
            	
            	$(this).attr("data-sort", ($(this).attr("data-sort") === 'asc') ? 'desc' : 'asc');
    		});
    		
    		$(document).on("click", "#aptSearch", function() {
     			var sortType = ($("#aptNameHeader").attr("data-sort") === 'asc') ? 'asc' : 'desc';
     			
    			// table 초기화
     			$("#table > tbody").empty();
    			
    			// array 생성
    			var array = makeArray();
    			
    			makeList(array, sortType, $("#aptName").val());
    	    });
    	});
    	
    	function makeArray() {
    		var array = [];
    		<c:forEach var="house" items="${aptList}">
				var obj = {
					"aptName": "${house.aptName}",
					"dealAmount": "${house.dealAmount}",
					"area": "${house.area}",
					"dealDate": {
 					"dealYear": "${house.dealYear}",
 					"dealMonth": "${house.dealMonth}",
 					"dealDay": "${house.dealDay}"	
					}
				};
				
				array.push(obj);
    		</c:forEach>
    		
    		return array;
    	}
    	
    	function makeList(array, sortType, aptName) {
    		let str = ``;
        	if (sortType === 'asc') {
        		for (var i = 0; i < array.length; i++) {
        			str += addRow(array, i, aptName);
        		}
        	} else {
        		for (var i = array.length - 1; i >= 0; i--) {
        			str += addRow(array, i, aptName);
        		}
        	}
        	
        	$('#tbody').append(str);
    	}
    	
    	function addRow(array, i, aptName) {
    		var str = '';
			if (aptName !== "" && kmpSearch(`${ '${array[i].aptName}' }`, aptName).length != 0) {
				str += `<tr class="table-primary">`;
			} else {
				str += `<tr>`;
			}
    		str += `<td>${ '${array[i].aptName}' }</td>`;
    		str += `<td>${ '${array[i].dealAmount}' }</td>`;
    		str += `<td>${ '${array[i].area}' }</td>`;
    		str += `<td>${ '${array[i].dealDate.dealYear}' }년 ${ '${array[i].dealDate.dealMonth}' }월 ${ '${array[i].dealDate.dealDay}' }일</td>`;
    		str += `</tr>`;
    		return str;
    	}
    	
    	function kmpSearch(H, N) {
    	    const ret = [];
    	    const pi = getPartialMatch(N);
    	    let begin = 0, matched = 0;
    	    while(begin <= H.length - N.length) {
    	        if(matched < N.length && H[begin + matched] === N[matched]) {
    	            // 모두 일치했다면 답에 추가한다.
    	            if(++matched === N.length ) ret.push(begin);
    	        }
    	        else {
    	            // 한 글자도 일치하지 않으면 다음 시작 위치에서 탐색한다.
    	            if(matched === 0) begin++;
    	            else {
    	                begin += matched - pi[matched - 1];
    	                matched = pi[matched - 1];
    	            }
    	        }
    	    }
    	    return ret;
    	}
    	
    	function getPartialMatch(N) {
    	    const pi = new Array(N.length).fill(0);
    	    let begin = 1, matched = 0;
    	    while(begin + matched < N.length) {
    	        if(N[begin + matched] === N[matched]) {
    	            matched++;
    	            pi[begin + matched - 1] = matched;
    	        }
    	        else {
    	            if(matched === 0) begin++;
    	            else {
    	                begin += matched - pi[matched - 1];
    	                matched = pi[matched - 1];
    	            }
    	        }
    	    }
    	    return pi;
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
        <a href="${root}/"
          ><img style="float: left; margin-left: 20px; width: 100px; height: 100px" class="img-thumbnail" src="${root}/img/logo.jpg" alt="로고" id="logo"
        /></a>
        <ul class="navbar-nav">
          <li><a href="${root}/notice.jsp" class="nav-link text-black-50">공지사항</a></li>
          <li><a href="#" class="nav-link text-black-50">오늘의 뉴스</a></li>
        </ul>
      </div>
    </nav>
    <!-- 상단 header end -->

    <div class="container-fluid bg-dark" style="height: 70px">
      <div class="container-fluid h-100 row">
        <div class="col-sm-2"></div>
        <form
          action="${root}/house/search"
          method="post"
          class="row col-sm-8 justify-content-center align-content-center"
          id="searchForm"
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
          <button class="btn btn-apt-search btn-light" id="btn-apt-search">search</button>
        </form>
        <div class="col-sm-2"></div>
      </div>
    </div>

    <div class="container-fluid m-5 p-5">
      <div class="row">
        <div class="col-sm-6 text-center text-secondary">
          <div>
          	  <h3>거래 정보</h3>
	          <input type="text" id="aptName" name="aptName" value="" placeholder="아파트명 검색" />
	
	          <button id="aptSearch" class="btn btn-dark">검색</button>
          </div>
          <hr />
          	<c:choose>
			<c:when test="${ empty aptList }">
				검색된 정보가 없습니다.
			</c:when>
			<c:otherwise>
				<div id="aptinfo">
					<table id="table" class="table">
						<thead>
							<tr>
								<th id="aptNameHeader" role="button" class="sortBtn" data-sort="asc">아파트명<i class="fa fa-fw fa-sort"></i></th>
								<th role="button" class="sortBtn" data-sort="asc">거래금액<i class="fa fa-fw fa-sort"></i></th>
								<th role="button" class="sortBtn" data-sort="asc">전용면적<i class="fa fa-fw fa-sort"></i></th>
								<th role="button" class="sortBtn" data-sort="asc">거래일자<i class="fa fa-fw fa-sort"></i></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach var="house" items="${aptList}">
								<tr>
									<td>${house.aptName}</td>
									<td>${house.dealAmount}</td>
									<td>${house.area}</td>
									<td>${house.dealYear}년 ${house.dealMonth}월 ${house.dealDay}일</td>
								</tr>
				            </c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
			</c:choose>     

          
          <hr />
        </div>
        <div class="col-sm-6">
          <!-- 중앙 map start -->
          <div id="aptMap" class="mt-2 mr-5" style="width: 500px; height: 500px"></div>
          <!-- 중앙 map end -->
        </div>
      </div>
    </div>
    <!-- 중단 Content End -->
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
