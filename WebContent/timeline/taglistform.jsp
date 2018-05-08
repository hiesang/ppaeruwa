<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<%@ include file="/include/head.jsp"%>
	<%@ include file="/include/top.jsp"%>

	<style>
.contents2 {
	padding: 13px 0;
}

.timelinebt {
	margin-top: 0px;
}

.timelinetop {
	width: 47px;
    height: 47px;
    border-radius: 50%;
    margin: 1px 8px 0 11px;
    overflow: hidden;
    background-color: #00000029;
}

.tc {
	padding: 4px;
}

.row .timelinetopleft {
	padding: 0px;
}

.messegebtn {
	width: 65px;
	height: 20px;
	background-color: #01729b;
	border-radius: 5px;
	margin: 0 auto;
	color: white;
	font-weight: bold;
	font-size: 9px;
}

.messegebtn2 {
	width: 27px;
	height: 20px;
	background-color: #6666666b;
	border-radius: 5px;
	margin: 0 0 0 7px;
	color: white;
	font-weight: bold;
	font-size: 9px;
}

.messegebtn3 {
	width: 27px;
	height: 20px;
	background-color: #008ff2;
	border-radius: 5px;
	margin: 0 0 0 7px;
	color: white;
	font-weight: bold;
	font-size: 9px;
}

.mytatediv {
	width: 65px;
	height: 20px;
	background-color: #9b0101;
	border-radius: 5px;
	margin: 4px auto;
	color: white;
	font-weight: bold;
	font-size: 9px;
}

.messegebtnin {
	margin: 0 auto;
}

.mystate2 {
	margin: 4px auto;
}

.timelinebd {
	border-radius: 10px;
	padding-bottom: 12px;
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
.collapsible {
	webkit-box-shadow: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
	border: none !important;
}

.collapsible-header {
	border: 1px solid white;
	padding: 0rem;
}

.carousel {
	height: 200px;
}

.carousel.carousel-slider .carousel-item {
	height: 0% !important;
	min-height: 200px;
}

.test {
    padding-left: 0px;
    padding-top: 1px;
}

.bookmark3 {
	position: absolute;
	right: 19px;
	top: 11px;
}

.dr {
	position: relative;
	padding-top: 7px;
}

.boardbottom {
	margin-bottom: 14px;
}

.profileimg {
	width: 100%;
	vertical-align: middle;
}

.ttt {
	
}

.lockline2 {
	font-size: 10px;
	vertical-align: middle;
}

.morehoriz {
	font-size: 10px;
	vertical-align: middle;
	position: absolute;
	right: 7px;
}

.morerightkey {
	position: relative;
}

.collapsible-body {
	padding: 8px !important;
}

/* 아코디언시작 */
.replyimgwrap {
	position: relative;
}

.replyimg {
	position: absolute;
	top: 0px;
}

.replytext {
	margin-left: 49px;
	margin-right: 15px;
}

.replyfav {
	position: absolute;
	top: 3px;
	right: 0;
	font-size: 15px;
	color: grey;
}

.repsize {
	font-size: 10px;
}

.card-panel {
	padding: 6px !important;
	min-height: 53px;
}

/* 아코디언 끝 */
.editcenter {
	margin: auto;
}

.mcomment {
	height: 67px;
}

.btn2 {
	margin-right: 0px !important;
}

/* 아코디언 댓글입력창 */
.acinput {
	height: 55px;
	border-radius: 5px;
	width: 106% !important;
}

.acwidth {
	width: 100%;
}

.tbuttoncustom {
	border-radius: 18px !important;
	padding: 0 19px;
	background-color: #01729b !important;
}

.sendbtn {
	background-color: #ee6e73 !important;
	padding: 0 10px;
	margin-top: 7px;
}

.acbtnwidth {
	width: 100%;
	margin-bottom: -10px !important;
}

.emptydiary2 {
	font-size: 16px;
	color: #cccccc96;
	font-weight: 500;
	text-shadow: 1px 1px rgba(0, 0, 0, 0.4);
}

.emptydiary3 {
	text-align: center;
	padding-top: 120px;
}

.emptydiary4 {
	font-size: 44px;
	color: #f5f5f5eb;
	font-weight: 600;
	text-shadow: 1px 1px rgba(0, 0, 0, 0.31);
}

.writebt {
	background-color: #01729b !important;
}

.acbottom {
	margin-bottom: -3px !important;
}

.acopadding {
	padding-bottom: 0px !important;
}

.aco_each_reply {
	max-height: 300px;
	overflow-y: scroll;
}

.likeoutputclass {
	padding-left: 22px;
}

.modalh {
	height: 30% !important;
	top: 182px !important;
}

.modalh2 {
	height: 28% !important;
	top: 182px !important;
}

.imgheight {
	height: 100%;
	width: auto !important;
}

.personsize {
	font-size: 19px !important;
}

.followmodalcenter {
	text-align: center;
}

.followmodalcenter2 {
	text-align: center;
	padding: 18px !important;
}

.likebtn2 {
	color: red;
}
.tagid{
padding-bottom: 23px;
font-size: 13px;
}
.linedrawing{
background-color: #77777745;
height: 1px;;
margin : 8px 20px 5px 18px
}
.tagcomment{
    margin: 0 17px 5px 17px;
    line-height: 17px;
}
</style>
	<script>
		$(document)
				.ready(
						function() {
							var email = '${owner}';
							var customer = '${member.email}';
							$("input[name=publickeych]").each(function() {
								if ($(this).val() == 1) {
									if (customer != email) {
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

							$(".emptydiary2").click(
									function() {
										$(location).attr("href",
												"${path}/no/diary.jsp");
									});
							$(".writebt").click(
									function() {
										if (confirm("작성페이지로 이동하시겠습니까?")) {
											$(location).attr("href",
													"${path}/no/diary.jsp");
										}
									});
							//writebt

							$(".likebtn")
									.each(
											function() {
												$(this)
														.click(
																function(event) {
																	event
																			.stopPropagation();
																	// 					alert("글번호"+$(this).attr("name"));
																	var thisno = $(
																			this)
																			.attr(
																					"name"); //<i>태그의 name값을 해당 글의 no로 설정.

																	$
																			.ajax({
																				url : "${path}/timeline.do?method=like",
																				data : "&no="
																						+ thisno
																						+ "&targetmail="
																						+ "${owner}"
																						+ "&mymail="
																						+ "${member.email}",
																				type : "post",
																				dataType : "html",
																				success : function(
																						data) {
																					var standard = data
																							.indexOf("_");
																					// 							alert("스탠다드"+standard);
																					var howcnt = data
																							.substring(
																									0,
																									standard);
																					var mychch = data
																							.substring(standard + 1);

																					// 							alert("좋아요 누른사람 인원 : "+howcnt);
																					// 							alert("나의 체크 유무 : "+mychch);
																					if (howcnt != 0) {

																						$(
																								"#likeoutput_"
																										+ thisno)
																								.html(
																										howcnt
																												+ "명이 좋아합니다.");
																					} else {
																						$(
																								"#likeoutput_"
																										+ thisno)
																								.html(
																										"");
																					}
																					if (mychch != 0) {
																						$(
																								"i[name="
																										+ thisno
																										+ "]")
																								.text(
																										"favorite");
																						$(
																								"i[name="
																										+ thisno
																										+ "]")
																								.addClass(
																										"likebtn2");
																					} else {
																						$(
																								"i[name="
																										+ thisno
																										+ "]")
																								.text(
																										"favorite_border");
																						$(
																								"i[name="
																										+ thisno
																										+ "]")
																								.removeClass(
																										"likebtn2");
																					}
																					// 							alert("this의 value체크 : "+ $("i[name="+thisno+"]").text());
																				}
																			})
																})
											})

							// 	$(".bookmark3").click(function(event){
							// 			event.stopPropagation();
							// 		})

							// 	$(".lockline2").hide();
							$(".morehoriz").hide();
							if (email == customer) {
								$(".morehoriz").show();
							}
							// 	$(".boardbottom").each(function(){
							// 		var test = $(this).children(".publickeych").val();
							// 		if(test == 1){
							// 			$(this).children(".timelinebd").addClass("ttt");
							// 			$(this).find(".lockline2").show();
							// 		}
							// 	});

							// 	$(".sendbtn").hide();
							// 	$(".editbtn").click(function(){
							// 		$(".sendbtn").show();
							// 	});

							// 	/*--------------- 수정하기 부분----------시작 */
							// 	$(".morehoriz").each(function(){
							// 		$(this).click(function(){
							// 			var thislinename = $(this).children(".morehorizi").attr("name");
							// 			var thislineidx = thislinename.indexOf("_"); 
							// 			var thislineno = thislinename.substring(0,thislineidx);
							// 			$("input[name=timelineno]").val(thislineno);
							// 		});
							// 	});
							// 	$("input[name=linemodify]").click(function(){
							// 		$("#modalform").attr("action","${path}/timeline.do?method=modify");
							// 		$("#modalform").submit();
							// 	});
							// 	/*--------------- 수정하기 부분----------끝*/

							// 	/* ------삭제 부분---------시작 */
							// 	$("input[name=linedelete]").click(function(){
							// 		if(confirm("정말로 삭제하시겠습니까?\n삭제한 내용은 다시 되돌릴 수 없습니다.")){
							// 			$("#modalform").attr("action","${path}/timeline.do?method=delete");
							// 			$("#modalform").submit();
							// 		}
							// 	});
							// 	/* ------삭제 부분---------끝 */

							$('.modal').modal();

							// 	$(".mystate2").click(function(){	
							// 		$("#MS").submit();
							// 	});

							// 	var personiconhtmlempty = '<i class="material-icons personsize modal-trigger modal2">person_add</i>';
							// 	var personiconhtmlfull = '<i class="material-icons personsize modal-trigger modal2">person</i>';

							// 	if("${fc}"!=0){
							// 		$("span.personicon").html(personiconhtmlfull);
							// 		$(".followbtncolor").removeClass("messegebtn2")
							// 		$(".followbtncolor").addClass("messegebtn3")
							// 	}else{
							// 		$("span.personicon").html(personiconhtmlempty);
							// 		$(".followbtncolor").removeClass("messegebtn3")
							// 		$(".followbtncolor").addClass("messegebtn2")
							// 	}
							// 	$(document).on("click", ".modal2", function(){
							// 		if(($(".modal2").text())=="person"){
							// 			//팔로우 취소하고자할때
							// 			$('#modal3').modal('open');
							// 		}else{
							// 			//팔로우 할때
							// 			$('#modal2').modal('open');
							// 		}
							// 	})

							$("input[name=followbtn]")
									.click(
											function() {
												$('.modal').modal('close');
												$
														.ajax({
															type : "post",
															data : "&follower="
																	+ customer
																	+ "&following="
																	+ email,
															dataType : "html",
															url : "${path}/timeline.do?method=follow",
															success : function(
																	data) {
																var standard = data
																		.indexOf("_");
																//					alert("스탠다드"+standard);
																var leftvalue = data
																		.substring(
																				0,
																				standard);
																var rightvalue = data
																		.substring(standard + 1);
																if (leftvalue != 0) {
																	$(
																			"span.personicon")
																			.html(
																					personiconhtmlfull);
																	$(
																			".followbtncolor")
																			.removeClass(
																					"messegebtn2")
																	$(
																			".followbtncolor")
																			.addClass(
																					"messegebtn3")
																} else {
																	$(
																			"span.personicon")
																			.html(
																					personiconhtmlempty);
																	$(
																			".followbtncolor")
																			.removeClass(
																					"messegebtn3")
																	$(
																			".followbtncolor")
																			.addClass(
																					"messegebtn2");
																}
																// 				alert("rightvalue : "+rightvalue);
																$(
																		"#followercnt")
																		.html(
																				rightvalue);
															}
														});

											});

							// 	$(".followinglistbtn").click(function(){
							// 		$("#followlistform").attr("action","${path}/timeline.do?method=followinglist");
							// 		$("#followlistform").submit();
							// 	});
							// 	$(".followerlistbtn").click(function(){
							// 		$("#followlistform").attr("action","${path}/timeline.do?method=followerlist");
							// 		$("#followlistform").submit();
							// 	});

						});
	</script>
	<!-- contents -->
	<div class="contents2">
		<div class="container">
				<!-- 반복문으로 출력될  -->
				<%-- 		<c:forEach var="tl" items="${timeline}"> --%>
					<div class="valign-wrapper morerightkey">
						<label class="center-align lockline1">${fn:substring(tl.wdate,5,7)}1월
							${fn:substring(tl.wdate,8,10)}1일</label>
					</div>
					<div class="timelinebd z-depth-5">
							<div class="timelinebt">
							<div class="dr">
												<i class="material-icons bookmark3">bookmark</i>
											</div>
									<div class="test valign-wrapper">
											<div class="timelinetop valign-wrapper z-depth-3">
												<img src="${path}/filefolder/1_1.jpg" alt="Contact Person"
													class="profileimg">
											</div>
											<div class="flow-text tagid">
												<span>${nick}이름</span>
											</div>
									</div>
									<div>
										<div class="linedrawing">
										
										</div>
									</div>
									<div class="tagcomment">
										<span>asdaasd asd asd asd asd asd asd asd asd asd asd asd asd a sda sd a sd as d as d as d</span>
									</div>
<%-- 								<c:if test="${not empty tl.fnames}"> --%>
<!-- 									<div class="carousel carousel-slider center col s12" -->
<!-- 										data-indicators="true"> -->
<%-- 										<c:forEach var="fname" items="${tl.fnames}"> --%>
<%-- 											<a class="carousel-item" href="${fname.imgname}"><img --%>
<%-- 												src="${path}/filefolder/${fname.imgname}" class="imgheight"></a> --%>
<%-- 										</c:forEach> --%>
<!-- 									</div> -->
<%-- 								</c:if> --%>
									<div class="carousel carousel-slider center col s12" data-indicators="true">
										<a class="carousel-item" href="#"><img src="${path}/filefolder/1_1.jpg" class="imgheight"></a>
									</div>
								<div>
									
								</div>
							</div>
					</div>
		</div>
	</div>
	<%-- 		</c:forEach> --%>

	</div>
	</div>




	<!-- contents -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>