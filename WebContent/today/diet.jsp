<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<style>
.move_ie{
margin-top: 10%;
}
/* autocomplete dropdown 리스트 css */
.autocomplete-content.dropdown-content{
	margin: 0;
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
$(document).ready(function(){
	
	 $('.modal').modal();
	   $("#date-input").click(function(){
			var tt = $("#date-input").val();
		});
	
	$(document).on("click",".ui-datepicker-close",function(){
		var test = $("#date-input").val(); // 달력의 날짜를 받고
		var ctime = test.substring(6,10)+test.substring(0,2)+test.substring(3,5); // 위치를 바꿔서
		$("input[name=time]").val(ctime); // input에 넣어준다.
		var sndDate = $("form.cc_click").serialize(); // 이메일과 날짜를 보낸다.
		$.ajax({ // 여기서 ajax처리
			type:'post',
			url:'${path}/eat.do?method=clist', // json 형식으로 데이터를 받고
			dataType:'json',
			data:sndDate,
			success:function(data){
				var list = data.clist;
				var show = "";
				var kcal_tot = 0;
				var show_kcal= "";
				for(var id=0; id<list.length;id++){
					kcal_tot += parseFloat(list[id].kcal); // 해당 날짜의 칼로리를 더한다.
				}
				if(kcal_tot > 0){
					show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
				}else{
					show_kcal += "<strong>0.00</strong> kcal";
				}
				$(".total-kcal").html(show_kcal);
				var test = typeof(kcal_tot);
			//	alert(test); // kcal_tot type 확인
				
				$("li.eatab").each(function(idx){
				for(var i=0; i < list.length; i++){
					if(list[i].eatday == $(this).text()){ // 아침,점심,저녁,간식이 같을때 
					show+="<form class='list_updel' method='post'>";
					show+="<input type='hidden' name='email' value='"+list[i].email+"'/>";
					show+="<input type='hidden' name='time' value='"+list[i].time+"'/>";
					show+="<input type='hidden' name='eatday' value='"+list[i].eatday+"'/>";
					show+="<div class='list'><div class='row'>";
					show+="<div class='col s8'>"+list[i].foodname+"</div>";
					show+="<div class='col s4 right-align'>";
					show+="<a href='#'><i class='material-icons dp48 delete'>delete</i></a>";
					show+="</div></div><div class='row'>";
					show+="<div class='col s5 kcal-area'><strong>"+list[i].kcal+"</strong> kcal</div>";
					show+="<div class='col s7 right-align'>";
					show+="<ul class='nutrition clearfix'>";
					show+="<li><strong>탄</strong> "+list[i].carbohy+"</li>";
					show+="<li><strong>단</strong> "+list[i].protein+"</li>";
					show+="<li><strong>지</strong> "+list[i].fat+"</li>";
					show+="</ul></div></div></div></form>";
					}
				}
				$(".show_lists").eq(idx).html(show); // 해당 날짜 데이터
				show="";
			 });
			},error:function(request,status,error){   
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		});
	});
   
   var Now = new Date();
	var cy = Now.getFullYear();
	var cm = Now.getMonth()+1<10?"0"+(Now.getMonth()+1):Now.getMonth()+1;
	var cd = Now.getDate()<10?"0"+Now.getDate():Now.getDate();
	var ct = cm+"/"+cd+"/"+cy;
	$("#date-input").attr("value",ct); // 현재 날짜의 데이터 
   
   $('ul.tabs').tabs('select_tab', 'tab_id');
   
   $("input.autocomplete").keyup(function(){ // 자동완성기능
   var searchVal = "sch=" + $('input.autocomplete').val();
	console.log(searchVal);
	$.ajax({
		type: "post",
		url: "${path}/eat.do?method=sch",
		data: searchVal,
		dataType: "json",
		success:function(data){
			var list = {};
			for(var i=0; i<data.length; i++){
				list[data[i].foodname] = null;
			}
			$('input.autocomplete').autocomplete({
			    data:  list,
			    limit: 5, // 최대 검색 결과
			    onAutocomplete: function(val) {
			      // Callback function when value is autcompleted.
			    },
			    minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
			});
		}
	});
 });
	$("input.food_sch").each(function(idx){ //검색구현 결과 소스
		$(this).click(function(){
			$("div.e_list").show();
			var sndData ="sch="+$(".autocomplete").eq(idx).val();
			$.ajax({
				type:"POST",
				url:"${path}/eat.do?method=sch",
				dataType:"json",
				data:sndData,
				success:function(data){
					var show = "";
					for(var x=0;x<1;x++){
						show +="<div class='col s7'>";
						show +="<i class='material-icons small check-icon'>done</i>"+data[x].foodname+"</div>";
						show +="<div class='col s5 kcal-area right-align'>";
						show +="<strong>"+data[x].oneeat+"</strong> kcal";
						show +="</div>";
						show +="<input type='hidden' name='email' value='${member.email}'/>"
						show +="<input type='hidden' name='foodname' value='"+data[x].foodname+"'/>";
						show +="<input type='hidden' name='kcal' value='"+data[x].kcal+"'/>";
						show +="<input type='hidden' name='carbohy' value='"+data[x].carbohy+"'/>";
						show +="<input type='hidden' name='protein' value='"+data[x].protein+"'/>";
						show +="<input type='hidden' name='fat' value='"+data[x].fat+"'/>";
						show +="<input type='hidden' name='natrium' value='"+data[x].natrium+"'/>";
					}
					$(".e_list").eq(idx).html(show);
					$(".e_list").addClass("list list_sch");
				}
			});
		});
	});
	$("a.submit").each(function(idx){
		$(this).click(function(){ // 검색결과 데이터 전송
			var sndData = $("form.go_food:eq("+idx+")").serialize();
			 $.ajax({
				type:"post",
				url:"${path}/eat.do?method=insert",
				dataType:"json",
				data:sndData,
				success:function(data){
					var list = data.clist;
					console.log(list);
					var show = "";
					var kcal_tot = 0;
					var show_kcal= "";
					for(var id=0; id<list.length;id++){
						kcal_tot += parseFloat(list[id].kcal); // 해당 날짜의 칼로리를 더한다.
					}
					if(kcal_tot > 0){
						show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
					}else{
						show_kcal += "<strong>0.00</strong> kcal";
					}
					$(".total-kcal").html(show_kcal);
					var test = typeof(kcal_tot);
				//	alert(test); // kcal_tot type 확인
					
					$("li.eatab").each(function(idx){
					for(var i=0; i < list.length; i++){
						if(list[i].eatday == $(this).text()){ // 아침,점심,저녁,간식이 같을때 
						show+="<form class='list_updel' method='post'>";
						show+="<input type='hidden' name='email' value='"+list[i].email+"'/>";
						show+="<input type='hidden' name='time' value='"+list[i].time+"'/>";
						show+="<input type='hidden' name='eatday' value='"+list[i].eatday+"'/>";
						show+="<div class='list'><div class='row'>";
						show+="<div class='col s8'>"+list[i].foodname+"</div>";
						show+="<div class='col s4 right-align'>";
						show+="<a href='#'><i class='material-icons dp48 delete'>delete</i></a>";
						show+="</div></div><div class='row'>";
						show+="<div class='col s5 kcal-area'><strong>"+list[i].kcal+"</strong> kcal</div>";
						show+="<div class='col s7 right-align'>";
						show+="<ul class='nutrition clearfix'>";
						show+="<li><strong>탄</strong> "+list[i].carbohy+"</li>";
						show+="<li><strong>단</strong> "+list[i].protein+"</li>";
						show+="<li><strong>지</strong> "+list[i].fat+"</li>";
						show+="</ul></div></div></div></form>";
						}
					}
					$(".show_lists").eq(idx).html(show); // 해당 날짜 데이터
					show="";
				 });
				},error:function(request,status,error){   
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			});
		});
	});
	
	$("a.submit , a.cancel").click(function(){
		var idx = $(this).index();
		$("input[name=sch]").val("");
		$("div.e_list").hide();
	});
	
	$(".eatab").click(function(){ // 먹은 시간때 (아침,점심,저녁,저녁) 추가
		var idx = $(this).index();
		var init = $(".eatab").eq(idx).text();
		$(".eatday").val(init);
	});
	$("a.init").click(function(){ // 먹은 날짜 시간 추가
		var idx = $(this).index();
		var z = $("#date-input").val();
		var y = z.substring(6,10)+z.substring(0,2)+z.substring(3,5)+getTimeStamp();
		$("input.time").val(y);
	}); 
	$(document).on('click','i.delete',function(e){ // 삭제
		 e.stopPropagation();
		 var idx = $("i.delete").index(this);
		 var test = $(".list_updel:eq("+idx+")").children("input[name=time]").val(); // 시간을 받고
		 var change = test.substring(0,4)+test.substring(5,7)+test.substring(8,10)+test.substring(11,13)+test.substring(14,16)+test.substring(17,19);
		 $(".list_updel:eq("+idx+")").children("input[name=time]").val(change); // 다 짤라준뒤 다시 input time에 넣어준다.
		 var okey = $(".list_updel:eq("+idx+")").children("input[name=time]").val(); // 이건 진짜 미친짓이였다...
		 var sndData = $(".list_updel:eq("+idx+")").serialize();
			 $.ajax({
				type:"post",
				url:"${path}/eat.do?method=delete",
				dataType:"json",
				data:sndData,
				success:function(data){
					var list = data.clist;
					console.log(list);
					var show = "";
					var kcal_tot = 0;
					var show_kcal= "";
					for(var id=0; id<list.length;id++){
						kcal_tot += parseFloat(list[id].kcal); // 해당 날짜의 칼로리를 더한다.
					}
					if(kcal_tot > 0){
						show_kcal += "<strong>"+kcal_tot.toFixed(2)+"</strong> kcal";
					}else{
						show_kcal += "<strong>0.00</strong> kcal";
					}
					$(".total-kcal").html(show_kcal);
					var test = typeof(kcal_tot);
				//	alert(test); // kcal_tot type 확인
					
					$("li.eatab").each(function(idx){
					for(var i=0; i < list.length; i++){
						if(list[i].eatday == $(this).text()){ // 아침,점심,저녁,간식이 같을때 
						show+="<form class='list_updel' method='post'>";
						show+="<input type='hidden' name='email' value='"+list[i].email+"'/>";
						show+="<input type='hidden' name='time' value='"+list[i].time+"'/>";
						show+="<input type='hidden' name='eatday' value='"+list[i].eatday+"'/>";
						show+="<div class='list'><div class='row'>";
						show+="<div class='col s8'>"+list[i].foodname+"</div>";
						show+="<div class='col s4 right-align'>";
						show+="<a href='#'><i class='material-icons dp48 delete'>delete</i></a>";
						show+="</div></div><div class='row'>";
						show+="<div class='col s5 kcal-area'><strong>"+list[i].kcal+"</strong> kcal</div>";
						show+="<div class='col s7 right-align'>";
						show+="<ul class='nutrition clearfix'>";
						show+="<li><strong>탄</strong> "+list[i].carbohy+"</li>";
						show+="<li><strong>단</strong> "+list[i].protein+"</li>";
						show+="<li><strong>지</strong> "+list[i].fat+"</li>";
						show+="</ul></div></div></div></form>";
						}
					}
					$(".show_lists").eq(idx).html(show); // 해당 날짜 데이터
					show="";
				 });
				},error:function(request,status,error){   
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
				}
			 
			 });
		 });
	
});
</script>
<!-- contents -->
<div id="contents" class="diet">
	<div class="container">
		<div class="row">
			<div class="col s12 center-align date">
				<div class="col s4 move_ie right-align"><!-- <i class="tiny material-icons plu_d">chevron_left</i>  --></div>
				<div class="col s4">
					<div>
						<form class="cc_click" method="post">
							<input type="hidden" name="time" value=""/>
							<input type="hidden" name="email" value="${member.email}"/>
							<c:import url="/cal/form.jsp"/>
						</form>
					</div>
				</div>
				<div class="col s4 move_ie left-align"><!-- <i class="tiny material-icons del_d">chevron_right</i> --></div>
			</div>
			<div class="col s12">
				<input type="hidden" class="test" value=""/>
				<h3 class="subPage-title col s6"><strong>오늘의 식단</strong></h3>
					<div class="col s6 right-align total-kcal">
						 <c:set value="0" var="sum"/>
							<c:forEach var="result" items="${list}" varStatus="status">
								<c:set var="sum" value="${sum+result.kcal}"/>
							</c:forEach>
						<strong><fmt:formatNumber value="${sum}" pattern="0.00"/></strong> kcal
					</div>
				<ul class="tabs">
					<li class="tab col s3 eatab"><a class="active" href="#test1">아침</a></li>
					<li class="tab col s3 eatab"><a href="#test2">점심</a></li>
					<li class="tab col s3 eatab"><a href="#test3">저녁</a></li>
					<li class="tab col s3 eatab"><a href="#test4">간식</a></li>
				</ul>
			</div>
			<div id="test1" class="col s12 tab-contents">
				<br>
				<div class="row tab-title-area">
					<div class="col s8 tab-title tts"><strong>식단</strong></div>
					<div class="col s4 right-align">
						<a class="modal-trigger init" href="#modal1">
							<i class="material-icons small">add_circle_outline</i>
							<span class="add-icon">추가</span>
						</a>
					</div>
				</div>
				<div class="show_lists">
						<c:forEach var="slist" items="${list}">
							<c:if test="${slist.eatday == '아침'}">
								<form class="list_updel" method="post">
									<input type="hidden" name="email" value="${slist.email}"/>
									<input type="hidden" name="time" value="${slist.time}"/>
									<input type="hidden" name="eatday" value="${slist.eatday}"/>
										<div class="list">
											<div class="row">
												<div class="col s8">${slist.foodname}</div>
												<div class="col s4 right-align">
													<a href="#"><i class="material-icons dp48 delete">delete</i></a>
												</div>
											</div>
											<div class="row">
												<div class="col s5 kcal-area"><strong>${slist.kcal}</strong> kcal</div>
												<div class="col s7 right-align">
													<ul class="nutrition clearfix">
														<li><strong>탄</strong> ${slist.carbohy}</li>
														<li><strong>단</strong> ${slist.protein}</li>
														<li><strong>지</strong> ${slist.fat}</li>
													</ul>
												</div>
											</div>
										</div>
								</form>
							</c:if>
						</c:forEach>
				</div>
				<!-- Modal Structure -->
				<div id="modal1" class="modal" style="height:500px">
					<div class="modal-content">
						<h4>식단 추가하기</h4>
						<form class="go_food" method="post">
						<div class="row">
								<div class="input-field col s12">
									<input type="hidden" name="time"  class="time" value=""/>
									<input type="hidden" name="eatday" class="eatday" value="아침"/>
									<input placeholder="식단검색하기" type="text" id="autocomplete-input" class="autocomplete" name="sch">
									<input type="button" class="btn food_sch" value="검색" id="sch_food">
								</div>
							
						</div>
						<div class="row e_list">
						</div>
						</form>
						<!-- <form action="#">
							<div class="file-field input-field clearfix">
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text">
								</div>
								<div class="btn">
									<i class="material-icons dp48">add_a_photo</i>
									<input type="file">
								</div>
							</div>
						</form>
						<div class="row photo-area">
							<div class="col s12 photo-image center-align">Image</div>
						</div> -->
					</div>
					<div class="modal-footer">
						<a href="#!" class="modal-action modal-close waves-effect btn-flat submit">등록</a>
						<a href="#!" class="modal-action modal-close waves-effect btn-flat cancel">취소</a>
					</div>
				</div>
			</div>
			<div id="test2" class="col s12 tab-contents">
				<br>
				<div class="row tab-title-area">
					<div class="col s8 tab-title"><strong>식단</strong></div>
					<div class="col s4 right-align">
						<a class="modal-trigger init" href="#modal2">
							<i class="material-icons small">add_circle_outline</i>
							<span class="add-icon">추가</span>
						</a>
					</div>
				</div>
				<div class="show_lists">
				<c:forEach var="slist" items="${list}">
				<c:if test="${slist.eatday == '점심'}">
				<form class="list_updel" method="post">
				<input type="hidden" name="email" value="${slist.email}"/>
				<input type="hidden" name="time" value="${slist.time}"/>
				<input type="hidden" name="eatday" value="${slist.eatday}"/>
				<div class="list">
					<div class="row">
						<div class="col s8">${slist.foodname}</div>
						<div class="col s4 right-align">
							<a href="#"><i class="material-icons dp48 delete">delete</i></a>
						</div>
					</div>
					<div class="row">
						<div class="col s5 kcal-area"><strong>${slist.kcal }</strong> kcal</div>
						<div class="col s7 right-align">
							<ul class="nutrition clearfix">
								<li><strong>탄</strong> ${slist.carbohy }</li>
								<li><strong>단</strong> ${slist.protein }</li>
								<li><strong>지</strong> ${slist.fat }</li>
							</ul>
						</div>
					</div>
				</div>
				</form>
				</c:if>
				</c:forEach>
				</div>
				<!-- Modal Structure -->
				<div id="modal2" class="modal" style="height:500px">
					<div class="modal-content">
						<h4>식단 추가하기</h4>
						<form class="go_food" method="post">
						<div class="row">
							
								<div class="input-field col s12">
									<input type="hidden" name="time"  class="time" value=""/>
									<input type="hidden" name="eatday" class="eatday" value="점심"/>
									<input placeholder="식단검색하기" type="text" id="autocomplete-input" class="autocomplete" name="sch">
									<input type="button" class="btn food_sch" value="검색">
								</div>
							
						</div>
						<div class="row e_list">
						</div>
						</form>
						
					</div>
					<div class="modal-footer">
						<a href="#!" class="modal-action modal-close waves-effect btn-flat submit">등록</a>
						<a href="#!" class="modal-action modal-close waves-effect btn-flat cancel">취소</a>
					</div>
				</div>
			</div>
			<div id="test3" class="col s12 tab-contents">
				<br>
				<div class="row tab-title-area">
					<div class="col s8 tab-title"><strong>식단</strong></div>
					<div class="col s4 right-align">
						<a class="modal-trigger init" href="#modal3">
							<i class="material-icons small">add_circle_outline</i>
							<span class="add-icon">추가</span>
						</a>
					</div>
				</div>
				<div class="show_lists">
				<c:forEach var="slist" items="${list}">
				<c:if test="${slist.eatday == '저녁'}">
				<form class="list_updel" method="post">
				<input type="hidden" name="email" value="${slist.email}"/>
				<input type="hidden" name="time" value="${slist.time}"/>
				<input type="hidden" name="eatday" value="${slist.eatday}"/>
				<div class="list">
					<div class="row">
						<div class="col s8">${slist.foodname}</div>
						<div class="col s4 right-align">
							<a href="#"><i class="material-icons dp48 delete">delete</i></a>
						</div>
					</div>
					<div class="row">
						<div class="col s5 kcal-area"><strong>${slist.kcal }</strong> kcal</div>
						<div class="col s7 right-align">
							<ul class="nutrition clearfix">
								<li><strong>탄</strong> ${slist.carbohy }</li>
								<li><strong>단</strong> ${slist.protein }</li>
								<li><strong>지</strong> ${slist.fat }</li>
							</ul>
						</div>
					</div>
				</div>
				</form>
				</c:if>
				</c:forEach>
				</div>
				<!-- Modal Structure -->
				<div id="modal3" class="modal" style="height:500px">
					<div class="modal-content">
						<h4>식단 추가하기</h4>
						<form class="go_food" method="post">
						<div class="row">
							
								<div class="input-field col s12">
									<input type="hidden" name="time"  class="time" value=""/>
									<input type="hidden" name="eatday" class="eatday" value="저녁"/>
									<input placeholder="식단검색하기" type="text" id="autocomplete-input" class="autocomplete" name="sch">
									<input type="button" class="btn food_sch" value="검색">
								</div>
							
						</div>
						<div class="row e_list">
						</div>
						</form>
						<!-- <form action="#">
							<div class="file-field input-field clearfix">
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text">
								</div>
								<div class="btn">
									<i class="material-icons dp48">add_a_photo</i>
									<input type="file">
								</div>
							</div>
						</form>
						<div class="row photo-area">
							<div class="col s12 photo-image center-align">Image</div>
						</div> -->
					</div>
					<div class="modal-footer">
						<a href="#!" class="modal-action modal-close waves-effect btn-flat submit">등록</a>
						<a href="#!" class="modal-action modal-close waves-effect btn-flat cancel">취소</a>
					</div>
				</div>
			</div>
			<div id="test4" class="col s12 tab-contents">
				<br>
				<div class="row tab-title-area">
					<div class="col s8 tab-title"><strong>식단</strong></div>
					<div class="col s4 right-align">
						<a class="modal-trigger init" href="#modal4">
							<i class="material-icons small">add_circle_outline</i>
							<span class="add-icon">추가</span>
						</a>
					</div>
				</div>
				<div class="show_lists">
				<c:forEach var="slist" items="${list}">
				<c:if test="${slist.eatday == '간식'}">
				<form class="list_updel" method="post">
				<input type="hidden" name="email" value="${slist.email}"/>
				<input type="hidden" name="time" value="${slist.time}"/>
				<input type="hidden" name="eatday" value="${slist.eatday}"/>
				<div class="list">
					<div class="row">
						<div class="col s8">${slist.foodname}</div>
						<div class="col s4 right-align">
							<a href="#"><i class="material-icons dp48 delete">delete</i></a>
						</div>
					</div>
					<div class="row">
						<div class="col s5 kcal-area"><strong>${slist.kcal }</strong> kcal</div>
						<div class="col s7 right-align">
							<ul class="nutrition clearfix">
								<li><strong>탄</strong> ${slist.carbohy }</li>
								<li><strong>단</strong> ${slist.protein }</li>
								<li><strong>지</strong> ${slist.fat }</li>
							</ul>
						</div>
					</div>
				</div>
				</form>
				</c:if>
				</c:forEach>
				</div>
				<!-- Modal Structure -->
				<div id="modal4" class="modal" style="height:500px">
					<div class="modal-content">
						<h4>식단 추가하기</h4>
						<form class="go_food" method="post">
						<div class="row">
							
								<div class="input-field col s12">
									<input type="hidden" name="time" class="time" value=""/>
									<input type="hidden" name="eatday" class="eatday" value="간식"/>
									<input placeholder="식단검색하기" type="text" id="autocomplete-input" class="autocomplete" name="sch">
									<input type="button" class="btn food_sch" value="검색">
								</div>
							
						</div>
						<div class="row e_list">
						</div>
						</form>
						<!-- <form action="#">
							<div class="file-field input-field clearfix">
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text">
								</div>
								<div class="btn">
									<i class="material-icons dp48">add_a_photo</i>
									<input type="file">
								</div>
							</div>
						</form>
						<div class="row photo-area">
							<div class="col s12 photo-image center-align">Image</div>
						</div> -->
					</div>
					<div class="modal-footer">
						<a href="#!" class="modal-action modal-close waves-effect btn-flat submit">등록</a>
						<a href="#!" class="modal-action modal-close waves-effect btn-flat cancel">취소</a>
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