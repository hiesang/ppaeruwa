<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/include/head.jsp" %>
<style>
.autocomplete-content{
margin-top:0;
}
</style>
<body>
<%@ include file="/include/top.jsp" %>
<script>
function getTimeStamp() {
	  var d = new Date();
	  var clock =
	    leadingZeros(d.getHours(), 2)+
	    leadingZeros(d.getMinutes(), 2)+
	    leadingZeros(d.getSeconds(), 2);
	  return clock;
	}
function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
var sessionId = "${member.email}";
if(sessionId == null && sessionId == ""){
	$(location).attr("href", "${path}/main/login.jsp");
}

$(document).ready(function(){
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
    
    
    $("#date-input").click(function(){
		var tt = $("#date-input").val();
	});
	
	var Now = new Date();
	var cy = Now.getFullYear();
	var cm = Now.getMonth()+1<10?"0"+(Now.getMonth()+1):Now.getMonth()+1;
	var cd = Now.getDate()<10?"0"+Now.getDate():Now.getDate();
	var ct = cm+"/"+cd+"/"+cy;
	$("#date-input").attr("value",ct);
	
	
	var searchVal = "sch=" + $('input.autocomplete').val(); // 자동완성
	console.log(searchVal);
	$.ajax({
		type: "post",
		url: "${path}/sport.do?method=sch",
		data: searchVal,
		dataType: "json",
		success:function(data){
			var list = {};
			for(var i=0; i<data.length; i++){
				list[data[i].sports] = null;
			}
			console.log(list);
			$('input.autocomplete').autocomplete({
			    data:  list,
			    limit: 5, // 최대 검색 결과
			    onAutocomplete: function(val) {
			      // Callback function when value is autcompleted.
			    },
			    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
			});
		}
	});

	var sptime = 10; // 기본적으로 10분으로 한다.
	$(".show_right").hide();
	var x = $("input[name=see_wei]").val(); // 사용자의 몸무게
	$("#sch_btun").click(function(){
		if($("input[name=sch]").val() == null || $("input[name=sch]").val() == ""){ // 널값이나 공백일때 데이터를 안보내고 경고를 보낸다.
			alert("운동명을 입력해 주세요");
		}else{
			$(".show_right").show();
			var searchVal = "sch=" + $('input.autocomplete').val();
			$.ajax({
	    		type:"post",
	    		url:"${path}/sport.do?method=sch",
	    		dataType:'json',
	    		data:searchVal,
	    		async:false,
	    		success:function(data){
	    			
	    			var show = "";
	    			// 중복으로 검색되는게 있지만 일단은 1개로 해놨다. 그래서 첫번째의 
	    			for(var idx =0;idx<1;idx++){
	    				if($("input[name=sch]").val() != null && $("input[name=sch]").val() != ""){
	    				show += "<div class='col s6 sports_name'>";
	    				show += "<i class='material-icons small check-icon'>done</i>"+data[idx].sports+"</div>";
	    				show += "<div class='col s6 kcal-area right-align mets_result'>";
	    				show += "<strong>"+((data[idx].mets*(3.5*x*sptime*5))/1000).toFixed(2)+"</strong> kcal</div>";
	    				/* show += "<span>10분 단위로 계산</span>"; */
	    				show +="<input type='hidden' name='hidemets' value='"+((data[idx].mets*(3.5*x*sptime*5))/1000).toFixed(2)+"'/>";
	    				show +="<input type='hidden' name='mets' value='"+data[idx].mets+"'/>";
	    				show +="<input type='hidden' name='sport' value='"+data[idx].sports+"'/>";
	    				}else{
	    					return;
	    				}
	    			}
	    			$(".show_right").html(show);
	    			$("input[name=stime]").keyup(function(){
	    				var test = $("input[name=hidemets]").val(); // 운동의 10분동안 했던 kcal를 구한거다.
	    				var intime = $(this).val();
	    				var x = 0; // intime의 계산결과 
	    				var y = 0; // 계산결과의 결과
	    				if(intime>=10){ // 10보다 클때 10을 나눠서 나눈값부터 다시 곱한다.
	    					x = (intime/10).toFixed(1);
	    					y = (test*x).toFixed(2); 
	    				}else{  // 10보다 작을때 입력한값으로 나누고 또 나눈다.
	    					x = (10/intime).toFixed(1);
	    					y = (test/x).toFixed(2);
	    				}
	    				var shokcal = "<div class='col s12 right-align tot_kcal'>";
	    					shokcal+= "총 <strong>"+y+"</strong><span> kcal</span></div>";
	    					shokcal+= "<input type='hidden' name='skcal' value='"+y+"'/>";
	    				$(".model_kcal").html(shokcal);
	    			});
	    			
	    		}
			});
		}
	});
	
	$(document).on("click",".ui-datepicker-close",function(){
		var test = $("#date-input").val(); // 달력의 날짜를 받고
		var ctime = test.substring(6,10)+test.substring(0,2)+test.substring(3,5); // 위치를 바꿔서
		$("input[name=sdate]").val(ctime); // input에 넣어준다.
		var sndDate = $("form.init_t").serialize(); // 이메일과 날짜를 보낸다.
		$.ajax({ // 여기서 ajax처리
			type:'post',
			url:'${path}/sport.do?method=clist', // json 형식으로 데이터를 받고
			dataType:'json',
			data:sndDate,
			success:function(data){
				var list = data.clist;
				var show = "";
				var kcal_tot = 0;
				var show_kcal= "";
				for(var id=0; id<list.length;id++){
					kcal_tot += parseFloat(list[id].skcal); // 해당 날짜의 칼로리를 더한다.
				}
				if(kcal_tot > 0){
					show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
				}else{
					show_kcal += "<strong>0.00</strong> kcal";
				}
				$(".total-kcal").html(show_kcal);
				for(var i=0; i < list.length; i++){
					show += "<form class='list_updel' method='post'>";
					show += "<input type='hidden' name='email' class='del_em' value='"+list[i].email+"'/>";
					show += "<input type='hidden' name='sdate' class='del_em' value='"+list[i].sdate+"'/>";
					show += "<div class='list'>";
					show += "<div class='row'>";
					show += "<div class='col s8'>"+list[i].sport+"</div>";
					show += "<div class='col s4 right-align'>";
					show +="<a href='#'><i class='material-icons dp48 delete'>delete</i></a></div></div>";
					show +="<div class='row'>";
					show += "<div class='col s5 kcal-area'><strong>"+list[i].skcal+"</strong> kcal</div>";
					show += "<div class='col s7 fitness-time'>"+list[i].stime+"분</div>";
					show += "</div></div></form>";
				}
				$(".rechang").html(show); // 해당 날짜 데이터
			},error:function(request,status,error){   
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		});
	});
	
	$("a.init").click(function(){ // 년월일시간을 넣어준다. ex) 20180305132259
		var z = $("#date-input").val();
		var y = z.substring(6,10)+z.substring(0,2)+z.substring(3,5)+getTimeStamp();
		$("input[name=sdate]").val(y);
	}); 
	
	$("#submit").click(function(){ // 입력
		if($("input[name=sch]").val() == null || $("input[name=sch]").val() == "" 
				|| $("input[name=stime]").val() == null || $("input[name=stime]").val() ==""){
			alert("운동명 또는 시간을 입력해 주세요");
		}else{
			var sandData = $(".show_sports").serialize();
			console.log("전송");
			$.ajax({
				type:'post',
				url:'${path}/sport.do?method=insert',
				data:sandData,
				dataType:'json',
				success:function(data){
					var list = data.clist;
					var show = "";
					var kcal_tot = 0;
					var show_kcal= "";
					for(var id=0; id<list.length;id++){
						kcal_tot += parseFloat(list[id].skcal); // 해당 날짜의 칼로리를 더한다.
					}
					if(kcal_tot > 0){
						show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
					}else{
						show_kcal += "<strong>0.00</strong> kcal";
					}
					$(".total-kcal").html(show_kcal);
					for(var i=0; i < list.length; i++){
						show += "<form class='list_updel' method='post'>";
						show += "<input type='hidden' name='email' class='del_em' value='"+list[i].email+"'/>";
						show += "<input type='hidden' name='sdate' class='del_em' value='"+list[i].sdate+"'/>";
						show += "<div class='list'>";
						show += "<div class='row'>";
						show += "<div class='col s8'>"+list[i].sport+"</div>";
						show += "<div class='col s4 right-align'>";
						show +="<a href='#'><i class='material-icons dp48 delete'>delete</i></a></div></div>";
						show +="<div class='row'>";
						show += "<div class='col s5 kcal-area'><strong>"+list[i].skcal+"</strong> kcal</div>";
						show += "<div class='col s7 fitness-time'>"+list[i].stime+"분</div>";
						show += "</div></div></form>";
					}
					$(".rechang").html(show); // 해당 날짜 데이터
				 
				},error:function(request,status,error){   
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			});
		}
	});
	
	$(document).on('click','i.delete',function(e){ // 삭제
		 e.stopPropagation();
		 var idx = $("i.delete").index(this);
		 var test = $(".list_updel:eq("+idx+")").children("input[name=sdate]").val(); // 시간을 받고
		 
		 var change = test.substring(0,4)+test.substring(5,7)+test.substring(8,10)+test.substring(11,13)+test.substring(14,16)+test.substring(17,19);
		 
		 $(".list_updel:eq("+idx+")").children("input[name=sdate]").val(change); // 다 짤라준뒤 다시 input time에 넣어준다.
		 
		 var okey = $(".list_updel:eq("+idx+")").children("input[name=sdate]").val(); // 이건 진짜 미친짓이였다...
		 var sndData = $(".list_updel:eq("+idx+")").serialize();
			 $.ajax({
				type:"post",
				url:"${path}/sport.do?method=delete",
				dataType:"json",
				data:sndData,
				success:function(data){
					var list = data.clist;
					console.log(list);
					var show = "";
					var kcal_tot = 0;
					var show_kcal= "";
					for(var id=0; id<list.length;id++){
						kcal_tot += parseFloat(list[id].skcal); // 해당 날짜의 칼로리를 더한다.
					}
					if(kcal_tot > 0){
						show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
					}else{
						show_kcal += "<strong>0.00</strong> kcal";
					}
					$(".total-kcal").html(show_kcal);
					var test = typeof(kcal_tot);
				//	alert(test); // kcal_tot type 확인
					for(var i=0; i < list.length; i++){
						show += "<form class='list_updel' method='post'>";
						show += "<input type='hidden' name='email' class='del_em' value='"+list[i].email+"'/>";
						show += "<input type='hidden' name='sdate' class='del_em' value='"+list[i].sdate+"'/>";
						show += "<div class='list'>";
						show += "<div class='row'>";
						show += "<div class='col s8'>"+list[i].sport+"</div>";
						show += "<div class='col s4 right-align'>";
						show +="<a href='#'><i class='material-icons dp48 delete'>delete</i></a></div></div>";
						show +="<div class='row'>";
						show += "<div class='col s5 kcal-area'><strong>"+list[i].skcal+"</strong> kcal</div>";
						show += "<div class='col s7 fitness-time'>"+list[i].stime+"분</div>";
						show += "</div></div></form>";
					}
					$(".rechang").html(show); // 해당 날짜 데이터
				 
				},error:function(request,status,error){   
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			 
			 });
		 });
			

});

</script>
<!-- contents -->
<div id="contents" class="fitness">
	<div class="container">
		<div class="row">
			<div class="col s12 center-align date">
				<div class="col s4"> </div>
				<div class="col s4">
					<div>
						<form class="init_t" method="post">
							<input type="hidden" name="sdate" value=""/>
							<input type="hidden" name="email" value="${member.email}"/>
							<c:import url="/cal/form.jsp"/>
						</form>
					</div>
				</div>
			</div>
			<div class="col s12">
				<h3 class="h3"></h3>
				<h4 class="h4"></h4>
				 <!--  자바스크립트에서는 못받는거 같아서 여기에 일단 사용자들의 몸무게를 넣어줘서 스크립트로 보낸다.  -->
				<input type="hidden" name="see_wei" value="${member.weight}"/>
				<h3 class="subPage-title col s6"><strong>오늘의 운동</strong></h3>
				<div class="col s6 right-align total-kcal">
				<c:set value="0" var="sum"/>
						<c:forEach var="result" items="${list}" varStatus="status">
							<c:set var="sum" value="${sum+result.skcal}"/>
						</c:forEach>
				<strong><fmt:formatNumber value="${sum}" pattern="0.00"/></strong> kcal
				</div>
			</div>
			<div class="col s12 tab-contents">
				<div class="row tab-title-area">
					<div class="col s12 right-align">
						<a class="modal-trigger init" href="#modal1">
							<i class="material-icons small">add_circle_outline</i>
							<span class="add-icon">추가</span>
						</a>
					</div>
				</div>
				<div class="rechang">
				<c:forEach var="slist" items="${list}">
				<form class="list_updel" method="post">
					<input type="hidden" name="email" class="del_em" value="${slist.email}"/>
					<input type="hidden" name="sdate" class="del_sd" value="${slist.sdate}"/>
					<div class="list">
						<div class="row">
							<div class="col s8">${slist.sport}</div>
							<div class="col s4 right-align">
								<a href="#"><i class="material-icons dp48 delete">delete</i></a>
							</div>
						</div>
						<div class="row">
							<div class="col s5 kcal-area"><strong>${slist.skcal}</strong> kcal</div>
							<div class="col s7 fitness-time">${slist.stime}분</div>
							
						</div>
					</div>
				</form>
				</c:forEach>
				</div>
				<!-- Modal Structure -->
				<div id="modal1" class="modal" style="height:500px">
					<div class="modal-content">
						<h4>운동 추가하기</h4>
						<form class="show_sports" method="post">
						<div class="row">
							
								<div class="input-field col s12">
									<!-- 이메일을 받는다 -->
									<input type="hidden" name="email" value="${member.email}"/>
									<input type="hidden" name="sdate" value=""/>
									<input name="sch" placeholder="운동 검색" id="autocomplete-input" class="autocomplete" type="text">
									<input type="button" class="btn" id="sch_btun" value="검색">
									
								</div>
						</div>
						<div class="row list show_right">
						
						</div>
						<div class="row">
							
								<div class="input-field col s12">
									<input placeholder="운동시간 입력" name="stime" id="first_name" type="number" class="validate" style="width:90%"> 분
								</div>
						</div>
						<div class="row total-kcal model_kcal">
						
						</div>
						</form>
								<div class="modal-footer">
									<input type="submit" class="modal-action modal-close waves-effect btn-flat submit" id="submit"
									 value="등록"/>
									<a href="#!" class="modal-action modal-close waves-effect btn-flat cancel">취소</a>
								</div>
						
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>