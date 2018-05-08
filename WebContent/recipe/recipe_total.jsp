<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.re_sh_ul{

}
.re_sh_li , .food_explan , .food_img{
border-radius: 0.5em 0.5em 0.5em 0.5em;
}
form.re5{
	float: left;
	width: 50%;
}
.re_sh_li{
	display:inline-block;
	width: 100%;
	border:0.5px solid #d1cfcf;
	margin:1% 1% 2% 2%;
	height:139.38px;

}
.inner_food{
position:relative;
width: 100%; height: 100%;
}
.food_explan{
position:absolute;
bottom:0;
width:100%;
height:55%;
background-color:rgba(0, 0, 0, 0.55);
padding-left:10%;
padding-top:5%;
z-index: 1;
}
.food_img{
width: 100%; 
height:100%; 
vertical-align: middle;
}
.sch_res{
color:#757575;
font-size:0.8em;
margin-left:5%;
}
.re{
float:right;
}
.lodding_bar_rci{
position:absolute;
left:43%;
top:50%;
z-index:100;
}
</style>
<script>
$(document).ready(function(){
	$(".init").click(function(){
		var data = $("input[name=recipe_sch]").val();
		$(".lodding_bar_rci").html("<img src='ajax_loader.gif'>")
		$.ajax({
		     url: "http://openapi.foodsafetykorea.go.kr/api/02bfa3f58e734bf9a177/COOKRCP01/json/1/999",
		     dataType:'json',
		     success: function(result){
		    	 $("img").hide();
		    	 var list ={};
		    	 var test = "";
		    	 var clik = "";
		    	 
		    	
		    		 for(var i=0;i<result['COOKRCP01']['row'].length;i++){
		    			  clik = result['COOKRCP01']['row'][i]['RCP_NM'];
		    			 
				        	 if(0 <= clik.indexOf(data)){
				        	test +="<form class='re5' method='post'>"
				        	test +="<li class='re_sh_li'>";
				        	
				    		 test +="<div class='inner_food'>";
				    		 test +="<img alt='곱창' src='"+result['COOKRCP01']['row'][i]['ATT_FILE_NO_MK']+"' class='food_img' >";
				    		 test +="<div class='food_explan'>";
				    		 test +="<span style='color:white;'><strong>"+result['COOKRCP01']['row'][i]['RCP_NM']+"</strong></span><br>";
				    		 test +="<span style='color:white;font-size:0.7em;'>조리시간 : ?분<i class='tiny material-icons'>access_alarms</i></span>";
				    		 test +="</div>";
				    		 test +="</div>";
				    		 test +="<input type='hidden' name='RCP_NM' value='"+result['COOKRCP01']['row'][i]['RCP_NM']+"'/>";
				    		 test +="<input type='hidden' name='RCP_WAY2' value='"+result['COOKRCP01']['row'][i]['RCP_WAY2']+"'/>";
				    		 test +="<input type='hidden' name='RCP_PAT2' value='"+result['COOKRCP01']['row'][i]['RCP_PAT2']+"'/>";
				    		 test +="<input type='hidden' name='INFO_WGT' value='"+result['COOKRCP01']['row'][i]['INFO_WGT']+"'/>";
				    		 test +="<input type='hidden' name='INFO_ENG' value='"+result['COOKRCP01']['row'][i]['INFO_ENG']+"'/>";
				    		 test +="<input type='hidden' name='INFO_CAR' value='"+result['COOKRCP01']['row'][i]['INFO_CAR']+"'/>";
				    		 test +="<input type='hidden' name='INFO_PRO' value='"+result['COOKRCP01']['row'][i]['INFO_PRO']+"'/>";
				    		 test +="<input type='hidden' name='INFO_FAT' value='"+result['COOKRCP01']['row'][i]['INFO_FAT']+"'/>";
				    		 test +="<input type='hidden' name='INFO_NA' value='"+result['COOKRCP01']['row'][i]['INFO_NA']+"'/>";
				    		 test +="<input type='hidden' name='ATT_FILE_NO_MAIN' value='"+result['COOKRCP01']['row'][i]['ATT_FILE_NO_MAIN']+"'/>";
				    		 test +="<input type='hidden' name='RCP_PARTS_DTLS' value='"+result['COOKRCP01']['row'][i]['RCP_PARTS_DTLS']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL01' value='"+result['COOKRCP01']['row'][i]['MANUAL01']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG01' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG01']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL02' value='"+result['COOKRCP01']['row'][i]['MANUAL02']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG02' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG02']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL03' value='"+result['COOKRCP01']['row'][i]['MANUAL03']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG03' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG03']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL04' value='"+result['COOKRCP01']['row'][i]['MANUAL04']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG04' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG04']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL05' value='"+result['COOKRCP01']['row'][i]['MANUAL05']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG05' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG05']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL06' value='"+result['COOKRCP01']['row'][i]['RCP_NM']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG06' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG06']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL07' value='"+result['COOKRCP01']['row'][i]['MANUAL07']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG07' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG07']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL08' value='"+result['COOKRCP01']['row'][i]['MANUAL08']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG08' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG08']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL09' value='"+result['COOKRCP01']['row'][i]['MANUAL09']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG09' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG09']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL10' value='"+result['COOKRCP01']['row'][i]['MANUAL10']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG10' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG10']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL11' value='"+result['COOKRCP01']['row'][i]['MANUAL11']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG11' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG11']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL12' value='"+result['COOKRCP01']['row'][i]['MANUAL12']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG12' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG12']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL13' value='"+result['COOKRCP01']['row'][i]['MANUAL13']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG13' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG13']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL14' value='"+result['COOKRCP01']['row'][i]['MANUAL14']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG14' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG14']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL15' value='"+result['COOKRCP01']['row'][i]['MANUAL15']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG15' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG15']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL16' value='"+result['COOKRCP01']['row'][i]['MANUAL16']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG16' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG16']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL17' value='"+result['COOKRCP01']['row'][i]['MANUAL17']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG17' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG17']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL18' value='"+result['COOKRCP01']['row'][i]['MANUAL18']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG18' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG18']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL19' value='"+result['COOKRCP01']['row'][i]['MANUAL19']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG19' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG19']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL20' value='"+result['COOKRCP01']['row'][i]['MANUAL20']+"'/>";
				    		 test +="<input type='hidden' name='MANUAL_IMG20' value='"+result['COOKRCP01']['row'][i]['MANUAL_IMG20']+"'/>";
				    		 test +="</li>";
				    		 test +="</form>"
				        	 }
				        	 
				        	 
				        }
		    		 
		    		 
		    		 $("ul.re_sh_ul").html(test);
		    		 
		    			 $(".sch_res").css("display","block")
		    		
		    		 test = "";
		        
		     }
		});
	});
	$(document).on('click','.re_sh_li',function(e){
		e.stopPropagation();
		 var idx = $(".re_sh_li").index(this);
		 $(".re5:eq("+idx+")").attr("action","${path}/recipe/show_recope.jsp");
			$(".re5:eq("+idx+")").submit();
		 });
		 
	
	$("input[name=recipe_sch]").keydown(function(){
		var data = $(this).val();
		$.ajax({
		     url: "http://openapi.foodsafetykorea.go.kr/api/02bfa3f58e734bf9a177/COOKRCP01/json/1/999",
		     success: function(result){
		    	 var list ={};
		    		 for(var i=0;i<result['COOKRCP01']['row'].length;i++){
				        	list[result['COOKRCP01']['row'][i]['RCP_NM']]=null; 
				        }
		    	 
		        
		        console.log(list);
		        $("input.autocomplete").autocomplete({
		        	 data:  list,
					    limit: 5, // 최대 검색 결과
					    onAutocomplete: function(val) {
					      // Callback function when value is autcompleted.
					    },
					    minLength: 1
		        });
		     }
		});
	});
	
});
</script>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents">
	<div class="container">
		<div class="row">
			<div class="col s12">
				<h5>레시피</h5><!-- 글자 스타일을 바꾸면 된다. -->
			</div>
			<form>
				<div class="col s2" ></div>
				<div class="input-field col s12 re"><!-- value에 검색결과한 값을 저장한다. -->
					<input type="text" class="autocomplete col s10" name="recipe_sch" value=""/>
					<input type="button" class="col s2 waves-effect waves-light btn init" value="검색"/>
				</div>
				<div class="col s2" ></div>
			</form>
			<div class="col s12">
				 <span class="sch_res" style="display:none;">검색결과</span> 
				<div class="col s12">
					<div class="lodding_bar_rci">
						
					</div>
					<ul class="re_sh_ul"> <!-- 검색 결과값을 여기에 돌리면된다. -->
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>