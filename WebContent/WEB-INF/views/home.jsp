<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>home</title>
		<link rel="stylesheet" href="common.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/preresult.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/WEB-INF/views/main.jsp">
	</head>
	
	<body>
		<div class="wrap">
			<%-- 공통 헤더 --%>
			<%--<jsp:include page="/WEB-INF/views/include/header.jsp"/> <!-- 실행을하고 결과를 넣는다. --> --%>
			
			<%-- 내용 --%>
			<div class="mainCenter mt-5">
				<%-- 공통 메뉴 --%>
				
				<div class="content container">
					<div class="sector">
						<h1>구급시간에 관한 프로젝트 웹 구현</h1>
						<img src="<%=application.getContextPath()%>/resources/img/homeimage.jpg" alt="homeimage">
					</div>
				</div>
				
				
				<jsp:include page="/WEB-INF/views/include/menu.jsp"/>
			</div>
		</div>
	</body>
</html>

