$(document).ready(function () {
	 $.ajax({
    	url: 'http://localhost:8080/code/sido',
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
    
    var map;
    var mapContainer = document.getElementById("aptMap"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 5, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        map = new kakao.maps.Map(mapContainer, mapOption);

    let url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
    let regcode = "*00000000";

    var Request = function() {  
        this.getParameter = function(name) {  
            var rtnval = '';  
            var nowAddress = unescape(location.href);  
            var parameters = (nowAddress.slice(nowAddress.indexOf('?') + 1,  
                    nowAddress.length)).split('&');  
            for (var i = 0; i < parameters.length; i++) {  
                var varName = parameters[i].split('=')[0];  
                if (varName.toUpperCase() == name.toUpperCase()) {  
                    rtnval = parameters[i].split('=')[1];  
                    break;  
                }  
            }  
            return rtnval;  
        }  
    }  
    var request = new Request();

    $(document).on("change", "#sido", function () {
        $.ajax({
        	url: 'http://localhost:8080/code/gugun',
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
            	$("#sidoCode").val($("#sido").val())
          	},
            error: function (xhr, status, msg) {
                console.log("상태값 : " + status + " Http에러메시지 : " + msg);
            },
    	});
      });

    $(document).on("change", "#gugun", function () {
        $.ajax({
        		url: 'http://localhost:8080/code/dong',
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
            	$("#gugunCode").val($("#gugun").val())
          	},
  			error: function (xhr, status, msg) {
  			    console.log("상태값 : " + status + " Http에러메시지 : " + msg);
  			},
    		});
      });

    $(document).on("change", "#dong", function () {
    	$("#dongCode").val($("#dong").val())
    });
    

    function makeMarker(data) {
            // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        var positions = [];

        $(data).find('item').each(function () {
            let string = `${$("#sido option:checked").text()} ${ $("#gugun option:checked").text()} ${ $("#dong option:checked").text()} ${ $(this).find('지번').text()}`
                    // 주소로 좌표를 검색합니다
            geocoder.addressSearch(string, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // // 인포윈도우로 장소에 대한 설명을 표시합니다
                    // var infowindow = new kakao.maps.InfoWindow({
                    //     content: `<div style="width:150px;text-align:center;padding:6px 0;">${$(this).find('아파트').text()}</div>`
                    // });
                    // infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });
        });
    }

    $("#btn-apt-search").click(function () {
    	if (!$("#sido").val()) {
    		alert('시도를 선택해주세요.');
    		return false;
    	} else if (!$("#gugun").val()) {
    		alert('시/구/군을 선택해주세요.');
    		return false;
    	} else if (!$("#dong").val()) {
    		alert('동을 선택해주세요.');
    		return false;
    	} else {
    		$("#searchForm").submit();
    	}
    });
});

function quickSort (array, idx) {
	var key = getKey(idx);
	if (array.length < 2) {
		return array;
	}
	var pivot = [array[0]];
	var left = [];
	var right = [];
	for (let i = 1; i < array.length; i++) {
		var arrayVal;
		var pivotVal;
		
		if (idx === 0) {
			arrayVal = array[i][key];
			pivotVal = pivot[0][key];
		} else if (idx === 1) {
			arrayVal = parseInt(array[i][key]);
			pivotVal = parseInt(pivot[0][key]);
		} else if (idx == 2) {
			arrayVal = parseFloat(array[i][key]);
			pivotVal = parseFloat(pivot[0][key]);
		} else {
			var date1 = array[i][key];
			var date2 = pivot[0][key];
			arrayVal = new Date(date1["dealYear"], date1["dealMonth"], date1["dealDay"])
			pivotVal = new Date(date2["dealYear"], date2["dealMonth"], date2["dealDay"])
		}
		
    	if (arrayVal < pivotVal) {
    		left.push(array[i]);
    	} else if (arrayVal > pivotVal) {
    		right.push(array[i]);
    	} else {
    		pivot.push(array[i]);
    	}
	}
	
	var lSorted = quickSort(left, idx);
	var rSorted = quickSort(right, idx);
		return lSorted.concat(pivot).concat(rSorted);
	}

function getKey(idx) {
	if (idx == 0) {
		return "aptName";
	} else if (idx == 1) {
		return "dealAmount";
	} else if (idx == 2) {
		return "area";
	} else {
		return "dealDate";
	}
}