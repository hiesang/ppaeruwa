<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/top.jsp" %>
<style>

.myweightmark{
width:24px;
height:24px;
position:relative;
}

.weightno{
font-size:70px;
font-weight:bold;
}

.canvassize{
position:relative;
}
.circleposition{
position:absolute;
left:10px;
top:5px;
z-index:3;
}
#myCanvas{
position:absolute;
z-index:2;
}
.weight_text_bold{
font-weight:bold;
color : grey;
}
.weight_text_size{
font-size:20px;
}
.kg_margin{
margin-bottom:0px;
}

.weight_tabla tr{
border-bottom: 1px solid #dedede;
font-size:14px;
font-weight:bold;
}
.mbuttoncenter{
text-align:center;
}
.mohead{
text-align:center;
font-weight:bold;
font-size:18px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var sessionId = "${member.email}";
	if(sessionId == null && sessionId == ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}
	var hi = "${member.goalw}";
	$('.modal').modal();
// 	$(".myweightmark").animate({left:'100'},2000, easeOutElastic);
$( ".myweightmark" ).animate({ left: 100}, {duration: 1000,step: function( now, fx ){$( ".myweightmark" ).css( "left", now );
    }
  });
	/* 캔버스 사이즈구하기*/
	var cw = $(".canvassize").width();
	/* 화면사이즈에 맞게 그리드의 가로 길이캔버스의 높이,너비지정 */
	$("#myCanvas").attr("width", cw);
	/* 써클에대한 SVG의 width값 지정 */
	$("#mysvg").attr("width",cw);
	/* 오른쪽 써클의 x위치 설정 */
	$(".circleposition").eq(1).attr("cx",cw-7);
	
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
	/* 실질적 드로잉 */
	ctx.moveTo(5,8);
	ctx.lineTo(cw-4,8);
	ctx.stroke();
	
	/* 달력관련*/
	 $("#date-input").click(function(){
		var tt = $("#date-input").val();
	});
	
	var Now = new Date();
	var cy = Now.getFullYear();
	var cm = Now.getMonth()+1<10?"0"+(Now.getMonth()+1):Now.getMonth()+1;
	var cd = Now.getDate()<10?"0"+Now.getDate():Now.getDate();
	var ct = cm+"/"+cd+"/"+cy;
	$("#date-input").attr("value",ct);
	
	$(".writehide2").hide();
	$(".writehide1").click(function(){
		$(".writehide2").fadeIn();
		$(".writehide1").fadeOut();
	});
	$(".writehide2 button").click(function(){
		$(".writehide1").fadeIn();
		$(".writehide2").fadeOut();
	});
	
	$(".win").click(
			function() {
				
				if (confirm("등록하시겠습니까?")) {
					$("#wdate1").attr("value",$("#date-input").val());
					$(".wform").attr("action","${path}/weight.do?method=winsert");
					
					$(".wform").submit();
				}
			});
	

	$(".win2").click(function(){
		if (confirm("수정하시겠습니까?")){
			$(".wform2").attr("action","${path}/weight.do?method=wupdate");
			$(".wform2").submit();
			
		}
	});

	$("#do").text("${member.goalw}")
	
	$(".hoi").click(function(){
		var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			var wda=td.eq(0).text();
			var wei=td.eq(1).text() ;
			
			td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			console.log("배열에 담긴 값 : "+tdArr);
			str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + wda + "</font>" +
			", 아이디 : <font color='red'>" + wei + "</font>";	
			$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
			var x=wda
			var y = x.substring(0,4)+x.substring(5,7)+x.substring(8,10)+x.substring(11,13)+
			x.substring(14,16)+x.substring(17,19);
			alert(y);
			$(".hihi").val(y);
			console.log($(".hihi").val());
			$("#ex2_Result2").html(str);
			   $(".delform").attr("action","${path}/weight.do?method=wlist");
			$(".delform").submit(); 
			
	});
	$(".goal").click(function(){
		$(this).val("");
	});
});
</script>
<!-- contents -->
<div class="contents2">
	<div class="container">
		<div class="row">
			<div class="col s4 offset-s4 center-align">
				<span class="weightno">${weight.weight}</span><span>kg</span>
			</div>
		</div>
		
		<div class="row">
			<div class="col s12">
				<div class="canvassize">
					<div class="row kg_margin">
						<div class="myweightmark">
							<i class="small material-icons">directions_run</i>
						</div>
						<div class="col s2">
							<span class="weight_text_bold weight_text_size">${member.weight}kg</span>
						</div>
						<div class="col s2 offset-s8 right-align">
							<span class="right-align weight_text_bold weight_text_size" id="do">${member.goalw}kg</span>
						</div>
					</div>
					<div>
						<canvas id="myCanvas" height="20" ></canvas>
					</div>
					<div>
						<svg height="20" id="mysvg">
  							<circle cx="7" cy="8" r="6"  stroke="green" stroke-width="1" fill="black"   class="circleposition"/>
  							<circle cx="50" cy="8" r="6"  stroke="green" stroke-width="1" fill="black"   class="circleposition"/>
						</svg>
					</div>
					
					<div class="row">
						<div class="col s2">
							<span class="weight_text_bold">시작체중</span>
						</div>
						<div class="col s2 offset-s8 right-align">
							<span class="right-align weight_text_bold " ><a class="modal-trigger a1" href="#modal1">목표체중</a></span>
						</div>
					</div>
					<div class="row">
						<div class="col s4">
					    	<span class="reportcaption">DAILY WEIGHT</span><br>
					    	<span>체중기록</span>
				    	</div>
				    	<div class="col s5 offset-s3 writehide1">
				    		<button class="btn waves-effect waves-light pulse" type="button" name="action">체중기록하기
								<i class="material-icons right">send</i>
							</button>
				    	</div>
			    	</div>
			    	
			    	
			    	<form class="wform" method="post">
			    	<input type="hidden" name="wdate" id="wdate1"/>
			    	<div class="writehide2">
				    	<div class="row">
							<div class="col s5">
								<c:import url="/cal/form.jsp"/>
							</div>
							
					    	<div class="col s3">
					    		<input type="hidden" name="email" value="${member.email}"/>
								<input name="weight" id="last_name" type="text" class="validate"  placeholder="kg" style="margin-top:14px;margin-bottom:0;">
								
							</div>
							<div>
								<button class="btn waves-effect waves-light win" type="button" name="action">저장하기</button>
							</div>
						</div>
					</div>
					</form>
					
				
					<div>
			    		<div>
			    			<table class="weight_tabla hoi2">
					<c:forEach var="tl" items="${weilist}">
			    				<tr><td>${tl.wdate}</td><td>${tl.weight }</td><td><i class="material-icons hoi">delete</i></td></tr>
			    	</c:forEach> 
			    		</table>
			    			
			    		</div>
			    	</div>
			    	<form class="delform" method="post">
			    	<input class="hihi" type="hidden" name="wdate" value=""/>
			    	<input class="hiho" type="hidden" name="email" value="${member.email }"/>
			    	</form>
			    			
			    	<div class="col-lg-12" id="ex2_Result1" ></div> 
					<div class="col-lg-12" id="ex2_Result2" ></div> 
				</div>
			</div>
		</div>			
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>

<div id="modal1" class="modal">
	<div class="modal-content">
	<h5 class="center-align">목표수정</h5>
		<form class="wform2" method="post">
			<div class="row">
				<div class="col s1"></div>
				<div class="col s10">
					<div class="row">
			       		<div class="input-field col s6">
							<input placeholder="cm" id="height" type="number" class="validate goal" name="height" value="${member.height}">
			          		<label for="tail">키</label>
			       		</div>
			       		<div class="input-field col s6">
			          		<input placeholder="kg" id="weight" type="number" class="validate goal" name="weight" value="${member.weight}"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="kg">몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="kg" id="goalw" type="number" class="validate goal" name="goalw" value="${member.goalw}"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="fukg">목표 몸무게</label>
			       		</div>
			       		<div class="input-field col s12">
			          		<input placeholder="kcal" id="goalk" type="number" class="validate goal" name="goalk" value="${member.goalk}"> <!-- 숫자만 입력하게 해야한다. -->
			          		<label for="kcal">목표 칼로리</label>
			          		<div class="sing_kcal_show" style="margin-top:0">
			          		<span class="signup_kcal">@@@님의 권장 칼로리 섭취는 1024kcal입니다.</span><!-- keyup으로 여기에 권장 칼로리는 정한다 -->
			          		</div>
			       		</div>
					</div>
				</div>
		</form>
	 </div>
	<div class="modal-footer">
		<div>
			<div class="mbuttoncenter">
				<input type="submit" value="수정하기" class="btn waves-effect waves-light win2"/>
			</div>
		</div>
	</div>
</div>

</body>
</html>