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
					<h1>센터 골든타임 범위 예측 사용하기</h1>
					<br/>								
					<div class="sector">					
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail2_img1.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>1.안전센터 위치 확인</h5>
								<p>1. 골든타임 범위 예측을 누른다 </p>
								<p>2. 핀으로 표시된 안전센터를 누르면 이름을 확인할 수 있다.</p> 
							</div>
						</div>
					</div>
					
					<div class="sector">
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail2_img2.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>2. 골든타임 범위 예측하기 위한 조건 입력</h5>
								<p>1. 우측 상단에 센터명을 검색하여 검색한 센터의 정보와 위치를 확인할 수 있다.</p>
								<p>2. 좌측 사이드바에서 센터명, 시간대, 관할 여부, 의식상태를 선택하고  입력버튼으로 예측을 한다. </p>
								<p>-센터명 : 귀인119안전센터, 안양119안전센터, 석수119안전센터 등 </p>
								<p>-소요시간 : 5분 (고정) </p>
								<p>-시간대 : 00시, 01시, 02시, 03시....23시 </p>
								<p>-관할여부 : 관할 내/외 </p>
								<p>-의식상태 : 깨어있음, 나른함, 통증.자극에 반응 등 </p>
							</div>
						</div>
					</div>
					
					<div class="sector">
						<div class="d-flex">
							<div class="info_detail">
							<img class="img" src="<%=application.getContextPath()%>/resources/img/info_detail2_img3.PNG" alt="info">
							</div>												
							<div class="info_detail">
								<h5>3.출동센터가 이동 가능한 범위 확인</h5>
								<p>1. 입력한 센터명을 중심으로 5분이란 시간안에 이동 가능한 범위를 원으로 나타낸 것을 볼 수 있다.</p>
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