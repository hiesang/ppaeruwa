<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/top.jsp" %>

<style>

.contents2{
padding:13px 0;
}

.timelinebt{
margin-top:0px;
}

.timelinetop{
width: 64px;
height : 64px;
border-radius : 50%;
margin:0 auto;
overflow : hidden;
background-color :#00000029;
}
.tc{
padding: 4px;
}
.timelinetopleftff{
font-size:13px;
}
.row .timelinetopleft{
padding:0px;
}

.messegebtn{
width:65px;
height:20px;
background-color:#01729b;
border-radius : 5px;
margin:0 auto;
color : white;
font-weight:bold;
font-size:9px;
}
.messegebtnin{
margin: 0 auto;
}
.timelinebd{
border-radius : 10px;
padding-bottom: 4px;
}

/* .carouselsize{ */
/* padding-top:0px; */
/* padding-bottom:0px; */
/* height:131px; */
/* } */

/* .carousel .carousel-item { */
/* width:180px !important; */
/* height:155px !important; */
/* } */
.collapsible{
webkit-box-shadow : 0 0 0 0 !important;
box-shadow : 0 0 0 0 !important;
border : none !important;
}
.collapsible-header{
border: 1px solid white;
padding : 0rem;
}
.carousel{
height: 200px;
}
.carousel.carousel-slider .carousel-item{
height: 0% !important;
min-height: 200px;
}

.test{
padding-left:0px;
}

.bookmark3{
position : absolute;
right : 0px;
}

.dr{
position:relative;
padding-top: 7px;
}
.boardbottom{
margin-bottom:14px;
}
.profileimg{
width : 100%;
vertical-align : middle;
}
.ttt{
}
.lockline2{
font-size:10px;
vertical-align:middle;
}
.collapsible-body{
padding: 8px !important;
}

/* 아코디언시작 */
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
.repsize{
font-size:10px;
}

.card-panel{
padding: 6px !important;
}

/* 아코디언 끝 */

.editcenter{
margin:auto;
}

.mcomment{
height:67px;
}

.btn2{
margin-right : 0px !important;
}

/* 아코디언 댓글입력창 */
.acinput {
	height: 55px;
	border-radius: 5px;
	width : 106% !important;
}

.acwidth{
width:100%;
}

.tbuttoncustom{
border-radius: 18px !important;
padding : 0 19px;
}

.sendbtn{
background-color : #ee6e73 !important;
padding : 0 10px;
margin-top: 7px;
}

.acbtnwidth{
width : 100%;
}


</style>
<script>
$(document).ready(function(){
	$('.carousel').carousel();
	
// 	$(".tc").each(function(){
// 		var length = 100; // 표시할 글자 수정하기
// 		$(this).each(function(){
// 			if($(this).text().length >= length){
// 				$(this).text($(this).text().substr(0, length) + '...'); // 지정한 글자수 이후 표시할 텍스트(...)
// 			}
// 		});
// 	});

	$(".fav_eventprotect").click(function(event){
			event.stopPropagation();
		})
	$(".bookmark3").click(function(event){
			event.stopPropagation();
		})
	
	$(".lockline2").hide();
	$(".boardbottom").each(function(){
		var test = $(this).children(".publickeych").val();
		if(test == 1){
			$(this).children(".timelinebd").addClass("ttt");
			$(this).find(".lockline2").show();
		}
	});
	
	
		$('.actextarea').keyup(function() {
	        if($(this).val().length > 120) {
	            $(this).val($(this).val().substring(0, 120));
	        }
	    });
		
	$(".sendbtn").hide();
	$(".editbtn").click(function(){
		$(".sendbtn").show();
	});
		

});
</script>
<!-- contents -->
<div class="contents2">
	<div class="container">
		<div class="row timelinebt">
			<div class="test col s3">
				<div class="timelinetop valign-wrapper z-depth-3">
					<img src="${path}/filefolder/profile.jpg"  class="profileimg">
				</div>
				<div class="flow-text center-align">
					<span style="font-size:13px;">${nickname}</span>
				</div>
				
			</div>
			
			<div class="col s5" style="padding-left:0px;">
				<span style="font-size:13px;">"굳은 인내와 노력을 하지 않는 천재는 이 세상에서 있었던 적이 없다."- 뉴턴 -</span>
			</div>
			
			<div class="col s3 timelinetopleft">
				<div class="row" style="padding-top:10px; margin-bottom:10px;">
					<div class="col s6" style="padding-right:0px;">
						<span class="flow-text timelinetopleftff">1.4m</span><br>
						<span class="flow-text timelinetopleftff">팔로워</span>
					</div>
					<div class="col s6" style="padding-right:0px;">
						<span class="flow-text timelinetopleftff">1.4m</span><br>
						<span class="flow-text timelinetopleftff">팔로워</span>
					</div>
				</div>
				
				<div class="messegebtn valign-wrapper z-depth-3">
					<span class="messegebtnin">MESSAGE</span>
				</div>
			</div>
		</div>
		
		<!-- 반복문으로 출력될  -->
		<c:forEach var="tl" items="${timeline}">
			<div class="boardbottom"><input type="hidden" class="publickeych" value="${tl.publickey}"/>
			<div class="valign-wrapper">
			<label class="center-align lockline1">${fn:substring(tl.wdate,5,7)}월 ${fn:substring(tl.wdate,8,10)}일</label><div class="boardbottom2 right-align lockline2"><i class="material-icons fav_eventprotect Tiny" style="margin-left:10px;">lock</i>비공개</div>
			</div>
				<div class="timelinebd z-depth-5">
					<div style="margin : 8px;">
						<div class="tc" style="font-size:13px;">&nbsp;${tl.comments }</div>
					</div>
						<c:if test="${not empty tl.fnames}">
			  				<div class="carousel carousel-slider center col s12" data-indicators="true">
								<c:forEach var="fname" items="${tl.fnames}">
												<a class="carousel-item" href="${fname.imgname}"><img src="${path}/filefolder/${fname.imgname}"></a>
								</c:forEach>
							</div>
	  					</c:if>
<!-- 	  				<div class="dr"> -->
<!-- 		  				 <i class="material-icons" style="margin-left:10px;">favorite_border</i> -->
<!-- 		  				 <i class="material-icons" style="margin-left:4px;">chat_bubble_outlinearrow_drop_down</i> -->
<!-- 		  				 <i class="material-icons bookmark3">bookmark_border</i> -->
<!-- 		  			</div> -->
		  			<!-- 아코디언 테스트 시작 -->
		  			  <ul class="collapsible" data-collapsible="accordion">
					    <li>
					      <div class="collapsible-header dr">
					      	 <i class="material-icons fav_eventprotect" style="margin-left:10px;">favorite_border</i>
			  				 <i class="material-icons" style="margin-left:4px;">chat_bubble_outlinearrow_drop_down</i>
			  				 <i class="material-icons bookmark3">bookmark_border</i>
					      </div>
					      
			     	      	<!-- 아코디언 내부내용 시작-->
					      <div class="collapsible-body">
					      			<!-- 카드 시작 -->
									<div class="col s12 m8 offset-m2 l6 offset-l3">
										<div class="card-panel grey lighten-5 z-depth-1">
											<div class="valign-wrapper replyimgwrap">
													<img src="${path}/filefolder/profile.jpg" alt="" class="circle replyimg" style="width:40px; height:40px;">
													<!-- notice the "circle" class -->
													<div><i class="material-icons replyfav">favorite_border</i></div>
													<div class="replytext">
														<div>
															<span class="black-text repsize"> <span style="font-weight:bold">An Seong-jin</span>&nbsp;This is a square image. Add the "circle" class to it to make it appear circular. This is a square image. Add the "circle" class to it to make it appear circular. This is a square image. Add the "circle" class to it to make it appear circular. </span>
														</div>
														<div class="repsize"><span>1일 전</span></div>
													</div>
											</div>
										</div>
									</div>
									<!-- 카드 끝 -->
									
									
									<div class="valign-wrapper">
<!-- 										<div class="col s8"> -->
<!-- 											<input type="text"/> -->
<!-- 										</div> -->
										<div class="acwidth">
											<!-- 아코디언 안 아코디언 시작-->
											 <ul class="collapsible" data-collapsible="accordion">
											    <li>
											    	 <!-- 아코디언 버튼 -->
												      <div class="collapsible-header">
												       <div class="row acbtnwidth">
												      	<div class="col s4">
											  				 <button class="btn tbuttoncustom editbtn"><i class="material-icons btn2">edit</i></button>
										  				 </div>
										  				 <div class="col s3 offset-s5">
<!-- 											  				 <button class="sendbtn btn tbuttoncustom"><i class="material-icons btn2">send</i></button> -->
										  				 </div>
										  				 </div>
												      </div>
												      <!-- 아코디언 버튼 끝 -->
												      <!-- 아코디언 안 아코디언 내용 -->
												      <div class="collapsible-body">
												      		<div class="row">
												      			<div class="col s10">
												      				<form>
																		<textarea class="actextarea acinput" names="comments" placeholder="댓글을 입력하세요" data-length="120"></textarea>
																		<input type="hidden" value="${email}"/>
																		<input type="hidden" value="${tl.no}"/>
																		
																	</form>
																</div>
																<div class="col s2">
																		 <button class="sendbtn btn"><i class="material-icons btn2">send</i></button>
																</div>
															</div>
													</div>
													<!-- 아쾨디언 안 아코디언 내용 끝 -->
												</li>
											</ul>
					      	<!-- 아코디언 내부내용 끝 -->
					      				</div>
					      		</div>
					      	</div>
					    </li>
					  </ul>
		  			<!-- 아코디언 테스트 끝 -->
				</div>
			</div>
		</c:forEach>
	
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>