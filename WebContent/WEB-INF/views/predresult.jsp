<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마커와 텍스트 표시하기</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	</head>
	



	<body>
	<!-- 이미지 지도를 표시할 div 입니다 -->
		<div id="staticMap" style="width:600px;height:350px;"></div>    
		<script>
		
		</script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd9223ef3c76f2ba38d80c2db45680c9&libraries=services"></script>
		<script>
			// controller가 전달한 json 데이터
			var jsonData = ${result};
			// 이미지 지도에 표시할 마커입니다
			// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
			var markers = [
			    {
			        position: new kakao.maps.LatLng(jsonData["safe_lat"], jsonData["safe_long"])
			    },
			    {
			        position: new kakao.maps.LatLng(jsonData["pick_lat"], jsonData["pick_long"]), 
			        text: jsonData["answer"] + '분 소요 예정' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
			    }
			];
			
			var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
			    staticMapOption = { 
			        center: new kakao.maps.LatLng(jsonData["safe_lat"], jsonData["safe_long"]), // 이미지 지도의 중심좌표
			        level: 4, // 이미지 지도의 확대 레벨
			        marker: markers // 이미지 지도에 표시할 마커 
			    };    
			
			// 이미지 지도를 생성합니다
			var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		</script>
	</body>
</html>