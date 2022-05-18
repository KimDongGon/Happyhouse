$(document).ready(function () {

//    $(".btn-logout").hide();
//
//    if (sessionStorage.getItem("login")) {
//        $(".btn-signup").hide();
//
//        $(".btn-login").hide();
//
//        $(".btn-logout").show();
//    }

//    $(".btn-logout").click(function () {
//       sessionStorage.clear();
//        console.log("logout");
//        alert("로그아웃 되었습니다.");
//        $(".btn-logout").hide();
//        $(".btn-login").show();
//        $(".btn-signup").show();
//        location.reload();
//    });

    $(".btn-confirm").click(function () {
        if (sessionStorage.getItem("login")) { 
            console.log(location.pathname);
            if (location.pathname == '/happyhouse/index.html') {
                location.href = 'html/signconfirm.html';
            } else {
                location.href = 'signconfirm.html';
            }
        } else {
            alert("로그인해야 합니다.");
        }
    });

    $("#_btnLogin").click(function(){
        let items = JSON.parse(localStorage.getItem("sign"));

        var id = $("#_logid").val();
        var pw = $("#_logpwd").val();

        if (id == "") {
            alert("아이디 칸이 비어있습니다.");
            return;
        }

        if (pw == "") {
            alert("비밀번호 칸이 비어있습니다.");
            return;
        }
        
        console.log("ID:"+id);
        console.log("PW:"+pw);

        for (let i = 0; i < items.length; i++){
            if (items[i].id == id) {
                if (items[i].pwd == pw) {
                    console.log("login");
                    alert("로그인에 성공하였습니다.");
                    sessionStorage.setItem("login",JSON.stringify(items[i]));
                    if (location.pathname == '/happyhouse/index.html') {
                        location.href = 'html/signconfirm.html';
                    } else {
                        location.href = 'signconfirm.html';
                    }
                    return;
                }
            }
        }
        alert("아이디 또는 비밀번호가 다릅니다.");
    });

    $("#_btnpw").click(function () {
        if (location.pathname == '/happyhouse/index.html') {
            location.href = 'html/searchPw.html';
        } else {
            location.href = 'searchPw.html';
        }

    })

});