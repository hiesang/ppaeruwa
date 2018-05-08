<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<style>
.a0 {
	border: 1px solid #ccc;
}

.a1 {
	margin: 0 auto;
	text-align: center;
}

.a2 {
	text-align: center;
}

.a3 {
	height: 150px;
	width: 88%;
	border-radius: 5px;
}

.a4 {
	
}

.a5 {
	border: 1px solid #ccc;
	width: 88%;
	margin: 0 auto;
	border-radius: 5px;
}

.a7 {
	text-align: center;
	margin-top: 8px;
}

.b2 {
	margin: 0 auto;
	color: powderblue;
}

#b3 {
	margin: 0 auto;
	color: powderblue;
}

#b4 {
	margin: 0 auto;
	color: powderblue;
}

.publicch {
	color: grey;
	font-size: 10px;
}

#contents2 {
	padding: 13px 0;
}

.publicmar {
	margin-top: 6px;
}
.calwidth{
width:79px;
}

.calheight{
height:60px;
}

.filepadding{
padding:0px 6px;
}
</style>
<script>
$(document).ready(function() {

	
	

	
		$("#b2").click(function() {
			alert("sdf");
		});
		$("#b5").click(function() {
			alert("sdf");
		});
		$('ul.tabs').tabs('select_tab', 'tab_id');
	
		//이게 오늘의 일기
		$(".diaryin").click(
				function() {
					if (confirm("수정하시겠습니까?")) {
						$("#wdate1").attr("value",$("#date-input").val());
						alert($("#wdate1").val());
						$(".diaryform1").attr("action","${path}/timeline.do?method=modinsert");
						$(".diaryform1").submit();
					}
				});
	
		//0이 리플렉트
		$(".reflectin").click(function() {
					if (confirm("등록하시겠습니까?")) {
						$("#wdate0").attr("value",$("#date-input").val());
						$(".diaryform0").attr("action","${path}/timeline.do?method=rinsert");
						$(".diaryform0").submit();
					}
				});
		
		$("#hidden_file_add").hide();
		
		$("#fileadd").click(function(){
			$("#hereadd").eq(0).prepend($("#adddiv").children().clone());
		});
		
		
	
	$("#date-input").click(function(){
		var tt = $("#date-input").val();
	});
	

	var wdate = "${diarymod.wdate}"
	var cy = wdate.substring(0,4);
	var cm = wdate.substring(5,7);
	var cd = wdate.substring(8,10);
	var ct = cm+"/"+cd+"/"+cy;
	$("#date-input").attr("value",ct);
});
</script>
<body>
	<%@ include file="/include/top.jsp"%>
	<!-- contents -->
	<div>
		<!-- container -->
		<div class="container">


			<div>
				<div align="center">
					<div class="calwidth calheight">
						<c:import url="/cal/form.jsp"/>
					</div>
				</div>

				<div class="row">
					<div class="col s12">
						<ul class="tabs">
							<li class="tab col s3 disabled"><a href="#test1">반성 일기</a></li>
							<li class="tab col s3"><a class="active" href="#test2">오늘의
									일기</a></li>


						</ul>
						<br>
					</div>
					<div id="test1" class="col s12">
						<div class="col s12 a2">
							<form class="diaryform0" method="post">
							<input type="hidden" name="wdate"  id="wdate0"/>
							<input type="hidden" name="email" value="${member.email}"/>
								<textarea class="a3" row="20" cols="50" name="comments"
									placeholder="글을 입력하세요"></textarea>
									
							</form>
						</div>
						<br> <br>

						<div class="col s12 a6">
							<br>
							<div class="a7">
								<button class="btn waves-effect waves-light reflectin"
									type="button" name="action">
									등록하기 <i class="material-icons right">send</i>
								</button>

							</div>

						</div>
					</div>
					<div id="test2" class="col s12">
					<form class="diaryform1" method="post"  enctype="multipart/form-data">
						<div class="col s12 a2">
							
					<input type="hidden"  name="wdate"  id="wdate1"/>
					<input type="hidden" name="email" value="${member.email}"/>
					<input type="hidden" name="no" value="${diarymod.no}"/>
								<textarea class="a3" row="20" cols="50" name="comments"
									placeholder="글을 입력하세요">${diarymod.comments}</textarea>
									
							
						</div>

						<div class="col s12">
							<div>
							</div>
							<div class="a5 center-align filepadding">
								<span style="color : powderblue;" id="fileadd">파일추가</span>
								<div id="hereadd"></div>
								<div class="valign-wrapper ">
								    <div class="file-field input-field">
								      <div class="btn">
								        <span>File</span>
								        <input type="file" name="report" multiple>
								      </div>
								      <div class="file-path-wrapper">
								        <input class="file-path validate" type="text" placeholder="Upload  files">
								      </div>
								    </div>
								<i class="material-icons medium b2" >add_a_photo</i>
								</div>
								
							</div>
							

						</div>
						<br> <br>
						<div class="col s12 a6">
							<div class="publicmar">
								<div class="switch col s8 offset-s4" align="right">
									<span class="publicch">(공개설정)&nbsp;&nbsp; 
									</span>
									
									<label>공개
									<input type="checkbox" name="publickey" value="1"><span class="lever"></span>비공개
									</label>
								</div>
								<br>
								<div class="col s12 a7">
									<button class="btn waves-effect waves-light diaryin"
										type="button" name="action">
										등록하기 <i class="material-icons right">send</i>
									</button>
								</div>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		
		<div id="hidden_file_add">
		<div id="adddiv">
			<div class="valign-wrapper" >
			    <div class="file-field input-field">
			      <div class="btn">
			        <span>File</span>
			        <input type="file" name="report" multiple>
			      </div>
			      <div class="file-path-wrapper">
			        <input class="file-path validate" type="text"   placeholder="Upload  files">
			      </div>
			    </div>
				<i class="material-icons medium b2" >add_a_photo</i>
			</div>
		</div>
		</div>
		
		<%@ include file="/include/footer.jsp"%>
</body>
</html>