<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>

<style>
.init_food{
width:100%;
height:240px;
border:1px solid #2068d6;
}
.init_food .up_icon{
z-index:-3;
width:100%;
text-align:center;
}
.init_food .up_icon i{
font-size:50px;
}
.no_see{
display:none;
}
.init_add .nonl{
padding: 0;
width: 12%;
}
.init_add{
margin:0;
margin-bottom: 1%;
}
.init_add .init_first{
margin:0;
margin-bottom: 1%;
}
.init_add .init_first .s2{
font-size: 15px;
width: 14%;
}
.init_add .init_first .input-field{
margin-top:0;
padding:0 5% 0 0;
}
.add_button .btn{
height:20px;
padding:0 5%;
line-height:0;
}
.add_proce .btn{
height:20px;
padding:0 5%;
line-height:0;
}
.remov_but{
height:22px;
padding-left:0; 
}
.remov_but button{
height:22px;

}
.remov_but button i{
font-size: 1.5rem;
position:absolute;
margin: -3.3% 0 0 -2.9%;
}
.proce table{
width:70%;
}
.proce table tr td{
padding:0 0 4% 0;
}
.proce table tr td textarea{
padding:0;
min-height:0;
height:0;
margin:0;
}
</style>

<script>

$(document).ready(function () {
    	$(".init_food").click(function(){
    		$("input[name=food_img]").trigger('click');
    		var ext = $("input:file").val().split(".").pop().toLowerCase();
    		if(ext.length > 0){
    			if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) { 
    				alert("이미지 파일만 업로드 할수 있습니다.");
    				return false;  
    			}                  
    		}
    		$("input:file").val().toLowerCase();
    	});
    	$("button.add_bu").click(function(){
    		var num = $("div.init_first").length+1;
    		if(num<=10){
    			var proc = "<div class='row init_first'>"+
    					"<div class='col s1'><span>"+num+".</span></div>"+
    					"<div class='col s2 nonl'><span>재료 :</span></div>"+
    					"<div class='col s3 input-field '>"+
    						"<input type='text' name='addmat' style='margin:0; height:1%; width:100%;'/>"+"</div>"+
    					"<div class='col s2 nonl'><span>갯수 :</span></div>"+
    					"<div class='col s3 input-field'>"+
    					"<input type='text' name='addnum' maxlength='2' style='margin:0; height:1%; width:60%;'/>개</div>"+
    					"<div class='col s1 remov_but' style='padding:0;'>"+
    					"<button class='remov' type='button'><i class='material-icons'>close</i></button></div>"+
    					"</div>"
    			$(".init_add").append(proc);
    		}else{
    			alert("재료는 10개가 최대입니다.")
    			return;
    		}
    		$(".remov").click(function(){
    			var but = $(this).parent().parent();
    			but.remove();
    		});
    	});
    	
    	$(".add_pro").click(function(){
    		var numb = $(".proce_tr").length;
    		if(numb<=20){
    			var proc = "<tr class='proce_tr'><td><i class='material-icons'>check</i></td>"+
    					   "<td><input type='text' id='textarea' class='materialize-textarea' name='proce'/></td>"+
    					   "<td><i class='material-icons i_rmove'>clear</i></td></tr>"
    					   
    			$(".proce table").append(proc);
    		}else{
    			alert("과정은 20개가 최대입니다.");
    			return;
    		}
    		$(".i_rmove").click(function(){
    			var but = $(this).parent().parent();
    			but.remove();
    		});
    	});
		/*
						<tr>
						<td><i class="material-icons">check</i></td>
						<td><textarea id="textarea" class="materialize-textarea" name="proce2"></textarea></td>
						<td><i class="material-icons">clear</i></td>
						</tr>
		*/
		
    	$(".win").click(
    			function() {
    				var sendData = $(".wform").serialize();
    				console.log(sendData);
    				if (confirm("등록하시겠습니까?")) {
    					$(".wform").attr("action","${path}/receipe.do?method=rinsert");
    					$(".wform").submit();
    				}
    			});
});
</script>
<%@ include file="/include/top.jsp" %>
<div id="contents">
	<div class="container">
		<form class="wform" method="post">
		<input type="hidden" name="email" value="${member.email}"/>
			<div class="row">
				<h5>음식 사진</h5>
				<div class="col s12">
					<div class="init_food valign-wrapper center-align">
						<div class="up_icon">
						<i class="material-icons upload">add_a_photo</i>
						</div>
					</div>
				</div>
				<div class="col s6 offset-s6 center-align no_see">
					<input type="file" name="food_img"/>
				</div>
			</div>
			<div class="row">
				<div class="col s12">
				<span>음식이름 :</span><input type="text" name="fname" style="width:50%"/>
				</div>
			</div>
			<div class="row init_add">
				<div class="s12">
					<span>사용할 재료</span>
				</div>
				<div class="row init_first">
					<div class="col s1"><span>1.</span></div>
					<div class="col s2 nonl"><span>재료 :</span></div>
					<div class="col s3 input-field ">
						<input type="text" name="addmat" style="margin:0; height:1%; width:100%;"/>
					</div>
					<div class="col s2 nonl"><span>갯수 :</span></div>	
					<div class="col s3 input-field">
						<input type="text" name="addnum" maxlength="2" style="margin:0; height:1%; width:60%;"/>개
					</div>
				</div>
				<!-- <div class="row init_first">
					<div class="col s1"><span>2.</span></div>
					<div class="col s2 nonl"><span>재료 :</span></div>
					<div class="col s3 input-field ">
						<input type="text" name="addmat" style="margin:0; height:1%; width:100%;"/>
					</div>
					<div class="col s2 nonl"><span>갯수 :</span></div>	
					<div class="col s3 input-field">
						<input type="number" name="addnum" maxlength="2" style="margin:0; height:1%; width:60%;"/>개
					</div>
				</div>
				<div class="row init_first">
					<div class="col s1"><span>3.</span></div>
					<div class="col s2 nonl"><span>재료 :</span></div>
					<div class="col s3 input-field ">
						<input type="text" name="addmat" style="margin:0; height:1%; width:100%;"/>
					</div>
					<div class="col s2 nonl"><span>갯수 :</span></div>	
					<div class="col s3 input-field">
						<input type="number" name="addnum" maxlength="2" style="margin:0; height:1%; width:60%;"/>개
					</div>
				</div>
				<div class="row init_first">
					<div class="col s1"><span>4.</span></div>
					<div class="col s2 nonl"><span>재료 :</span></div>
					<div class="col s3 input-field ">
						<input type="text" name="addmat" style="margin:0; height:1%; width:100%;"/>
					</div>
					<div class="col s2 nonl"><span>갯수 :</span></div>	
					<div class="col s3 input-field">
						<input type="number" name="addnum" maxlength="2" style="margin:0; height:1%; width:60%;"/>개
					</div>
				</div> -->		
			</div>
			<div class="col s6 offset-s6 right-align add_button">
				<button type="button" class="waves-effect waves-light btn add_bu">재료 추가</button>
			</div>
			<div class="row">
				<span>조리 과정</span>
				<div class="input-field col s12 proce">
					<table>
						<tr class="proce_tr">
						<td><i class="material-icons">check</i></td>
						<td colspan="1"><input type="text" id="textarea" class="materialize-textarea" name="proce"/></td>
						</tr>
						<!-- <tr class="proce_tr">
						<td><i class="material-icons">check</i></td>
						<td colspan="1"><textarea id="textarea" class="materialize-textarea" name="proce"></textarea></td>
						</tr>
						<tr class="proce_tr">
						<td><i class="material-icons">check</i></td>
						<td colspan="1"><textarea id="textarea" class="materialize-textarea" name="proce"></textarea></td>
						</tr>
						<tr class="proce_tr">
						<td><i class="material-icons">check</i></td>
						<td colspan="1"><textarea id="textarea" class="materialize-textarea" name="proce"></textarea></td>
						</tr> -->
					
					</table>
				</div>
				<div class="col s6 offset-s6 right-align add_proce">
					<button type="button" class="waves-effect waves-light btn add_pro">과정 추가</button>
				</div>
			</div>
			<div class="col s12 center-align">
				<input type="submit" class="win" value="등록하기"/>
			</div>
		</form>
	</div>
	
</div>
</body>
</html>