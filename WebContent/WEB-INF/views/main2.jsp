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
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	<style>
		.map_wrap {position:relative;width:100%;height:300px;}
		.title {font-weight:bold;display:block;}
		.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#centerAddr {display:block;margin-top:2px;font-weight: normal;}
		.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
	</head>
	<body>
		<div class="wrap">
			<%-- 공통 헤더 --%>
			<%--<jsp:include page="/WEB-INF/views/include/header.jsp"/> <!-- 실행을하고 결과를 넣는다. --> --%>			
			<%-- 내용 --%>
			<div class="mainCenter mt-5">
				<%-- 공통 메뉴 --%>
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
				
						
				<div class="content container">
					<div class="sector">
						<div class="map_wrap">
							<div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
							<div class="hAddr">
								<span class="title">지도중심기준 행정동 주소정보</span>
								<span id="centerAddr"></span>
							</div>
						    <form action="predict2" method="post">
						    	<label for="safe_senter">센터명 입력 : </label>
								<input type="text" id="safe_senter" name="safe_senter" value="안양 119 응급센터">
														    	
						    	<label for="move_tm">소요시간 입력 : </label>
								<input type="text" id="move_tm" name="move_tm" value="5.0">
								
						    	<label for="statmnt_tm">시간대 선택 : </label>
								<select id="statmnt_tm" name="statmnt_tm">
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
							    <label for="jurisd">관할여부 선택 : </label>
								<select id="jurisd" name="jurisd">
									<option value="0">관할 내</option>
									<option value="1">관할 외</option>		
								</select>
								<label for="conscs">의식상태 선택 : </label>
								<select id="conscs" name="conscs">
									<option value="0" selected >깨어있음(Alert)</option>
									<option value="1">나른함(Drowsy)</option>
									<option value="2">통증.자극에 반응(Pain)</option>
									<option value="3">반 혼수상태(Semicomma)</option>
									<option value="4">혼미함(Stupor)</option>
									<option value="5">혼수상태(Coma)</option>
									<option value="6">둔함(Obtunded)</option>
									<option value="7">언어지시에 반응(Voice)</option>				
								</select>								
								<div class="d-flex">
									<input class="btn btn-info btn-sm flex-fill" type="submit" value="입력"><br/>
									<input class="btn btn-danger btn-sm flex-fill" type="reset" value="취소"><br/>
								</div>
							</form>			
						</div>
					</div>
				</div>
			</div>
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
	    			var detailAddr = '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
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