<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>구급도착시간 예측</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/preresult.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/WEB-INF/views/main.jsp">
	</head>
	<body>
		<jsp:include page="preresult_css.jsp"/>
		<div class="map_wrap">
			    <div id="map" style="width:100%;height:950px;"></div>
			    <div class="hAddr">
			        <span class="title">지도중심기준 행정동 주소정보</span>
			        <span id="centerAddr"></span>
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
	
		            document.getElementById("address_emd").value = result[0].address.region_3depth_name;
		            document.getElementById("pick_lat").value = latlng.getLat();
		            document.getElementById("pick_long").value = latlng.getLng();
		            
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