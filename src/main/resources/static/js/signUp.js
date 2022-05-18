$(document).ready(
		function() {
			var isId = true;
			// 아이디 중복검사

			$("#id").keyup(
					function() {
						var ckid = $("#id").val();
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
						if (!$("#name").val()) {
							alert("이름을 입력해주세요.");
							return;
						} if (!$("#id").val()) {
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
						}else if (!$("#adress").val()) {
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
								
								error:function(xhr,status,msg){
									console.log("상태값 : " + status + " Http에러메시지 : "+msg);
								}
							});
						}
					});

		});