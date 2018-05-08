<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.icon_char{
padding: 0 36%;
}
.contn_2{
margin-top:2%;
}
.con_1{
padding-top: 2%;
}
.con_2{
padding:0 25%;
padding-top: 2%;
}
.ply_title{
width:80%;
}
.acc_ex{
height:111px;
resize:none;
}
.con_1 #counter{
position: absolute;
left:79.5%;
top: 56%;
}
#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
  color:white;
}
.lodding_bar{
position:absolute;
left:42%;
top:44%;
}
.file_name_show{
padding:0 16px;
margin-top:9%;
}
</style>
<script>

$(function() {
	$('.acc_ex').keyup(function (e){
        var content = $(this).val();
        if(content.length <= 200){
        $('#counter').html(content.length + '/200');
        }else{
        	$('#counter').html('200/200');	
        }
    });
    $('.acc_ex').keyup();
});

$(document).ready(function(){
	$(".init_video").hide(); // input type="file"을 안보이게 한다.
	$(".later_show").hide();
	$(".input_com").hide(); // 파일 업로드시에 적을 내용들을 일단 hide
	
	$(".acc_ex").keyup(function(){
		var text = $(this).val();
		console.log(text);
		if(text.length>200){
			console.log(text.substring(0,200));
			var test = text.substring(0,200);
			$(".acc_ex").val(test);
			$(".acc_ex").focus();
		}
	});
	$(".ply_title").keyup(function(){
		var length = $(".ply_title").val();
		if(length.length > 20){
			alert("최대 제목은 20글자 입니다.");
		}
	});
	
	var fname="";
	$(".icon_char").click(function(){ // 아이콘 div를 선택시
		$(".init_video").trigger('click'); // input file을 강제 클릭하게
	});
	$('.init_video').bind('change', function() { // input file에 데이터가 들어오면 실행시킨다.
		$(".click_area").hide();
		$(".input_com").show();
		
		var input = $(this).val();
		var file=input.split("\\");
		fname=file[file.length-1]; // 파일명 추출
		
		$(".input_com>.file_name_show span").text(fname);
		$(".later_show").show();
		$(".later_show source").attr("src",input);
	//	alert(this.files[0].size);
		});
	$(".submit_bt").click(function(){
		var test = $(".ply_title").val();
		if(test == null && test == ''){
			alert("제목을 입력해 주세요");
		}else{
		$(".lodding_bar").html("<img src='player/ajax_loader.gif'>")
        var formData = new FormData($("#plalyer")[0]);
        $.ajax({
            type : 'post',
            url : '${path}/Plyer.do?method=upload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
            	$(".lodding_bar").hide();
            	alert("성공");
            	$(location).attr("href",'${path}/Plyer.do?method=list');
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
		}
	});
	
	$("img").click(function(){
		$(location).attr("href","${path}/Plyer.do?method=list");
	});
	
});
</script>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
<div id="contents">
	<div class="logo_">
		<img src="player/logo.png" width="30%" height="25px;"/>
	</div>
	<div class="container">
		<form id="plalyer" method="post" enctype="multipart/form-data">
			<input type="hidden" name="email" value="${member.email}"/>
			<input type="hidden" name="nickname" value="${member.nickname}"/>
			
			<div class="row">
				<%-- <div class="col s12">
					<a href="${path}/Plyer.do?method=list"><i class="fas fa-long-arrow-alt-left" style="font-size:30px;"></i></a>
				</div> --%>
				<div class="col s12 contn_2 click_area" style="padding:0 5%;">
					<div class="valign-wrapper "style="width:100%;height:195px;border:1px solid black;">
						<div class="icon_char">
							<h5><i class="large material-icons">open_in_browser</i></h5>
						</div>
					</div>
					
					<input type="file" name="fname" class="init_video" value="" />
					<div class="center-align" style="width:100%;">
						<h5>파일을 등록해주세요</h5>
					</div>
				</div>
				<div class="input_com">
					<div class="lodding_bar">
					</div>
					<div class="file_name_show">
					파일명:<span></span>
					</div>
					<div class="lodding_bar">
					</div>
					<div class="col s12 contn_2" style="padding:0 5%;">
						<div class="con_1">
							<span>제목</span>
							
							<input type="text" name=title class="ply_title" maxlength="20" style="height:25px"/>
							<br/>
							<span>세부설명</span>
							<textarea rows="" cols="" name="explan" class="acc_ex"></textarea>
							<span id="counter">###</span>
						</div>
						
						<div>
							<span>연결주소</span>
							<input type="text" name="linker" value="" placeholder="자신이 운영하는 페이지 링크를 걸어두세요"/>
						</div>
						<div class="col s6 offset-s6 center-align">
							<input  type="button" class="submit_bt" value="등록">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>