<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head3.jsp" %>
<script>
$(document).ready(function(){
	$("#menu_wrap").hide();
	$("#dropup_menu_wrap").click(function(){
		var dropup_area = $(this).parent(".dropup_area");
		if(dropup_area.css("top") == "400px"){
			$(this).children(".material-icons").html("keyboard_arrow_down");
			$("#menu_wrap").show();
			dropup_area.css("top", "0");	
		}else if(dropup_area.css("top") == "0px"){
			dropup_area.css("top", "400px");
			$("#menu_wrap").hide();
			$(this).children(".material-icons").html("keyboard_arrow_up");
		}
	});
});
</script>
<body>
<%@ include file="/include/top.jsp" %>
<div id="contents" class="fitness">
	<div class="container">
		<div class="row">
			<div class="col s12">
				<ul class="tabs">
					<li class="tab col s3"><a class="active" href="#test1">운동갈래</a></li>
					<li class="tab col s3"><a href="#test2">후기</a></li>
				</ul>
			</div>
		    <div id="test1" class="col s12">
		    	<br>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <!-- 지도타입 컨트롤 div 입니다 -->
				    <div class="custom_typecontrol radius_border">
				        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
				        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
				    </div>
				    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
				    <div class="custom_zoomcontrol radius_border"> 
				        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
				        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
				    </div>
					<div class="dropup_area">
						<div id="dropup_menu_wrap">
					    	검색하기 <i class="material-icons dp48">keyboard_arrow_up</i>
					    </div>
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                <form onsubmit="searchPlaces(); return false;">
					                    <!-- 키워드 :  --><input type="text" value="강남 헬스장" id="keyword" size="15"> 
					                    <button type="submit" class="waves-effect waves-light btn">검색하기</button> 
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
				    </div>
				</div>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4485fa7ee2f411e83940622dcfc62e56&libraries=services"></script>
				<script src="${path}/js/daum_map.js"></script>
		    </div>
		    <div id="test2" class="col s12">
		    	<div class="collection">
		    		<c:forEach var="reviewVal" items="${review}">
						<div class="collection-item">
					    	<span>${reviewVal.search}</span>
					    	<div class="writer right-align">${reviewVal.nickname} <fmt:formatDate value="${reviewVal.currdate}" pattern="yyyy-MM-dd" /></div>
					    	<div class="content">
					    		${reviewVal.content}
					    	</div>
					    </div>
					</c:forEach>
				</div>
				<div class="fixed-action-btn horizontal">
					<a href="${path}/no/go_write.jsp" class="btn-floating btn-large red">
						<i class="large material-icons">mode_edit</i>
					</a>
				</div>
			</div>
        </div>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>