<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<style>
.img{
max-width:100%;
max-height:100%;
bottom:0;
left:0;
margin:auto;
overflow:auto;
position:fixed;
right:0;
top:42px;
background-repeat: no-repeat;
opacity : 0.19;
}
</style>
<script>
$(document).ready(function(){
// 자동완성기능 , 엔터키 입력 받기
	$("input[name=recipe_sch]").keyup(function(){
		var data = $(this).val();
		$.ajax({
		     url: "http://openapi.foodsafetykorea.go.kr/api/02bfa3f58e734bf9a177/COOKRCP01/json/1/10",
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
<div id="contents">
<img class="img"alt="" src="re_sch_img2.jpg" width="100%" height="100%">
	<div class="container">
		<form>
			<div class="row">
				<div class="col s2"></div>
				<div class="input-field col s8 valign-wrapper" style="height:400px;">
					<i class="material-icons small" style="color:#424242;">search</i>
					<input type="text" name="recipe_sch"  class="autocomplete" style="color:#37474f;" placeholder="레시피를 검색하세요"/>
				</div>
				<div class="col s2"></div>
			</div>
		</form>
	</div>
</div>
</body>
</html>