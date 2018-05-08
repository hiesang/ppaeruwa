<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/top.jsp"%>
<style>
.replyimgwrap{
position:relative;
}
.replyimg{
position:absolute;
top:0px;
}
.replytext{
margin-left:49px;
margin-right:15px;
}
.replyfav{
position:absolute;
top:3px;
right:0;
font-size:15px;
color:grey;
}
.timelinebd2{
border-radius : 10px;
padding: 16px;
margin-bottom: 17px;
}
.messegebtn{
position: absolute;
right: -4px;
width:65px;
height:20px;
background-color:#666666ad;
border-radius : 5px;
color : white;
font-weight:bold;
font-size:11px;
}
.messegebtnin{
margin: 0 auto;
}
.modalh2{
height:28% !important;
top: 182px !important;
}
.followmodalcenter2{
text-align:center;
padding: 18px !important;
}
</style>
<script>
	$(document).ready(function() {
		$('.modal').modal();
		var rew = $(".replyimg").width();
		
		if('${self}'=='${member.email}' && "${pagemethod}"=="followinglist"){
			$(".followingmine").html('<div class="messegebtn valign-wrapper z-depth-3"><span class="messegebtnin modal2 modal-trigger">팔로잉 해제</span></div>');
		}
		
		$(document).on("click",".modal2", function(e){
				fidx = $(".modal2").index(this);
				$('#modal2').modal('open');
		});
		$("input[name=followbtn]").click(function(){
			$('#modal2').modal('close');
			var targetmail = $("span.flemail").eq(fidx).text();
// 			alert("fidx"+fidx);
// 			alert("target"+targetmail);
				$.ajax({
					data:"follower="+'${member.email}'+"&following="+targetmail,
					url:"${path}/timeline.do?method=followingdelete",
					success:function(data){
						$(".followli").eq(fidx).fadeOut();
					}
				});
		});
		$(".timelinebd2").click(function(e){
			if($(e.target).hasClass("modal2")!=true){
				fidx = $(".timelinebd2").index(this);
				$(location).attr("href","${path}/timeline.do?method=userline&email="+$('span.flemail').eq(fidx).text());
			}
		});
		
	});
</script>
	<div id="contents">
		
		<div class="container">
		
			<!-- 팔로잉리스트 시작 -->
			<c:forEach var="flist" items="${fl}">
				<div class="timelinebd2 z-depth-5 followli">
					<div class="valign-wrapper replyimgwrap">
								<img src="${path}/filefolder/${flist.profile}" alt="" class="circle replyimg" style="width:40px; height:40px;">
								<!-- notice the "circle" class -->
								<div class="replytext valign-wrapper">
									<div>
										<span class="black-text"><span style="font-weight:bold">${flist.nickname}<br></span> <span class="flemail">${flist.email}</span></span>
									</div>
									<div class="followingmine">
										
									</div>
								</div>
						</div>
				</div>
			</c:forEach>
			<!-- 팔로잉리스트 끝 -->
			
		</div>
		<form method="post" action="${path}/timeline.do?method=userline">
			<input type="hidden" name="email"/>
		</form>
	</div>
	  <!-- 팔로잉취소 모달 시작 -->
	  <div id="modal2" class="modal modal-fixed-footer modalh2">
	    <div class="modal-content followmodalcenter2">
	      <h5>팔로잉 취소하시겠습니까?</h5>
	      <input type="button"  class="btn" name="followbtn" value="팔로잉 취소하기"/>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">cancel</a>
	    </div>
	  </div>
	  <!--팔로잉취소 모달 끝 --> 
</body>
</html>