<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home</title>
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
			<div class="mainCenter mt-5">
				<%-- 공통 메뉴 --%>
				<img class="head_image" src="<%=application.getContextPath()%>/resources/img/info_main_image.jpg" alt="info">
				<h1 class="head_text">경기 구급 골든타입 예측 웹 서비스</h1>
				<div class="content container mt-5">
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/predict_time.gif" alt="info">
								<div class="mt-5">
									<h3>구급 도착시간 예측 사용하기</h3>
									<p>특정 위치에 구급 차량이 도착할 때 까지 소요시간이 알 수 있습니다.</p>														
									<div class="d-flex">
										<a class="btn btn-outline-danger flex-fill" href="<%=application.getContextPath()%>/main/detail1">이 기능 살펴보기</a>
										<a class="btn btn-outline-success flex-fill" href="<%=application.getContextPath()%>/main/content">이 기능 사용하기</a>
									</div>
			
								</div>	
							</div>												
							<div class="info_detail">
								<img class="img" src="<%=application.getContextPath()%>/resources/img/predict_dstn.gif" alt="info">
								<div class="mt-5">
									<h3>센터 골든타임 범위 예측 사용하기</h3>
									<p>특정 센터가 골든타임을 준수하는 범위를 알 수 있습니다.</p>
									<div class="d-flex">
										<a class="btn btn-outline-danger flex-fill" href="<%=application.getContextPath()%>/main/detail2">이 기능 살펴보기</a>
										<a class="btn btn-outline-success flex-fill" href="<%=application.getContextPath()%>/main/content2">이 기능 사용하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

