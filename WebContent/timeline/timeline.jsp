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
.messegebtn2{
 width: 27px;
 height: 20px;
 background-color: #6666666b;
 border-radius: 5px;
 margin: 0 0 0 7px;
 color: white;
 font-weight: bold;
 font-size: 9px;
}
.messegebtn3{
 width: 27px;
 height: 20px;
 background-color: #008ff2;
 border-radius: 5px;
 margin: 0 0 0 7px;
 color: white;
 font-weight: bold;
 font-size: 9px;
}
.mytatediv{
width:65px;
height:20px;
background-color:#9b0101;
border-radius : 5px;
margin:4px auto;
color : white;
font-weight:bold;
font-size:9px;
}
.messegebtnin{
margin: 0 auto;
}
.mystate2{
margin: 4px auto;
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
.morehoriz{
font-size:10px;
vertical-align:middle;
position:absolute;
right:7px;
}
.morerightkey{
position:relative;
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
font-size:17px;
color:grey;
}
.repsize{
font-size:10px;
}

.card-panel{
padding: 6px !important;
min-height: 53px;
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
background-color: #01729b !important;

}

.sendbtn{
background-color : #ee6e73 !important;
padding : 0 10px;
margin-top: 7px;
}

.acbtnwidth{
width : 100%;
margin-bottom: -10px !important;
}

.emptydiary2{
    font-size: 16px;
    color: #cccccc96;
    font-weight: 500;
    text-shadow: 1px 1px rgba(0, 0, 0, 0.4);
}
.emptydiary3{
    text-align: center;
    padding-top: 120px;
 }
.emptydiary4{
    font-size: 44px;
    color: #f5f5f5eb;
    font-weight: 600;
    text-shadow: 1px 1px rgba(0, 0, 0, 0.31);
}
.writebt{
background-color:#01729b !important;
}
.acbottom{
margin-bottom: -3px !important;
}
.acopadding{
padding-bottom: 0px !important;
}

.aco_each_reply{
max-height: 300px;
overflow-y: scroll;
}
.likeoutputclass{
padding-left:22px;
}
.modalh{
height:30% !important;
top: 182px !important;
}
.modalh2{
height:28% !important;
top: 182px !important;
}

.imgheight{
height: 100%;
width : auto !important;
}
.personsize{
font-size: 19px !important;
}
.followmodalcenter{
text-align:center;
}
.followmodalcenter2{
text-align:center;
padding: 18px !important;
}
.likebtn2{
color:red;
}
</style>
<script>
$(document).ready(function(){
	var email = '${owner}';
	var customer = '${member.email}';
	$("input[name=publickeych]").each(function(){
		if($(this).val()==1){
			if(customer!=email){
				$(this).parents(".boardbottom").hide();
			}
		}
	})
	$('.carousel').carousel();
	
// 	$(".tc").each(function(){
// 		var length = 100; // 표시할 글자 수정하기
// 		$(this).each(function(){
// 			if($(this).text().length >= length){
// 				$(this).text($(this).text().substr(0, length) + '...'); // 지정한 글자수 이후 표시할 텍스트(...)
// 			}
// 		});
// 	});
	
	$(".emptydiary2").click(function(){
		$(location).attr("href","${path}/no/diary.jsp");	
	});
	$(".writebt").click(function(){
		if(confirm("작성페이지로 이동하시겠습니까?")){
			$(location).attr("href","${path}/no/diary.jsp");	
		}
	});
	//writebt
	
			$(".likebtn").each(function(){
				$(this).click(function(event){
					event.stopPropagation();
// 					alert("글번호"+$(this).attr("name"));
					var thisno = $(this).attr("name"); //<i>태그의 name값을 해당 글의 no로 설정.
					
					$.ajax({
						url:"${path}/timeline.do?method=like",
						data:"&no="+thisno+"&targetmail="+"${owner}"+"&mymail="+"${member.email}",
						type:"post",
						dataType:"html",
						success:function(data){
							var standard = data.indexOf("_");
// 							alert("스탠다드"+standard);
							var howcnt = data.substring(0,standard);
							var mychch = data.substring(standard+1);
							
// 							alert("좋아요 누른사람 인원 : "+howcnt);
// 							alert("나의 체크 유무 : "+mychch);
							if(howcnt!=0){
								
								$("#likeoutput_"+thisno).html(howcnt+"명이 좋아합니다.");
							}else{
								$("#likeoutput_"+thisno).html("");
							}
							if(mychch!=0){
								$("i[name="+thisno+"]").text("favorite");
								$("i[name="+thisno+"]").addClass("likebtn2");
							}else{
								$("i[name="+thisno+"]").text("favorite_border");
								$("i[name="+thisno+"]").removeClass("likebtn2");
							}
// 							alert("this의 value체크 : "+ $("i[name="+thisno+"]").text());
						}
					})
				})
			})
			
	$(".bookmark3").click(function(event){
			event.stopPropagation();
		})
	
	$(".lockline2").hide();
	$(".morehoriz").hide();
	if(email==customer){
		$(".morehoriz").show();
	}
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
	
	$('.actextarea2').keyup(function() {
        if($(this).val().length > 35) {
            $(this).val($(this).val().substring(0, 35));
        }
    });
		
	$(".sendbtn").hide();
	$(".editbtn").click(function(){
		$(".sendbtn").show();
	});
	
	$(".repbtn").each(function(){
		$(this).click(function(){
			var testid = $(this).parents("form").attr("id");
			var sendData = $("#"+testid).serialize();
			var targetdiv = $(this).attr("name");
			
// 			$("#"+testid).attr("action","${path}/timeline.do?method=replyinput");
			$.ajax({
				url:"${path}/timeline.do?method=replyinput",
				type:"post",
				dataType:"json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data: sendData,
				success:function(data){
					var data = data.replist;
					var datalastidx = data.length-1;
// 					alert("datasize : "+datalastidx);
					var resultcard ="";
// 					for(var idx=0 , len = data.length; idx<len; idx++){
// 					resultcard += '<div class="col s12 m8 offset-m2 l6 offset-l3" id="id_'+data[idx].refno+'">';
// 					resultcard+='<div class="card-panel grey lighten-5 z-depth-1">';
// 					resultcard+='<div class="valign-wrapper replyimgwrap">';
// 					resultcard+='<img src="${path}/sampleimg/'+data[idx].profile+'" alt="" class="circle replyimg" style="width:40px; height:40px;">';
// 					resultcard+='<div><i onclick="replymf('+data[idx].refno+')" class="material-icons replyfav replydeletebtn">delete</i></div>';
// 					resultcard+='<div class="replytext">';
// 					resultcard+='<div><span class="black-text repsize"> <span style="font-weight:bold">'+data[idx].nickname+'</span>&nbsp;'+data[idx].comments+'</span></div>';
// 					resultcard+='<div class="repsize"><span>'+data[idx].wdate+'</span></div>';
// 					resultcard+='</div></div></div></div>';
					resultcard += '<div class="col s12 m8 offset-m2 l6 offset-l3" id="id_'+data[datalastidx].refno+'">';
					resultcard+='<div class="card-panel grey lighten-5 z-depth-1">';
					resultcard+='<div class="valign-wrapper replyimgwrap">';
					resultcard+='<img src="${path}/filefolder/'+data[datalastidx].profile+'" alt="" class="circle replyimg" style="width:40px; height:40px;">';
					resultcard+='<div><i onclick="replymf('+data[datalastidx].refno+')" class="material-icons replyfav replydeletebtn">delete</i></div>';
					resultcard+='<div class="replytext">';
					resultcard+='<div><span class="black-text repsize"> <span style="font-weight:bold">'+data[datalastidx].nickname+'</span>&nbsp;'+data[datalastidx].comments+'</span></div>';
					resultcard+='<div class="repsize"><span>'+data[datalastidx].wdate+'</span></div>';
					resultcard+='</div></div></div></div>';
// 					}
					
// 					$("#"+targetdiv).html(resultcard);
					$("#"+targetdiv).append(resultcard);
					$("#"+testid).find(".actextarea").val("");
				}
			});
		});
	});
	
	/*--------------- 수정하기 부분----------시작 */
	$(".morehoriz").each(function(){
		$(this).click(function(){
			var thislinename = $(this).children(".morehorizi").attr("name");
			var thislineidx = thislinename.indexOf("_"); 
			var thislineno = thislinename.substring(0,thislineidx);
			$("input[name=timelineno]").val(thislineno);
		});
	});
	$("input[name=linemodify]").click(function(){
		$("#modalform").attr("action","${path}/timeline.do?method=modify");
		$("#modalform").submit();
	});
	/*--------------- 수정하기 부분----------끝*/
	
	
	/* ------삭제 부분---------시작 */
	$("input[name=linedelete]").click(function(){
		if(confirm("정말로 삭제하시겠습니까?\n삭제한 내용은 다시 되돌릴 수 없습니다.")){
			$("#modalform").attr("action","${path}/timeline.do?method=delete");
			$("#modalform").submit();
		}
	});
	/* ------삭제 부분---------끝 */
	
	$('.modal').modal();
	
	$("#msinputform").hide();
	$("#mystatecomments").click(function(){
		if(email==customer && confirm("상태메세지 추가(변경)하기")){
			$("#msinputform").show();
			$("#mystatecomments").hide();
		}
	});
	
	$(".mystate2").click(function(){	
		$("#MS").submit();
	});
	
	var personiconhtmlempty = '<i class="material-icons personsize modal-trigger modal2">person_add</i>';
	var personiconhtmlfull = '<i class="material-icons personsize modal-trigger modal2">person</i>';
	
	
	
	
	if("${fc}"!=0){
		$("span.personicon").html(personiconhtmlfull);
		$(".followbtncolor").removeClass("messegebtn2");
		$(".followbtncolor").addClass("messegebtn3");
	}else{
		$("span.personicon").html(personiconhtmlempty);
		$(".followbtncolor").removeClass("messegebtn3");
		$(".followbtncolor").addClass("messegebtn2");
	}
	$(document).on("click", ".modal2", function(){
		if(($(".modal2").text())=="person"){
			//팔로우 취소하고자할때
			$('#modal3').modal('open');
		}else{
			//팔로우 할때
			$('#modal2').modal('open');
		}
	})
	
	$("input[name=followbtn]").click(function(){
		$('.modal').modal('close');
		$.ajax({
			type:"post",
			data:"&follower="+customer+"&following="+email,
			dataType:"html",
			url:"${path}/timeline.do?method=follow",
			success:function(data){
				var standard = data.indexOf("_");
//					alert("스탠다드"+standard);
				var leftvalue = data.substring(0,standard);
				var rightvalue = data.substring(standard+1);
				if(leftvalue!=0){
					$("span.personicon").html(personiconhtmlfull);
					$(".followbtncolor").removeClass("messegebtn2");
					$(".followbtncolor").addClass("messegebtn3");
				}else{
					$("span.personicon").html(personiconhtmlempty);
					$(".followbtncolor").removeClass("messegebtn3");
					$(".followbtncolor").addClass("messegebtn2");
				}
// 				alert("rightvalue : "+rightvalue);
					$("#followercnt").html(rightvalue);
			}
		});
	
	});
	
	$(".followinglistbtn").click(function(){
		$("#followlistform").attr("action","${path}/timeline.do?method=followinglist");
		$("#followlistform").submit();
	});
	$(".followerlistbtn").click(function(){
		$("#followlistform").attr("action","${path}/timeline.do?method=followerlist");
		$("#followlistform").submit();
	});
	
	var nickname = "${nick}";
	$(".messegebtnin").click(function(){
		$(this).attr("href", "${path}/chatting/chatForm.jsp?nick=" + nickname);
	});

	
});
	function replymf(refno){
// 		alert(refno);
		if(confirm("댓글을 삭제 하시겠습니까?")){
			$.ajax({
				data:"refno="+refno,
				url:"${path}/timeline.do?method=refnodel",
				success:function(data){
					$("#id_"+refno).fadeOut();
				}
			});
		}
	}
	function tagadd(tagno){
		if($("#bookmark_"+tagno).text()=="bookmark_border"){
			$.ajax({
				dataType:"post",
				data:"mymail=${member.email}&no="+tagno,
				url:"${path}/timeline.do?method=tagadd",
				success:function(data){
				}
			});
					$("#bookmark_"+tagno).text("bookmark");
		}else if($("#bookmark_"+tagno).text()=="bookmark"){
			$.ajax({
				dataType:"post",
				data:"mymail=${member.email}&no="+tagno,
				url:"${path}/timeline.do?method=tagdel",
				success:function(data){
				}
			});
					$("#bookmark_"+tagno).text("bookmark_border");
		}
	}
</script>
<!-- contents -->
<div class="contents2">
	<div class="container">
		<div class="row timelinebt">
			<div class="test col s3">
				<div class="timelinetop valign-wrapper z-depth-3">
					<img src="${path}/filefolder/${ownerprofile}" alt="Contact Person"  class="profileimg">
				</div>
				<div class="flow-text center-align">
					<span style="font-size:13px;">${nick}</span>
				</div>
				
			</div>
			
			<div class="col s5" style="padding-left:0px;">
				<c:choose>
					<c:when test="${not empty mystate.comments}">
						<span style="font-size:13px;" id="mystatecomments">${mystate.comments}</span>
					</c:when>
					<c:otherwise>
						<span style="font-size:13px;" id="mystatecomments">...</span>
					</c:otherwise>
				</c:choose>
				<div id="msinputform">
				<form method="post" action="${path}/timeline.do?method=stateinsert" id="MS">
					<span style="font-size:13px;" class="mystate"><textarea class="actextarea actextarea2 acinput" name="comments" placeholder="내용을 입력하세요" data-length="35"></textarea></span>
						<input type="hidden" name="email" value="${member.email}"/>
						<div class="mytatediv valign-wrapper z-depth-3">
							<span class="mystate2">수정 완료</span>
						</div>
					</form>
				</div>
				
			</div>
			
			<div class="col s3 timelinetopleft">
				<div class="row" style="padding-top:10px; margin-bottom:10px;">
					<div class="col s6 followerlistbtn" style="padding-right:0px;">
						<span id="followercnt" class="flow-text timelinetopleftff" style=" font-weight:500;">${followinglistcnt}</span><br>
						<span class="flow-text timelinetopleftff">팔로워</span>
					</div>
					<div class="col s6 followinglistbtn" style="padding-right:0px;">
						<span class="flow-text timelinetopleftff fwingcnt" style=" font-weight:500;">${followerlistcnt}</span><br>
						<span class="flow-text timelinetopleftff">팔로잉</span>
					</div>
				</div>
				<form method="post"  id="followlistform">
					<input type="hidden" name="follower" value="${owner}"/>
				</form>
				<div class="valign-wrapper">
					<c:if test="${owner ne member.email}">
					<div class="messegebtn valign-wrapper z-depth-3">
						<a href="" class="messegebtnin">MESSAGE</a> 
					</div>
						<div class="followbtncolor valign-wrapper z-depth-3">
							<span class="messegebtnin personicon"></span> 
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<c:if test="${empty timeline}">
			<div class="emptydiary3">
				<span class="emptydiary4">
					<i>empty</i>
				</span>
			</div>
		</c:if>
		
		<!-- 작성버튼 시작 -->
		<div class="fixed-action-btn" style="bottom: 46px;right: 4px;">
          		<c:choose>
            		<c:when test="${empty timeline and (owner eq member.email)}">
	            		 <span class="emptydiary2">
						 	<i class="material-icons"><i>일기 작성하기!</i> edit</i>
						 </span>
			         	 <a class="btn-floating btn-medium writebt pulse">
			         	 	<i class="material-icons">mode_edit</i>
        	    		 </a>
            		</c:when>
        	    	<c:when test="${owner eq member.email}">
        	    		<a class="btn-floating btn-medium writebt">
			         	 	<i class="material-icons">mode_edit</i>
        	    		</a>
	            	</c:when>
	            </c:choose>
	        </div>
		<!-- 작성버튼 끝  -->
		
		<!-- 반복문으로 출력될  -->
		<c:forEach var="tl" items="${timeline}">
			<div class="boardbottom"><input type="hidden" name="publickeych" class="publickeych" value="${tl.publickey}"/>
			<div class="valign-wrapper morerightkey">
			<label  class="center-align lockline1">${fn:substring(tl.wdate,5,7)}월 ${fn:substring(tl.wdate,8,10)}일</label>
				<div class="lockline2">
					<i class="material-icons fav_eventprotect Tiny" style="margin-left:10px;">lock</i>비공개
				</div>
				<div class="morehoriz right-align">
					<i class="material-icons fav_eventprotect Tiny right-align modal-trigger morehorizi" style="margin-left:10px;" href="#modal1" name="${tl.no}_2">more_horiz</i>
				</div>
			</div>
				<div class="timelinebd z-depth-5">
					<div style="margin : 8px;">
						<div class="tc" style="font-size:13px;">&nbsp;${tl.comments}</div>
					</div>
						<c:if test="${not empty tl.fnames}">
			  				<div class="carousel carousel-slider center col s12" data-indicators="true">
								<c:forEach var="fname" items="${tl.fnames}">
												<a class="carousel-item" href="${fname.imgname}"><img src="${path}/filefolder/${fname.imgname}" class="imgheight"></a>
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
					      	<c:choose>
					      		<c:when test="${tl.myclickcheck eq 0 }">
						      	 	<i class="material-icons fav_eventprotect likebtn" name="${tl.no}" style="margin-left:10px;">favorite_border</i>
					      		</c:when>
					      		<c:otherwise>
					      			<i class="material-icons fav_eventprotect likebtn likebtn2"  name="${tl.no}" style="margin-left:10px;">favorite</i>
					      		</c:otherwise>
					      	 </c:choose>
			  				 <i class="material-icons" style="margin-left:4px;">chat_bubble_outlinearrow_drop_down</i>
			  				 
			  				 <c:choose>
			  				 	<c:when test="${tl.mytagstate eq 0 }">
				  				 	<i class="material-icons bookmark3" onclick="tagadd(${tl.no})" id="bookmark_${tl.no}">bookmark_border</i>
			  				 	</c:when>
			  				 	<c:otherwise>
			  				 		<i class="material-icons bookmark3" onclick="tagadd(${tl.no})" id="bookmark_${tl.no}">bookmark</i>
			  				 	</c:otherwise>
			  				 </c:choose>
					      </div>
					      	<input type="hidden" name="favo_${tl.no}" value="${tl.myclickcheck}"/>
			  				 <div class="likeoutputclass" id="likeoutput_${tl.no}">
				  				 <c:choose>
						      		<c:when test="${tl.likecnt eq 0}"></c:when>
						      		<c:otherwise>${tl.likecnt}명이 좋아합니다.</c:otherwise>
						      	</c:choose>
			  				 </div>
					      
			     	      	<!-- 아코디언 내부내용 시작-->
					      <div class="collapsible-body acopadding">
					      			<div class="aco_each_reply" id="${tl.no}">
					      			<!-- 카드 시작 -->
<!-- 									<div class="col s12 m8 offset-m2 l6 offset-l3"> -->
<!-- 										<div class="card-panel grey lighten-5 z-depth-1"> -->
<!-- 											<div class="valign-wrapper replyimgwrap"> -->
<%-- 													<img src="${path}/filefolder/profile.jpg" alt="" class="circle replyimg" style="width:40px; height:40px;"> --%>
<!-- 													notice the "circle" class -->
<!-- 													<div><i class="material-icons replyfav">favorite_border</i></div> -->
<!-- 													<div class="replytext"> -->
<!-- 														<div> -->
<!-- 															<span class="black-text repsize"> <span style="font-weight:bold">An Seong-jin</span>&nbsp;This is a square image. Add the "circle" class to it to make it appear circular. This is a square image. Add the "circle" class to it to make it appear circular. This is a square image. Add the "circle" class to it to make it appear circular. </span> -->
<!-- 														</div> -->
<!-- 														<div class="repsize"><span>1일 전</span></div> -->
<!-- 													</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									<!-- 카드 끝 -->
									<!-- 댓글 카드 시작 -->
									<c:if test="${not empty tl.reply}">
										<c:forEach var="rep" items="${tl.reply}">
											<div class="col s12 m8 offset-m2 l6 offset-l3" id="id_${rep.refno}">
												<div class="card-panel grey lighten-5 z-depth-1">
													<div class="valign-wrapper replyimgwrap">
															<img src="${path}/filefolder/${rep.profile}" alt="" class="circle replyimg" style="width:40px; height:40px;">
															<div>
																<c:if test="${rep.mymail eq member.email}">
																	<i onclick="replymf(${rep.refno})" class="material-icons replyfav replydeletebtn"">delete</i>
																</c:if>
															</div>
															<div class="replytext">
																<div>
																	<span class="black-text repsize"> <span style="font-weight:bold">${rep.nickname}</span>&nbsp;${rep.comments}</span>
																</div>
																<div class="repsize"><span>${rep.wdate}</span></div>
															</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
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
												      		<div class="row acbottom">
												      			<form method="post"  id="form_${tl.no}">
													      			<div class="col s10">
																			<textarea class="actextarea acinput" name="comments" placeholder="댓글을 입력하세요" data-length="120"></textarea>
																			<input type="hidden" name="targetmail" value="${tl.email}"/>
																			<input type="hidden" name="no" value="${tl.no}"/>
																			<input type="hidden" name="mymail"  value="${member.email}"/>
																			
																	</div>
																	<div class="col s2" >
																			 <button type="button" class="sendbtn btn repbtn"  name="${tl.no}"><i class="material-icons btn2">send</i></button>
																	</div>
																</form>
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
<!-- 글 수정삭제모달 해당 글 번호 -->
      <form id="modalform" method="post">
      	<input type="hidden" name="timelineno"/>
      </form>
<!-- 글 수정삭제 모달 시작 -->
  <div id="modal1" class="modal modal-fixed-footer modalh">
    <div class="modal-content">
      <h4>해당 게시글</h4>
      <input type="button"  class="btn" name="linemodify" value="수정하기"/>
      <input type="button" class="btn"  name="linedelete" value="삭제하기"/>
      
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">cancel</a>
    </div>
  </div>
  <!--글 수정삭제 모달 끝 -->
  
  
  
  <!-- 팔로잉 모달 시작 -->
  <div id="modal2" class="modal modal-fixed-footer modalh2">
    <div class="modal-content followmodalcenter">
      <h5>팔로잉 하시겠습니까?</h5>
      <input type="button"  class="btn" name="followbtn" value="팔로잉하기"/>
      
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">cancel</a>
    </div>
  </div>
  <!--팔로잉 모달 끝 -->
  
  <!-- 팔로잉취소 모달 시작 -->
  <div id="modal3" class="modal modal-fixed-footer modalh2">
    <div class="modal-content followmodalcenter2">
      <h5>팔로잉 취소하시겠습니까?</h5>
      <input type="button"  class="btn" name="followbtn" value="팔로잉 취소하기"/>
      
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">cancel</a>
    </div>
  </div>
  <!--팔로잉취소 모달 끝 -->  
  
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>