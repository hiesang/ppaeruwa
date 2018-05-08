<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");  
String path = request.getContextPath();
%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/jquery-ui/jquery-ui-1.10.3.custom.css"/>
<style type="text/css">
	body{font-size:62.5%;}
	hi{text-align:center;}
	input[type=text], label{
		margin-bottom:12px;padding:.4em;
		width:95%;
	}
</style>


<script type="text/javascript" src="<%=path%>/a00_com/jquery-1.10.2.js"  ></script>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#dialog").dialog({
			autoOpen:false,
			buttons:{
				submit:function(){ 
				// 버튼을 클릭시, 입력한 일정과 날짜를 특정 위치에 등록 처리..
				// <!-- input  id="event-name" id="event-date"-->
					var nameVal=$("#event-name").val();
					var dateVal=$("#event-date").val();
				// <div id="output"></div>
					$("#event-name").val("");
					$("#event-date").val("");
					$("#output").append("<h1>"+nameVal+":"+dateVal+"</h1>");
					//$("#output").html($("#output").html()+"<h1>"+nameVal+":"+dateVal+"</h1>");
					
				// 다이얼로그 박스도 닫혀지는 처리..
					$("#dialog").dialog("close");				
				},
				reset:function(){ 
					$("#event-name").val("");
					$("#event-date").val("");					
				},
				cacel:function(){ 
					$("#dialog").dialog("close");
				}
			},
			modal:true
		});
		// 날짜처리..
		// dateFormat : 날짜표현 형식  yy년 mm월 dd일
		// numberOfMonths : 한번에 보여줄 월갯수..
		$("#event-date").datepicker({
			dateFormat : 'yy년 mm월 dd일',
			numberOfMonths:2
		});
		$("#open-button").click(function(){
			// 이벤트를 처리했을 때, 화면 로딩..
			$("#dialog").dialog("open");
			
		});
	});
</script>

</head>
<body>
 	<h1 id="open-button">일정 확인</h1>
	<hr/>
	<div id="output"></div>
	<div id="dialog" title="안녕 dialog연습">
		<h1>안녕하세요 UI</h1>
		<label for="event-name">일정명</label>
		<input id="event-name" type="text"/>
		<label for="event-date">날짜</label>
		<input id="event-date" type="text"/>
	</div> 
</body>
</html>