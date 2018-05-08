<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp"%>
<style>
body{
	color: #333 !important;
	padding-top: 0;
}
.userInfo ul li {
	padding: 5px 10px;
	margin-bottom: 15px;
	font-size: 16px;
	border-bottom: 1px dotted #ccc;
}
.userInfo ul li span{
	display: inline-block;
	width: 25%;
}
.profileImg span{
	color: #999;
	font-size: 0.9rem;
}
.profileImg img{
	width: 100px;
	height: 90px;
	border-radius: 50% 50%;
}
.address button{
	padding: 0 1.8rem;
	font-size: 14px;
}
.modify_form{
	margin-bottom: 0;
}
#modify{
	height: 36px;
    padding: 0;
    margin: 0;
    box-shadow: none;
    line-height: 1;
}
</style>
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
$(document).ready(function() {
	// url 파라미터 값 가져오기
	var curr_url = $(location).attr("href");
	var url_indexOf = curr_url.indexOf("?");
	var split = [];
	var paramVal;
	if(url_indexOf > 0){
		var param = curr_url.substring((url_indexOf + 1), curr_url.length);
		split = param.split("=");
		paramVal = split[1];
	}
	
	// 세션 확인
	var sessionId = "${member.email}";
	var sessionId2 = sessionId.split("@");
	if(sessionId == null || sessionId == ""){
		$(location).attr("href", "${path}/index.jsp");
	}
	/* else if(sessionId2[0] != paramVal){
		alert("마이페이지에 접속할 수 없습니다.");
		$(location).attr("href", "${path}/main/main.jsp");
	} */
	
	$('ul.tabs').tabs('select_tab', 'tab_id');
	
	// 수정하기
	$("#modify").click(function(){
		//var sendData = $(".modify_form").serialize();
		var sendData = "email=" + $("input[name=email]").val() + "&password=" + $("input[name=password]").val() + 
		"&address=" + $("#sample6_postcode").val() + "&address=" + $("#sample6_address").val() + 
		"&tel=" + $("input[name=tel]").val();
		console.log(sendData);
		$.ajax({
			type: "post",
			url: "${path}/member.do?method=update",
			data: sendData,
			success:function(data){
				$(location).attr("href", "${path}/no/mypage.jsp");
			}
		});
	});
	
	// 프로필 사진 수정하기
	$("#file").change(function(){
		var file = $("#file").val();
		var files = file.split("\\");
		fname = files[files.length - 1];
		var formData = new FormData($("#profile_update")[0]);
		$.ajax({
			type: "post",
			url: "${path}/member.do?method=profileUpdate",
			data: formData,
			processData: false,
			contentType: false,
			success:function(html){
				$("#profile").attr("src", "${path}/filefolder/" + fname);
			}
		});
	});
});

</script>
<body>
<%@ include file="/include/top.jsp"%>
<!-- contents -->
<div id="contents">
	<div class="container">
		<div class="row">
			<div class="col s12 center-align profileImg">
				<form id="profile_update" enctype="multipart/form-data">
					<input type="hidden" name="email" value="${member.email}">
					<img src="${path}/filefolder/${profile}" alt="profile image" id="profile" onclick="document.all.file.click()">
					<input type="file" id="file" name="profile" style="display:none">
				</form>
				<span>프로필 사진을 수정하시려면 이미지를 클릭하세요.</span>
				<br><br>
			</div>
			<div class="col s12 userInfo">
				<ul>
					<li><span>이메일</span> ${member.email}</li>
					<li>
						<span>생년월일</span> 
						<c:set var="birthValue" value="${member.birth}" />
						${fn:substring(birthValue,0,10)}
					</li>
					<li>
						<span>성별</span> 
						<c:choose>
							<c:when test="${member.gender == '0'}">남자</c:when>
							<c:otherwise>여자</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col s12 a2">
				<div class="col s12">
					<ul class="tabs">
				        <li class="tab col s3"><a class="active" href="#test1">정보 수정</a></li>
				        <!-- <li class="tab col s3"><a href="#test2">팔로잉 목록</a></li> -->
      				</ul>
    			</div>
				<div id="test1" class="col s12">
					<br>
					<div class="row">
						<form class="col s12 modify_form">
							<input type="hidden" name="email" value="${member.email}">
							<div class="row">
								<div class="input-field col s12">
									<input type="password" name="password" class="validate" value="${member.password}">
									<label for="password">비밀번호</label>
								</div>
								<div class="input-field col s12">
									<input type="password" name="password2" class="validate" value="${member.password}">
									<label for="password2">비밀번호 확인</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12 address">
									<c:set var="aValue" value="${member.address}" />
									<c:set var="aValLength" value="${fn:length(aValue)}" />
									<input type="text" id="sample6_postcode" class="validate col s6" name="address" value="${fn:substring(aValue,0,5)}">
									<label for="address">주소</label>
									<button type="button" onclick="sample6_execDaumPostcode()" class="waves-effect waves-light btn">우편번호 찾기</button>
								</div>
								<div class="input-field col s12">	
									<input type="text" id="sample6_address" class="validate" name="address" value="${fn:substring(aValue,6,aValLength)}">
								</div>
								<div class="input-field col s12">	
									<input type="hidden" id="sample6_address2" class="validate" name="address">
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input type="text" name="tel" class="validate" value="${member.tel}"> 
									<label for="tel">TEL</label>
								</div>
							</div>
						</div>				
						<div class="row">
							<div class="col s12 right-align">
								<div class="input-field inline">
									<input type="button" class="waves-effect waves-light btn" id="modify" value="수정하기">
								</div>
							</div>
						</div>				
					</form>
				</div>
			</div>
			<%-- <div id="test2" class="col s12">
				<div class="row">
					<ul class="collection">
						<li class="collection-item avatar">
							<img src="${path }/no/images/thumbs/01.jpg" alt="" class="circle"> 
							<span class="title">Title</span>
							<p>
								First Line <br> Second Line
							</p> 
							<a href="#!" class="secondary-content">
								<i class="material-icons">grade</i>
							</a>
						</li>
						<li class="collection-item avatar">
							<i class="material-icons circle">folder</i> 
							<span class="title">Title</span>
							<p>
								First Line <br> Second Line
							</p> 
							<a href="#!" class="secondary-content">
								<i class="material-icons">grade</i>
							</a>
						</li>
						<li class="collection-item avatar">
							<i class="material-icons circle green">insert_chart</i> 
							<span class="title">Title</span>
							<p>
								First Line <br> Second Line
							</p> 
							<a href="#!" class="secondary-content">
								<i class="material-icons">grade</i>
							</a>
						</li>
						<li class="collection-item avatar">
							<i class="material-icons circle red">play_arrow</i> 
							<span class="title">Title</span>
							<p>
								First Line <br> Second Line
							</p> 
							<a href="#!" class="secondary-content">
								<i class="material-icons">grade</i>
							</a>
						</li>
					</ul>
				</div>
			</div> --%>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>