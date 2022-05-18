$(document).ready(function(){
    let items = JSON.parse(sessionStorage.getItem("login"));
    if (items) {
        $("#_id").val(items.id);
        $("#_name").val(items.name);
        $("#_address").val(items.address);
        $("#_phnum").val(items.phnum);
    }
    $("#_btnSign").click(function(){
        
        var id = $("#_id").val();
        var pw = $("#_pwd").val();
        var name = $("#_name").val();
        var addr = $("#_address").val();
        var phone = $("#_phnum").val();

        if (id == "") {
            alert("아이디 칸이 비어있습니다.");
            return;
        }

        if (pw == "") {
            alert("비밀번호 칸이 비어있습니다.");
            return;
        } else if (pw != items.pwd) {
            alert("비밀번호가 틀렸습니다.");
            return;
        }

        if (name == "") {
            alert("이름 칸이 비어있습니다.");
            return;
        }

        if (addr == "") {
            alert("이메일 칸이 비어있습니다.");
            return;
        }

        if (phone == "") {
            alert("전화번호 칸이 비어있습니다.");
            return;
        }

        if (confirm("회원정보를 수정 하시겠습니까?")) {
            let signArr = JSON.parse(localStorage.getItem("sign"));
            for (let i = 0; i < signArr.length; i++){
                if (signArr[i].id == items.id) {
                    signArr[i].id = id;
                    signArr[i].name = name;
                    signArr[i].address = addr;
                    signArr[i].phnum = phone;
                    sessionStorage.setItem("login", JSON.stringify(signArr[i]));
                }

            }
            localStorage.setItem("sign", JSON.stringify(signArr));

            location.href = "signconfirm.html";
        }
    });
});