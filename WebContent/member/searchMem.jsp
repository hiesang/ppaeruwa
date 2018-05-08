<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/head.jsp" %>
<body>
<script>
$(document).ready(function(){
	// 세션 확인
	var sessionId = "${member.email}";
	if(sessionId == null || sessionId == ""){
		$(location).attr("href", "${path}/index.jsp");
	}
	
	// 회원 검색
	var searchVal = "search=" + $('input.autocomplete').val();
	//console.log(searchVal);
	$.ajax({
		type: "post",
		url: "${path}/member.do?method=search",
		data: searchVal,
		dataType: "json",
		success:function(data){
			var list = {};
			for(var i=0; i<data.length; i++){
				list[data[i].nickname + "(" + data[i].email + ")"] = null;
			}
			//console.log(list);
			$('input.autocomplete').autocomplete({
				data:  list,
				limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
				onAutocomplete: function(data) {
					// Callback function when value is autcompleted.
					var emailHref = data.split("(")[1];
					var email = emailHref.substring(0, emailHref.length-1); 
					//console.log(email);
					$(location).attr("href", "${path}/timeline.do?method=userline&email=" + email);
				},
				/* member.do?method=userlist" */
				minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
			});
		}
	});
});
</script>
<%@ include file="/include/top.jsp" %>
<!-- contents -->
<div id="contents" class="login">
	<div class="container">
		<div class="row">
			<div class="col s12">
				<form>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i>
						<input type="text" id="autocomplete-input" class="autocomplete" name="search">
						<label for="autocomplete-input">Autocomplete</label>
					</div>
				</div>
				<div id="test"></div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>