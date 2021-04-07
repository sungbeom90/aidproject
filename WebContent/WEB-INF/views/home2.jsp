<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
	</head>
	
	<body>
				 	<div>
						<div>주소: ${dto.add}</div> <!-- getter매소드 -->
						<div>위도: ${dto.longi}</div>
						<div>경도: ${dto.lat}</div>
						<div>시간대: ${dto.time}</div>
						<div>관할내: ${dto.juri}</div>
						<div>의식상태: ${dto.juri}</div>
					</div>
				
	</body>
	
</html>