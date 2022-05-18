$(document).ready(function(){

    let items = JSON.parse(sessionStorage.getItem("login"));
    console.log(items);
    if (items) {
        $("#_id").html(items.id);
        $("#_name").html(items.name);
        $("#_address").html(items.address);
        $("#_phnum").html(items.phnum);
    }

    $("#_btnSign").click(function () {
        if (!items) {
            alert("회원가입 되어있지 않습니다.");
            return;
        } else {
            if (confirm("회원 정보를 수정하시겠습니까?")) {
                location.href = 'signchange.html'
            }
        }
        
    });

    $("#_btnRemove").click(function () {
        if (!items) {
            alert("회원가입 되어있지 않습니다.");
            return;
        }
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            
            let items = JSON.parse(sessionStorage.getItem("login"));
            let signArrSend = [];
            let signArr = JSON.parse(localStorage.getItem("sign"));

            for (let i = 0; i < signArr.length; i++){
                if (signArr[i].id != items.id) {
                    signArrSend.push(signArr[i]);
                }
            }

            localStorage.setItem("sign", JSON.stringify(signArrSend));
            sessionStorage.clear();
            location.reload();
        } else {
            alert("감사합니다.");
        }
    });

});