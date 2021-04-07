<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>좌표로 주소를 얻어내기</title>
	<link rel="stylesheet" href="[https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css](https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css)">
	<script	src="[https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js](https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js)"></script>
	<script	src="[https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js](https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js)"></script>
	<script	src="[https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js](https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js)"></script>
	<style>
		.map_wrap {position:relative;width:100%;height:350px;}
		.title {font-weight:bold;display:block;}
		.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#centerAddr {display:block;margin-top:2px;font-weight: normal;}
		.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
	<script>
			function enable() {
			document.getElementById("cons").disabled=false;
			}
	</script>
	</head>
	<body>
		<div class="map_wrap">
			<div id="map" style="width:100%;height:800px;position:relative;overflow:hidden;"></div>
			<div class="hAddr">
			<span class="title">지도중심기준 행정동 주소정보</span>
			<span id="centerAddr"></span>
		</div>
		<input type='text' id='test' value='test용'/>

		    <form method="POST" action="method">
		    	<input type="text" name="add" id="add">
		    	<input type="text" name="longi" id="longi">
		    	<input type="text" name="lat" id="lat">
		    	<p id="fadd"></p>
		    	<p id="flongi"></p>
		    	<p id="flat"></p>
		    	<label for="time">시간대</label>
		    	<select id="time">
			      <option value="0">0</option>
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				  <option value="11">11</option>
				  <option value="12">12</option>
				  <option value="13">13</option>
				  <option value="14">14</option>
				  <option value="15">15</option>
				  <option value="16">16</option>
				  <option value="17">17</option>
				  <option value="18">18</option>
				  <option value="19">19</option>
				  <option value="20">20</option>
				  <option value="21">21</option>
				  <option value="22">22</option>
				  <option value="23">23</option>
			    </select>
			    <label for="juri" >관할영역</label>
			    <select id="juri">
				  <option value="Y">Y</option>
				  <option value="N">N</option>
				</select>
				<label for="cons">의식상태</label>
				<select id="cons">
				  <option value="Y">Y</option>
				  <option value="N">N</option>
				 </select>
				 <button class="btn btn-info btn-sm">데이터 전달</button>
			</form>
		</div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd9223ef3c76f2ba38d80c2db45680c9&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
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
		         // 마커를 클릭한 위치에 표시합니다
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
	
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
	
		            document.getElementById("fadd").innerHTML = detailAddr;
		            document.getElementById("flongi").innerHTML = longitude;
		            document.getElementById("flat").innerHTML = latitude;
	
		            var detailAddr = document.getElementById("add").value;
		            var longitude = document.getElementById("longi").value;
		            var latitude = document.getElementById("lat").value;
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
		</script>
	</body>
</html>