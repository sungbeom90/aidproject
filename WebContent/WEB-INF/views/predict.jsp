<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>			
	</head>
	
	<body>
		<h1>정보전달테스트</h1>
		<form action="predict" method="post">
			<label for="latitude">위도 입력 : </label>
		 	<input type="text" id="latitude" name="latitude" value="32.123213"><br><br>
		 	<label for="longitude">경도 입력 : </label>
			<input type="text" id="longitude" name="longitude" value="22.142131"><br><br>
					
			<label for="emd">읍면동 입력 : </label>
			<input type="text" id="emd" name="emd" value="가락동"><br><br>
			
			<label for="tm">시간대 선택 : </label>
			<select id="tm" name="tm">
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
					  
			<label for="conscs">의식상태 선택 : </label>
			<select id="conscs" name="conscs">
				<option value="0">A(Alert)</option>
				<option value="1">Drowsy</option>
				<option value="2">P:통증.자극에 반응</option>
				<option value="3">Semicomma</option>
				<option value="4">Stupor</option>
				<option value="5">U(Coma)</option>
				<option value="6">V(Obtunded)</option>
				<option value="7" selected>V:언어지시에 반응</option>				
			</select>
						  
			<label for="occurplc">사고장소 선택 : </label>
			<select id="occurplc" name="occurplc">
				<option value="0">가정</option>
				<option value="1">고속도로</option>
				<option value="2">공공장소</option>
				<option value="3">공장/산업/건설시설</option>
				<option value="4">기타</option>
				<option value="5">도로외교통지역</option>
				<option value="6">바다/강/산/논밭</option>
				<option value="7">사무실</option>
				<option value="8">상업시설</option>
				<option value="9">숙박시설</option>
				<option value="10">스키장</option>
				<option value="11">오락/문화시설</option>
				<option value="12">운동시설</option>
				<option value="13">유흥장소</option>
				<option value="14">의료관련시설</option>
				<option value="15">일반도로</option>
				<option value="16">일차산업장</option>					
				<option value="17" selected>주택가</option>
				<option value="18">집단거주시설</option>
				<option value="19">학교/교육시설</option>						 
			</select>
			
			<label for="jur">관할여부 선택 : </label>
			<select id="jur" name="jur">
				<option value="0">관할 내</option>
				<option value="1">관할 외</option>		
			</select>
			
			<div class="d-flex">
				<input class="btn btn-info btn-sm flex-fill" type="submit" value="입력"><br/>
				<input class="btn btn-danger btn-sm flex-fill" type="reset" value="취소"><br/>
			</div>
		</form>
	</body>
</html>