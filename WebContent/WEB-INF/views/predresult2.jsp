<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>여러개 마커 표시하기</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	</head>
	

	<body>
		<div id="map" style="width:100%;height:350px;"></div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd9223ef3c76f2ba38d80c2db45680c9&libraries=services"></script>
		<script>
			// controller가 전달한 json 데이터		
			var jsonData = ${result};
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(jsonData["pick_lat"], jsonData["pick_long"]), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [
			    {
			        title: '출동센터', 
			        latlng: new kakao.maps.LatLng(jsonData["safe_lat"], jsonData["safe_long"]),
			        text : '출동센터'		    
			    },
			    {
			        title: '신고장소', 
			        latlng: new kakao.maps.LatLng(jsonData["pick_lat"], jsonData["pick_long"]),
			        text: jsonData["answer"] + '분 소요 예정' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
			    }			   
			];
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다			  
			        image : markerImage // 마커 이미지 
			    });
			 	// 인포윈도우를 생성합니다
			    var infowindow = new kakao.maps.InfoWindow({
			        position : positions[i].latlng, 
			        content : positions[i].text, 
			    });
			      
			    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			    infowindow.open(map, marker); 
			}
		</script>
	</body>
</html>