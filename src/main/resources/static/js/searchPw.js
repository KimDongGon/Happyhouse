$(document).ready(function(){

    $("#_btnpw").click(function(){
        let items = JSON.parse(localStorage.getItem("sign"));
        var checkid = "";
        var checkname = "";
        var checkph = "";
        var pw = Math.random().toString(36).substr(2,11);
        var email = "";
        


        var id = $("#_id").val();
        var name = $("#_name").val();
        var phone = $("#_phnum").val();

        let obj = "";
        let num = "";
        for (let i = 0; i < items.length; i++){
            if (items[i].id == id) {
                obj = items[i];
                num = i;
            }
        }
        if (!obj) {
            alert("없는 아이디입니다.");
            return;
        }
        checkname = obj.name;
        checkph = obj.phnum;

        if (id == "") {
            alert("아이디 칸이 비어있습니다.");
            return;
        }

        if (name == "") {
            alert("이름 칸이 비어있습니다.");
            return;
        }
        if (phone == "") {
            alert("전화번호 칸이 비어있습니다.");
            return;
        }
        if (checkname == name && checkph == phone) {
            items[num].pwd = pw;
            localStorage.setItem("sign", JSON.stringify(items));
            $.ajax({
                data: {
                    name: "happyhouse",
                    message: pw,
                    email: email
                },
                url: "http://127.0.0.1:5500/",
                method: 'get',
                success: (data) => {
                    console.log(data);
                },
                error: (xhr, err) => {
                    console.log(err);
                }
            });
            alert("귀하의 메일로 임시 비밀번호가 전송되었습니다.");
        } else {
            alert("아이디 또는 이름 또는 전화번호가 다릅니다.");
        }
    });
});