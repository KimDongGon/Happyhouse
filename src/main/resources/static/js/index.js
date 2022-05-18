$(document).ready(function () {
	
    $.ajax({
    	url: 'code/sido',
      	type: 'GET',
      	dataType: "json",
      	async: false,
      	success: function (response) {
      		let code = ``;
        	$(response).each(function(){
        		code += '<option value="'+ this.sidoCode +'">'+this.sidoName+'</option>';
        	});
        	$("#sido").empty().append('<option value="">시도선택</option>').append(code);
      	},
        error: function (xhr, status, msg) {
            console.log("상태값 : " + status + " Http에러메시지 : " + msg);
        },
	});
    
    $(document).on("change", "#sido", function () {
        $.ajax({
        	url: 'code/gugun',
        	data: {'sidoCode': $("#sido").val()},
          	type: 'GET',
          	dataType: "json",
          	async: false,
          	success: function (response) {
          		let code = ``;
            	$(response).each(function(){
            		code += '<option value="'+ this.gugunCode +'">'+this.gugunName+'</option>';
            	});
            	$("#gugun").empty().append('<option value="">구/군선택</option>').append(code);
          	},
            error: function (xhr, status, msg) {
                console.log("상태값 : " + status + " Http에러메시지 : " + msg);
            },
    	});
      });

    $(document).on("change", "#gugun", function () {
      $.ajax({
      		url: 'code/dong',
      		data: {'sidoCode': $("#sido").val(), 'gugunCode': $("#gugun").val()},
        	type: 'GET',
        	dataType: "json",
        	async: false,
        	success: function (response) {
        		let code = ``;
          	$(response).each(function(){
          		code += '<option value="'+ this.dongCode +'">'+this.dongName+'</option>';
          	});
          	$("#dong").empty().append('<option value="">동선택</option>').append(code);
        	},
			error: function (xhr, status, msg) {
			    console.log("상태값 : " + status + " Http에러메시지 : " + msg);
			},
  		});
    });
    
    $("#btn-apt-search").click(function () {
    	if (!$("#sido").val()) {
    		alert('시도를 선택해주세요.');
    		return;
    	} else if (!$("#gugun").val()) {
    		alert('시/구/군을 선택해주세요.');
    		return;
    	} else if (!$("#dong").val()) {
    		alert('동을 선택해주세요.');
    		return;
    	} else {
    		$("#searchForm").submit();
    	}
    });
    
});