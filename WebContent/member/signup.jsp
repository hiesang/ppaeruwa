<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('sample6_address').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample6_address2').focus();
		}
	}).open();
}
</script>
<script>
$(document).ready(function(){
	// 세션 확인
	var sessionId = "${member.email}";
	if(sessionId != null && sessionId != ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}
	
	// 아이디 중복체크
	$("#du_confirm").click(function(){
		var emailInputVal = $("input[name=email]").val();
		$.ajax({
			type: "post",
			url: "${path}/member.do?method=duConfirm",
			async: false,
			data: {email : emailInputVal},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				alert(data);
			}
		});
	});
	
	// 이메일 인증
	var uuid;
	$("#check_user").click(function(){
		var emailInputVal = $("input[name=email]").val();
		if(emailInputVal != null && emailInputVal != ""){
			$("#check_user").hide();
			$(".checkEmail > .input-field").append("<input type='text' id='uuid' placeholder='인증번호 입력'>");
			$(".checkEmail > .checkBtn").append("<button type='button' class='waves-effect waves-light btn' style='padding:0 0.5rem;' id='uuidCheck'>확인</button>");
			$.ajax({
				type: "post",
				url: "${path}/member.do?method=checkUser",
				async: false,
				data: {email : emailInputVal},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					uuid = data;
					alert("메일을 발송했습니다.");
				}
			});
		}else{
			alert("이메일을 입력하세요.");
		}
	});
	
	// 이메일 인증번호 확인
	$(document).on("click", '#uuidCheck', function(){
		if($("#uuid").val() == uuid){
			$(".checkEmail > .input-field > input").hide();
			$(".checkEmail > .checkBtn > button").hide();
			$(".checkEmail > .input-field").append("<span style='color:blue'>인증되었습니다.</span><br><br>");
		}else{
			alert("인증번호가 잘못되었습니다. 다시 입력하세요.");
		}
	});
	
	// 비밀번호 입력 체크
	$("#pass2").keyup(function(){
		if($("#pass1").val() == $("#pass2").val()){
			$("#result").css("color", "blue");
			$("#result").html("비밀번호가 일치합니다.");
		}else{
			$("#result").css("color", "#ff0000");
			$("#result").html("비밀번호가 일치하지 않습니다.");
		}
	});
	$("#pass1").focus(function(){
		if($("#pass2").val() != "" && $("#pass2").val() != null){
			$("#pass1").keyup(function(){
				if($("#pass1").val() == $("#pass2").val()){
					$("#result").html("비밀번호가 일치합니다.");
				}else{
					$("#result").html("비밀번호가 일치하지 않습니다.");
				}
			});
		}
	});
	
	// 숫자만 입력
	$("input[name=height]").keyup(function(){
		this.value = this.value.replace(/[^0-9]/g, '');
	});
	$("input[name=weight]").keyup(function(){
		this.value = this.value.replace(/[^0-9]/g, '');
	});
	$("input[name=goalw]").keyup(function(){
		this.value = this.value.replace(/[^0-9]/g, '');
	});
	$("input[name=goalk]").keyup(function(){
		this.value = this.value.replace(/[^0-9]/g, '');
	});
	
	// 기초대사량 구하기
	var now = new Date();
	var year = now.getFullYear();
	$("#goalw").focus(function(){
		if($("input[name=weight]").val() != null && $("input[name=weight]").val() != "" 
		&& $("input[name=height]").val() != null && $("input[name=height]").val() != ""){
			var thisWeight = parseInt($("input[name=weight]").val());
			var thisHeight = parseInt($("input[name=height]").val());
			var thisAge = (parseInt(year) - parseInt($("input[name=birth]").val().substring(0, 4))) + 1;
			//console.log(thisWeight + ":" + thisHeight + ":" + thisAge + ":" + year);
			var result;
			if($("input[name=gender]:checked").val() == 0){
				result = Math.floor(66 + (13.8 * thisWeight) + (5 * thisHeight) - (6.8 * thisAge));
				$(".signup_kcal").html($("input[name=name]").val() + "님의 기초대사량은 " + result + "입니다.");
			}else if($("input[name=gender]:checked").val() == 1){
				result = Math.floor(655 + (9.6 * thisWeight) + (1.8 * thisHeight) - (4.7 * thisAge));
				$(".signup_kcal").html($("input[name=name]").val() + "님의 기초대사량은 " + result + "입니다.");
			}
		}
	});
	
	// 가입정보 확인하기
	$("#confirm").click(function(){
		if($("input[name=email]").val() == null || $("input[name=email]").val() == ""){
    		alert("이메일을 입력하세요.");
    		$("input[name=email]").focus();
    		return;
    	}else if($("input[name=nickname]").val() == null || $("input[name=nickname]").val() == ""){
    		alert("닉네임을 입력하세요.");
    		$("input[name=nickname]").focus();
    		return;
    	}else if($("input[name=tel]").val() == null || $("input[name=tel]").val() == ""){
    		alert("휴대폰 번호를 입력하세요.");
    		$("input[name=tel]").focus();
    		return;
    	}else if($("input[name=name]").val() == null || $("input[name=name]").val() == ""){
    		alert("이름을 입력하세요.");
    		$("input[name=name]").focus();
    		return;
    	}else if($("input[name=birth]").val() == null || $("input[name=birth]").val() == ""){
    		alert("생년월일을 입력하세요.");
    		$("input[name=birth]").focus();
    		return;
    	}else if($("#pass1").val() == null || $("#pass1").val() == ""){
    		alert("비밀번호를 입력하세요.");
    		$("#pass1").focus();
    		return;
    	}else if($("#pass2").val() == null || $("#pass2").val() == ""){
    		alert("비밀번호를 입력하세요.");
    		$("#pass2").focus();
    		return;
    	}else if($("input[name=address]").val() == null || $("input[name=address]").val() == ""){
    		alert("주소를 입력하세요.");
    		$("input[name=address]").focus();
    		return;
    	}else if($("input[name=height]").val() == null || $("input[name=height]").val() == ""){
    		alert("키를 입력하세요.");
    		$("input[name=height]").focus();
    		return;
    	}else if($("input[name=weight]").val() == null || $("input[name=weight]").val() == ""){
    		alert("몸무게를 입력하세요.");
    		$("input[name=weight]").focus();
    		return;
    	}else if($("input[name=goalw]").val() == null || $("input[name=goalw]").val() == ""){
    		alert("목표 몸무게를 입력하세요.");
    		$("input[name=goalw]").focus();
    		return;
    	}else if($("input[name=goalk]").val() == null || $("input[name=goalk]").val() == ""){
    		alert("목표 칼로리를 입력하세요.");
    		$("input[name=goalk]").focus();
    		return;
    	}
		
		$('.modal').modal();
		
		var inputAddress = "";
		$("input").each(function(index){
			var inputVal = $(this).val();
			
			if(index >= 1 && index <= 2){
				var inputIndex = $("input").eq(index + 1).val();
				$("td").eq(index).html(inputIndex);
			}else if(index == 3){
				var inputRadioVal = $("input[type=radio]:checked").val();
				if(inputRadioVal == 0){
					inputRadioVal = "남자";
					$("td").eq(index).html(inputRadioVal);	
				}else if(inputRadioVal == 1){
					inputRadioVal = "여자";
					$("td").eq(index).html(inputRadioVal);
				}
			}else if(index >= 4 && index <= 8){
				var inputIndex = $("input").eq(index + 2).val();
				$("td").eq(index).html(inputIndex);
			}else if(index == 9 || index == 10 || index == 11){
				inputAddress += $("input").eq(index + 1).val() + " ";
				$("td").eq(8).html(inputAddress);
			}else if(index >= 12){
				var inputIndex = $("input").eq(index + 1).val();
				$("td").eq(index - 3).html(inputIndex);
			}else{
				$("td").eq(index).html(inputVal);
			}
		});
	});
    
	// 수정하기
    $("#modify").click(function(){
		$('#modal1').modal('close');
    });
    
	// 가입완료
    $("#submit").click(function(){
    	var emailInputVal = $("input[name=email]").val();
		$.ajax({
			type: "post",
			url: "${path}/member.do?method=duConfirm",
			async: false,
			data: {email : emailInputVal},
			success:function(data){
				if(data == "사용 중인 아이디입니다."){
					alert(data);
				}else{
					$("#pass2").remove();
					$("form").attr("action", "${path}/member.do?method=insert");
			    	$("form").submit();
				}
			}
		});
    });	
});
</script>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents" class="signup">
	<div class="container">
		<form method="post">
			<div class="row">
				<div class="col s1"></div>
				<div class="col s10">
					<div class="row">
						<div class="input-field col s8">
							<input placeholder="XXXX@gmail.com" type="email" id="email" name="email" class="validate">
							<label for="email">이메일</label>
						</div>
						<div class="col s4">
							<br>
							<button type="button" class="waves-effect waves-light btn" id="du_confirm" style="padding:0 0.5rem;">중복확인</button>
						</div>
						<div class="checkEmail">
							<div class="input-field col s6">
							</div>
							<div class="col s6 right-align checkBtn">
								<br>
								<button type="button" class="waves-effect waves-light btn" id="check_user" style="padding:0 0.5rem;">인증번호 발송</button>
							</div>
						</div>
						<div class="input-field col s12">
							<input type="text" placeholder="닉네임" id="nickname" name="nickname" class="validate">
							<label for="nickname">닉네임</label>
						</div>
						<div class="input-field col s12">
			          		<input placeholder=" -은 제외하고 입력하세요" id="tel" name="tel" type="number" class="validate">
			         		<label for="tel">휴대폰 번호</label>
						</div>
						<div class="col s12 center-align">
							<input class="with-gap" name="gender" type="radio" id="male" value="0" checked/>
						    <label for="male">남</label>
							<input class="with-gap" name="gender" type="radio" id="female" value="1"/>
						    <label for="female">여</label>
						    <br><br>
						</div>
						<div class="input-field col s6">
							<input placeholder="이름" id="name" name="name" type="text" class="validate">
			          		<label for="name">이름</label>
			       		</div>
			       		<div class="input-field col s6">
			          		<input placeholder="YYYYMMDD" id="birth" name="birth" type="text" class="validate">
			          		<label for="birth">생년월일</label>
			       		</div>
			       		<div class="input-field col s12">
			       			<input type="password" placeholder="영문, 숫자를 포함하여 6~12글자를 입력하세요." class="validate" name="password" id="pass1" 
			       			 	  minlength="6" maxlength="12"/>
							<label for="pass1">비밀번호</label>
						</div>
						<div class="input-field col s12">
			       			<input type="password" placeholder="비밀번호 확인" class="validate" name="password" id="pass2" 
			       			 	  minlength="6" maxlength="12"/>
			       			<div id="result"></div>
							<label for="pass2">비밀번호확인</label>
						</div>
			       		<!-- <div class="input-field col s12">
			       			<input type="text" placeholder="시/구/동" class="validate" name="address" id="address"/>
			       			<label for="address">주소</label>
			       		</div> -->
			       		<div class="input-field col s12">
			       			<input type="text" id="sample6_postcode" class="validate col s6" name="address" placeholder="우편번호">
							<button type="button" onclick="sample6_execDaumPostcode()" class="waves-effect waves-light btn" style="padding:0 1.5rem;">우편번호 찾기</button>
						</div>
						<div class="input-field col s12">
							<input type="text" id="sample6_address" class="validate" name="address" placeholder="주소">
							<label for="address">주소</label>
							<input type="text" id="sample6_address2" class="validate" name="address" placeholder="상세주소">
			       		</div>
			       		<div class="input-field col s6">
							<input placeholder="숫자만 입력하세요.(cm)" id="height" type="text" class="validate" name="height" style="ime-mode:disabled;">
			          		<label for="height">키</label>
			       		</div>
			       		<div class="input-field col s6">
			          		<input placeholder="숫자만 입력하세요.(kg)" id="weight" type="text" class="validate" name="weight" style="ime-mode:disabled;">
			          		<label for="weight">몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="숫자만 입력하세요.(kg)" id="goalw" type="text" class="validate" name="goalw" style="ime-mode:disabled;">
			          		<label for="goalw">목표 몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="숫자만 입력하세요.(kcal)" id="goalk" type="text" class="validate" name="goalk" style="ime-mode:disabled;">
			          		<div class="sign_kcal_show">
			          			<span class="signup_kcal"></span>
			          		</div>
			          		<label for="goalk">목표 칼로리</label>
			       		</div>
			       		<input type="hidden" name="profile" value="profile_img.png">
			       		<div class="col s12  center-align">
			       			<br>
			       			<a class="waves-effect waves-light btn modal-trigger" href="#modal1" id="confirm">확인</a>
			       			<!-- <button type="button" id="confirm">확인</button> -->
			       			<br><br><br><br>
			       		</div>
					</div>
				</div>
				<div class="col s1"></div>
			</div>
		</form>
	</div>
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<table>
				<tbody>
					<tr>
						<th>이메일</th>
						<td></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td></td>
					</tr>
					<tr>
						<th>성별</th>
						<td></td>
					</tr>
					<tr>
						<th>이름</th>
						<td></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td></td>
					</tr>
					<tr>
						<th>비밀번호<br>확인</th>
						<td></td>
					</tr>
					<tr>
						<th>주소</th>
						<td></td>
					</tr>
					<tr>
						<th>키</th>
						<td></td>
					</tr>
					<tr>
						<th>몸무게</th>
						<td></td>
					</tr>
					<tr>
						<th>목표 몸무게</th>
						<td></td>
					</tr>
					<tr>
						<th>목표 칼로리</th>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<input type="button" class="modal-action waves-effect waves-green btn" id="modify" value="수정하기">
			<input type="submit" value="가입완료" class="waves-effect waves-light btn" id="submit">
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>