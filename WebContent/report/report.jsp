<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.asdf{
margin:0 auto;
text-align:center;
}
.da{
font-size:33px;
margin:0 auto;
margin-top:15px;
margin-left:4px;
}
.datep{
text-align:center;
}
</style>
<%@ include file="/include/head12.jsp" %>
<body>

<%@ include file="/include/top.jsp" %>
<script>
$(document).ready(function(){
	
	var sessionId = "${member.email}";
	if(sessionId == null && sessionId == ""){
		$(location).attr("href", "${path}/main/main.jsp");
	}

	
	
	
/* ---------------------------------------------달력-------------------------------------------------------------------------- */	
	
	var tt =$("#datepicker1").val();
	$(document).on("click",".ui-state-default", function(){
		
		 
		  $("#datepicker1").attr("value",$("#datepicker1").val());
		  $("#datepicker2").attr("value",$("#datepicker2").val());
	});
	
	
	$(".tin").click(function(){
		var x = $("#datepicker1").val()
		var y = $("#datepicker2").val()
		var z = x.substring(0,4)+x.substring(5,7)+x.substring(8,10);
		var k = y.substring(0,4)+y.substring(5,7)+y.substring(8,10);
		
		
		$(".time1").val(z);
		$(".time2").val(k);
		console.log($(".time1").val());
		console.log($(".time2").val());
		   $(".tform").attr("action","${path}/report.do?method=tlist");
			$(".tform").submit();  
		
	});
	
	
	


	$("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy.mm.dd'
    });	
/* --------------------------------------------------------토글--------------------------------------------------- */
	$(".but_tigl").click(function(){
		$(".upadow").toggle();
	});

});
</script>


<!-- contents -->
<div class="login contents2">
	<div class="container row">
	
<form class="tform" method="post">
<input type="hidden" name="email" value="${member.email}"/>
<input class="time1" type="hidden" name="time1"/>
<input class="time2" type="hidden" name="time2"/>
		<div class="col s12 reportdate">
			<p>기간 설정:
			<div class="col s5">
    			<input class="datep" type="text" id="datepicker1" value=""> 
    		</div>
    		<div class="col s2">
    			 <p class="da">~</p>
    		</div>
    		<div class="col s5">
   		 		<input class="datep" type="text" id="datepicker2" value="">
   		 	</div>
			</p>
		</div>
		
		<div class="col s12 asdf">
				<button class="btn waves-effect waves-light pulse tin" type="button"
					name="action">
					조회하기 <i class="material-icons right">send</i>
				</button>

		</div>
		
</form>		
</div>
<div class="col s12 but_tigl center-align">
				<button type="button">
					<i class="material-icons up_ico">arrow_drop_up</i>
					<!-- 여기 토글인데 닫으면 밑에 아이콘이 키면 위에 아이콘이 보이게 설정해야한다. -->
					<i class="material-icons down_ico" style="display:none">arrow_drop_down</i>
				</button>
			</div>
					<div class="upadow">
						<table class="weight_tabla hoi2">
							<c:forEach var="tl" items="${rtlist}">
								<c:set var="dis" value="${tl.carbohy}"/>
								<c:set var="dis2" value="${tl.protein}"/>
								<c:set var="dis3" value="${tl.fat}"/>
			    				<tr>
			    				<td>${tl.time.substring(0,10)}</td>
			    				<td>${tl.kcal}kcal</td>
			    				<td>탄:<fmt:formatNumber value="${dis }" pattern="00"/><br>단:<fmt:formatNumber value="${dis2 }" pattern="00"/><br>지:<fmt:formatNumber value="${dis3 }" pattern="00"/></td>
			    				<td>${tl.eatday }</td>
			    				</tr>
			    				
			    			</c:forEach> 
			    		</table>	
					</div>

		
		
		<div class="row">
		    <div class="col s12">
		      <ul class="tabs">
		        <li class="tab col s6 l4 offset-l2"><a  class="active" href="#test1">칼로리 리포트</a></li>
		        <li class="tab col s6 l4"><a href="#test2">영양분 리포트</a></li>
		      </ul>
		    </div>
		    
		    <div id="test1" class="col s12 reportcaptiond">
		    	<div>
			    	<span class="reportcaption">THIS WEEK'S</span><br>
			    	<span>칼로리 리포트</span>
		    	</div>
		    	<div>
	    			<div class="row">
						<div class="col s12 charttest">
							<c:import url="weight2.jsp"></c:import>
						</div>
					</div>
		    	</div>
		    	
			</div>
			
			
		    <div id="test2" class="col s12 reportcaptiond">
				<div>
			    	<span class="reportcaption">THIS WEEK'S</span><br>
			    	<span>영양분 리포트</span>
		    	</div>
		    	<div>
	    			<div class="row">
						<div class="col s12 charttest">
							<c:import url="asdf2.jsp"></c:import>
						</div>
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