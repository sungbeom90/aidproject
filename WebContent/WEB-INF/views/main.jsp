<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>좌표로 주소를 얻어내기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		.map_wrap {position:relative;width:50%;height:350px;}
		.title {font-weight:bold;display:block;}
		.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#centerAddr {display:block;margin-top:2px;font-weight: normal;}
		.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
	</head>
	<body>
		<div class="map_wrap">
			<div id="map" style="width:100%;height:800px;position:relative;overflow:hidden;"></div>
			<div class="hAddr">
				<span class="title">지도중심기준 행정동 주소정보</span>
				<span id="centerAddr"></span>
			</div>
		    <form action="predict" method="post">		    	
		    	<input type="hidden" id ="flat" name="latitude" value="">
		    	<input type="hidden" id="flongi" name='longitude' value="">
		    	<input type="hidden" id="fadd" name='emd' value="">
		    	<label for="tm">시간대 선택 : </label>
				<select id="tm" name="tm">
					<option value="0">00시</option>
					<option value="1">01시</option>
					<option value="2">02시</option>
					<option value="3">03시</option>
					<option value="4">04시</option>
					<option value="5">05시</option>
					<option value="6">06시</option>
					<option value="7" selected>07시</option>
					<option value="8">08시</option>
					<option value="9">09시</option>
					<option value="10">10시</option>
					<option value="11">11시</option>
					<option value="12">12시</option>
					<option value="13">13시</option>
					<option value="14">14시</option>
					<option value="15">15시</option>
					<option value="16">16시</option>
					<option value="17">17시</option>
					<option value="18">18시</option>
					<option value="19">19시</option>
					<option value="20">20시</option>
					<option value="21">21시</option>
					<option value="22">22시</option>
					<option value="23">23시</option>
				</select>
			    <label for="jur">관할여부 선택 : </label>
				<select id="jur" name="jur">
					<option value="0">관할 내</option>
					<option value="1">관할 외</option>		
				</select>
				<label for="conscs">의식상태 선택 : </label>
				<select id="conscs" name="conscs">
					<option value="0">A(Alert)</option>
					<option value="1">Drowsy</option>
					<option value="2">P:통증.자극에 반응</option>
					<option value="3">Semicomma</option>
					<option value="4">Stupor</option>
					<option value="5">U(Coma)</option>
					<option value="6">V(Obtunded)</option>
					<option value="7" selected>V:언어지시에 반응</option>				
				</select>
				<label for="occurplc">사고장소 선택 : </label>
				<select id="occurplc" name="occurplc">
					<option value="0">가정</option>
					<option value="1">고속도로</option>
					<option value="2">공공장소</option>
					<option value="3">공장/산업/건설시설</option>
					<option value="4">기타</option>
					<option value="5">도로외교통지역</option>
					<option value="6">바다/강/산/논밭</option>
					<option value="7">사무실</option>
					<option value="8">상업시설</option>
					<option value="9">숙박시설</option>
					<option value="10">스키장</option>
					<option value="11">오락/문화시설</option>
					<option value="12">운동시설</option>
					<option value="13">유흥장소</option>
					<option value="14">의료관련시설</option>
					<option value="15">일반도로</option>
					<option value="16">일차산업장</option>					
					<option value="17" selected>주택가</option>
					<option value="18">집단거주시설</option>
					<option value="19">학교/교육시설</option>						 
				</select>
				<div class="d-flex">
					<input class="btn btn-info btn-sm flex-fill" type="submit" value="입력"><br/>
					<input class="btn btn-danger btn-sm flex-fill" type="reset" value="취소"><br/>
				</div>
			</form>			
		</div>
	
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd9223ef3c76f2ba38d80c2db45680c9&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new kakao.maps.LatLng(37.426657, 126.983451), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
	
		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다
			var latlng = mouseEvent.latLng;
		    searchDetailAddrFromCoords(latlng, function(result, status) {
	    		if (status === kakao.maps.services.Status.OK) {
	    			var detailAddr = '<div>지번 주소 : ' + result[0].address.region_3depth_name + '</div>';
		            var latitude = '<div>위도: '+ latlng.getLat()+ '</div>';
		            var longitude = '<div>경도 : '+ latlng.getLng() +'</div>';
		            var detailHour = '<div>시간 지정 : </div>';
		            var content = '<div class="bAddr">' +
		            				'<span class="title">위치정보</span>' + detailAddr + latitude + longitude
		                        	'</div>';
		            //$('input[name=fadd]').attr('value',detailAddr);
		                        	
		         // 마커를 클릭한 위치에 표시합니다
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
	
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
	
		           /*  document.getElementById("fadd").innerHTML = detailAddr;
		            document.getElementById("flongi").innerHTML = longitude;
		            document.getElementById("flat").innerHTML = latitude; */
		            
		            result[0].address.address_name = 
	
		            document.getElementById("fadd").value = result[0].address.region_3depth_name;
		            document.getElementById("flat").value = latlng.getLat();
		            document.getElementById("flongi").value = latlng.getLng();
		           
		        }
		    });
		});
		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
	
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
		}
	
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
	
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
	
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }
		}
		
		var realObject = JSON.parse("서버에서 받은 json문자열");
		realObject
		
		function ajax() {
			var oReq = new XMLHttpRequest();
			
			oReq.addEvenListener("load", function(){
				console.log(this.responseText);
			});
			
			// 요청방식, url, 비동기적으로 실행될지 boolean(생략가능)
			oReq.open("GET", "localhost:8080/aidproject/main/home1")
		}
		</script>
	</body>
</html>