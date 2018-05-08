<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>

<style>
.top_food{
position:relative;
width:100%;
height:350px;
background-size:cover;
margin-top:2%;
margin:0;
}
.food_expli{
margin-left:-5%;
position:absolute;
width:100%;
height:100%;
padding-left:5%;

color:white;
text-shadow:2px 2px black;
margin-top:79%;
}
border:0.5px solid powderblue;
}
.food_matal{
padding:1% 3% 5% 3%;
margin-bottom:10px;
border-bottom:1px solid powderblue;
}
.food_matal .s2 .select-wrapper{
	width: 30px;
}
.food_matal .matal_iall{
	margin-bottom:0;
}
.food_matal .matal_iall .one_i{
padding-left:12%;
}
.food_matal .matal_iall .two_i{
padding-left:13%;
}
.food_matal .matal_iall .three_i{
padding-left:14%;
}
.food_matal .fm_m{
padding:0 0;
padding-left:8%
}
.food_matal .fm_m_s{	

padding:0 0;
}
.food_matal .select-wrapper .select-dropdown{
	margin:0 0;
	height:20px;
}
.food_matal .select-wrapper .dropdown-content{
	min-width:30px;
	height:120px;
}
.food_matal .select-wrapper .dropdown-content li{
min-height:30px;
}
.food_matal .select-wrapper .dropdown-content li>span{
padding:0 0;
font-size: 15px;
color:black;
}
.matal_na{
padding-left:5%;
margin-bottom:0;
border-bottom:2px solid #0496a0;
margin-top:3%;
font-size: 1.3rem;
}
.matal .row{
margin-bottom:10px;
}
.matal .s12{
padding:1% 22% 1% 22%;
}
.nutr .row{
padding:2% 20% 2% 20%;
margin:0;
}
.nutr .helth{
padding-left:10%;
}
.nutr .s12 table tr td{
padding:0 0;
}
.but_tigl button{
height:12px;
width:100%;
background-color:#ccc;
}
.but_tigl button i{
position:absolute;
margin-left:-3.5%;
margin-top:-3%;
}
.how_mk{
margin-top:5px;
}
.how_mk .col{
padding:0 0.75em;
}
.how_mk .how_tit{
margin-bottom: 20px;
}
.how_mk .mk_title{
border-bottom:2px solid #0496a0;
}
.q_mki{
padding:0 5%;
position:relative;
margin-bottom:10px;
}
.q_mki .i_mki{
position:absolute;
display:inline-block;
color:#f28f3e;
}
.q_mki .sp_mki{
margin-left:30px;
display:inline-block;
}
.fm_m_s{
text-align:center;
}
.rere{
margin-left:-31%;
}
</style>
<script>
$(document).ready(function(){
	$('select').material_select();
	
	$(".but_tigl").click(function(){
		$(".upadow").toggle();
	});
	
	$(".go_eat").click(function(){
		$('#go_eating').modal({
		    dismissible: true, // Modal can be dismissed by clicking outside of the modal
		    opacity: .5, // Opacity of modal background
		    inDuration: 300, // Transition in duration
		    outDuration: 200, // Transition out duration
		    startingTop: '4%', // Starting top style attribute
		    endingTop: '10%', // Ending top style attribute
		    ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
		      alert("Ready");
		      console.log(modal, trigger);
		    },
		    complete: function() { alert('Closed'); } // Callback for Modal close
		  }
		);
	});
	
});
</script>
<%@ include file="/include/top.jsp" %>
		<div class="row" style="margin-bottom:0"><!-- 음식 사진을 여기 경로에 넣으면 된다. -->
			<div class="col s12 top_food" style="background-image: url(${param.ATT_FILE_NO_MAIN})">
				
				<div class="food_expli">
					<h5>${param.RCP_NM}</h5>
					<span style="font-size:1em;">열량:${param.INFO_ENG}Kcal</span>
				</div>
				
				
			</div>
		</div>
		
		<div class="row food_matal">
			<div class="row matal_iall">
				<div  class="col s4 one_i">
					<i class="material-icons">restaurant_menu</i>
				</div>
				<div  class="col s4 two_i">
					<i class="material-icons">alarm</i>
				</div>
				<div  class="col s4 three_i">
					<i class="material-icons">extension</i>
				</div>
			</div>
			<div class="col s12">
			<div class="col s4 fm_m_s">
					<span>1인분</span>
			</div>
			<div class="col s4 center-align ">
				<span>30분</span>
			</div>
			<div class="col s4 center-align">
				<span>아무나</span>
			</div>
			</div>
			<br>
	
		<div class="upadow">
			<div class="col s12">
			<div class="row matal_na">
					<span>재료 및 분량</span>
			</div>
			</div>
			
			<div class="col s12 matal">
			
				<div class="row">
				
				<div class="col s12" style="padding:0;">
					<div class="col s12	" style="padding:0;">
						<tr><td>재료명:&nbsp</td><td>${param.RCP_PARTS_DTLS}</td></tr>
					</div>
				</div>
				
				</div>
				
			</div>
		
			<div class="col s12">
				<div class="row matal_na">
					<span>영양성분</span>
				</div>
			</div>
			<div class="col s12 nutr">
				<div class="row">
				<div class="col s12 nutr_list">
					<table>
						<tr>
						<td>나트륨</td>
						<td>${param.INFO_NA}mg</td>
						</tr>
						<tr>
						<td>탄수화물</td>
						<td>${param.INFO_CAR}g</td>
						</tr>
						<tr>
						<td>지방</td>
						<td>${param.INFO_FAT}g</td>
						</tr>
						<tr>
						<td>단백질</td>
						<td>${param.INFO_PRO}g</td>
						</tr>
					</table>
				</div>
				</div>
			</div>
		</div>
			<div class="col s12 but_tigl center-align">
				<button type="button">
					<i class="material-icons up_ico">arrow_drop_up</i>
					<!-- 여기 토글인데 닫으면 밑에 아이콘이 키면 위에 아이콘이 보이게 설정해야한다. -->
					<i class="material-icons down_ico" style="display:none">arrow_drop_down</i>
				</button>
			</div>
		</div>
		
		<div class="row how_mk">
			<div class="col s12 how_tit">
			

			    	
				<div class="row matal_na">
					<span>조리과정</span>
				</div>
			</div>
			
			<div class="col s12 q_mki" style="padding:0 10%;">
				
				<div class="sp_mki">
					<div class="col s12 rere2">
					<img src="${param.MANUAL_IMG01}"/>
					<h6>${param.MANUAL01}</h6>
					<br>
					<img src="${param.MANUAL_IMG02}"/>
					<h6>${param.MANUAL02}</h6>
					<br>
					<img src="${param.MANUAL_IMG03}"/>
					<h6>${param.MANUAL03}</h6>
					<br>
					<img src="${param.MANUAL_IMG04}"/>
					<h6>${param.MANUAL04}</h6>
					<br>
					<img src="${param.MANUAL_IMG05}"/>
					<h6>${param.MANUAL05}</h6>
				</div>
			</div>
			
			</div>
			
		</div>
		<br><br>
<%@ include file="/include/footer.jsp" %>
</body>
</html>