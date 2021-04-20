<%@ page  contentType="text/html; charset=UTF-8"%>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>


<div class="left-side-bar" id="sidebar">
	<div class="d-flex">
		<a class="btn btn-outline-info flex-fill" href="<%=application.getContextPath()%>/">메인페이지로</a>
	</div>   
	<a class="left-side-bar_a" href="<%=application.getContextPath()%>/main/content">도착시간 예측</a>
     <form action="predict" method="post">
	     <div class="form-group">
	     	<table>
	     	<tbody>
	      	<tr>
	    	<td><input type="hidden" id ="pick_lat" name="pick_lat" value=""/></td>
	    	<td><input type="hidden" id="pick_long" name='pick_long' value=""/></td>
	    	<td><input type="hidden" id="address_emd" name='address_emd' value=""/></td>
	    	</tr>
	    	<tr>
	    	<th><label for="statmnt_tm">시간대 선택   : </label></th>
			<th><select class="form-control" id="statmnt_tm" name="statmnt_tm">
				<option value="0">00시</option>
				<option value="1">01시</option>
				<option value="2">02시</option>
				<option value="3">03시</option>
				<option value="4">04시</option>
				<option value="5">05시</option>
				<option value="6">06시</option>
				<option value="7">07시</option>
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
			</select></th>
			</tr>
			<tr>
		    <th><label for="jurisd">관할여부 선택 : </label></th>
			<th><select class="form-control" id="jurisd" name="jurisd">
				<option value="0">관할 내</option>
				<option value="1">관할 외</option>		
			</select></th>
			</tr>
			<tr>
			<th><label for="conscs">의식상태 선택 : </label></th>
			<th><select class="form-control" id="conscs" name="conscs">
				<option value="0">깨어있음(Alert)</option>
				<option value="1">나른함(Drowsy)</option>
				<option value="2">통증.자극에 반응(Pain)</option>
				<option value="3">반 혼수상태(Semicomma)</option>
				<option value="4">혼미함(Stupor)</option>
				<option value="5">혼수상태(Coma)</option>
				<option value="6">둔함(Obtunded)</option>
				<option value="7">언어지시에 반응(Voice)</option>				
			</select></th>
			</tr>
			<tr>
			<th><label for="occurplc">사고장소 선택 : </label></th>
			<th><select class="form-control" id="occurplc" name="occurplc">
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
				<option value="17">주택가</option>
				<option value="18">집단거주시설</option>
				<option value="19">학교/교육시설</option>						 
			</select></th>
			</tr>
			</tbody>
			<tr>
			<td><input id="btn-01" class="btn btn-info btn-sm flex-fill" type="submit" value="입력"></td>
			<td><input id="btn-02" class="btn btn-danger btn-sm flex-fill" type="reset" value="취소"></td>
			</tr>
			</table>
		</div>
	</form>

       <a class="left-side-bar_a" href="<%=application.getContextPath()%>/main/content2">골든타임 범위 예측</a>
         <form action="predict2" method="post">
         	<div class="form-group">
	         	<table>
	         	<tbody>
	          	<tr>

			    <th><label for="safe_senter">센터명 입력 : </label></th>
				<th><input class="form-control" type="text" id="safe_senter" name="safe_senter" value="안양119안전센터"></th>
				</tr>						    	
			    <tr>
			    <th><label for="move_tm">소요시간 입력 : </label></th>
				<th><input class="form-control" type="text" id="move_tm" name="move_tm" value="5.0" readonly></th>
				</tr>
				<tr>
			    <th><label for="statmnt_tm2">시간대 선택 : </label></th>
				<th><select class="form-control" id="statmnt_tm2" name="statmnt_tm">
						<option value="0">00시</option>
						<option value="1">01시</option>
						<option value="2">02시</option>
						<option value="3">03시</option>
						<option value="4">04시</option>
						<option value="5">05시</option>
						<option value="6">06시</option>
						<option value="7">07시</option>
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
					</select></th>
				</tr>
				<tr>
				<th><label for="jurisd2">관할여부 선택 : </label></th>
				<th><select class="form-control" id="jurisd2" name="jurisd">
						<option value="0" selected>관할 내</option>
						<option value="1">관할 외</option>		
					</select></th>
				</tr>
				<tr>
				<th><label for="conscs2">의식상태 선택 : </label></th>
				<th><select class="form-control" id="conscs2" name="conscs">
						<option value="0">깨어있음(Alert)</option>
						<option value="1">나른함(Drowsy)</option>
						<option value="2">통증.자극에 반응(Pain)</option>
						<option value="3">반 혼수상태(Semicomma)</option>
						<option value="4">혼미함(Stupor)</option>
						<option value="5" selected>혼수상태(Coma)</option>
						<option value="6">둔함(Obtunded)</option>
						<option value="7">언어지시에 반응(Voice)</option>				
					</select></th>
				</tr>
				</tbody>
				<tr>
				<td><input id="btn-01" class="btn btn-info btn-sm flex-fill" type="submit" value="입력"></td>
				<td><input id="btn-02" class="btn btn-danger btn-sm flex-fill" type="reset" value="취소"></td>
				</tr>
				</table>
			</div>
		</form>
</div>