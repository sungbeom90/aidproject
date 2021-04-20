<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>info</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/home.css">
		
	</head>
	<body>
		<div class="wrap">
			<%-- 공통 헤더 --%>
			<%--<jsp:include page="/WEB-INF/views/include/header.jsp"/> <!-- 실행을하고 결과를 넣는다. --> --%>
			<%-- 내용 --%>
			<%-- 공통 메뉴 --%>				
			<div class="mainCenter mt-5">
				<div class="content container">
					<h1>구급 도착시간 예측 사용하기</h1>
					<br/>				
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail1_img1.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>Step 1.지도 위치 확인</h5>
								<p class="info_text">1. 도착시간 예측을 누른다</p>
								<p class="info_text">2. 우측 상단에 지도의 현행동 주소정보를 확인할 수 있다.</p>
							</div>
						</div>
					</div>
					
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail1_img2.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>2.사고발생 지역 위치 찾기</h5>
								<p>1. 지도에서 특정 지역을 선택하면 파란색 핀으로 표시하며 주소, 위도, 경도를 확인할 수 있다.</p>
							</div>
						</div>
					</div>
					
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail1_img3.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>3.도착시간까지의 조건을 입력</h5>
								<p>1. 좌측 사이드바에서 사고시간대, 관할여부, 의식상태, 사고장소를 선택하고  입력버튼으로 예측을 한다.</p>
								<p>-시간대 : 00시, 01시, 02시, 03시...23시 </p>
								<p>-관할여부 : 관할 내/외 </p>
								<p>-의식상태 : 깨어있음, 나른함, 통증.자극에 반응 등 </p>
								<p>-사고장소 : 가정, 고속도로, 바다/강/산, 사무실 등</p>
							</div>
						</div>
					</div>
					
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail1_img4.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>4.소요시간 예측 확인</h5>
								<p>1.출동할 센터를 보여준다. </p>
								<p>2.출동센터에서 사고발생 지역까지의 소요시간을 예측하여 보여준다.</p>
							</div>
						</div>
					</div>
					<div class="sector">					
						<div class="d-flex">
							<a class="btn btn-outline-success flex-fill" href="<%=application.getContextPath()%>/main/content">이 기능 사용하기</a>
							<a class="btn btn-outline-info flex-fill" href="<%=application.getContextPath()%>/">메인페이지로</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>