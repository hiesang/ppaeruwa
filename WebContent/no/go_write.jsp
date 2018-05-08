<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head3.jsp" %>
<script>
$(document).ready(function(){
	$("#submit").click(function(){
		getInfo();
		var sendData = $("form").serialize();
		$.ajax({
			type: "post",
			url: "${path}/sport.do?method=fitReviewInsert",
			data: sendData,
			success:function(data){
				$(location).attr("href", "${path}/sport.do?method=fitReviewList#test2");
			}
		});
	});
	
	/* var searchVal = "";
	$("#search").keyup(function(){
		searchVal = $(this).val();
		console.log(searchVal);
	}); */
});
</script>
<body>
<%@ include file="/include/top.jsp" %>
<div id="contents" class="fitness_write">
	<div class="container">
		<div class="row">
			<form class="col s12">
				<input type="hidden" name="email" class="validate" value="${member.email}">
				<div class="row">
					<div class="input-field col s12">
						<input id="nickname" type="text" name="nickname" class="validate" value="${member.nickname}">
						<label for="nickname">닉네임</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input id="search" type="text" name="search" class="validate">
						<label for="search" style="width:98%">검색</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div id="map" style="width:100%;height:350px;"></div>
						<input type="hidden" name="latitude" id="infoLat">
						<input type="hidden" name="longitude" id="infoLng">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="input-field col s12">
						<textarea id="textarea1" name="content" class="materialize-textarea"></textarea>
						<label for="textarea1">내용</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12 center-align">
						<button class="waves-effect waves-light btn" type="button" id="submit">확인</button>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4485fa7ee2f411e83940622dcfc62e56&libraries=services"></script>
		<script>
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new daum.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 
			
			// 키워드로 장소를 검색합니다
			$(document).ready(function(){
				$("#search").keyup(function(){
					var searchVal = $(this).val();
					ps.keywordSearch(searchVal, placesSearchCB); 
				});
			});
			//ps.keywordSearch(searchVal, placesSearchCB); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();
			
			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			        }       
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
			
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });
			
			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			
			function getInfo() {
			    // 지도의 현재 중심좌표를 얻어옵니다 
			    var center = map.getCenter(); 
			    
			    var lat = center.getLat().toFixed(6);
			    var lng = center.getLng().toFixed(6);
			    
			    var infoLat = document.getElementById('infoLat');
			    infoLat.value = lat;
			    
			    var infoLng = document.getElementById('infoLng');
			    infoLng.value = lng;
			}
		</script>
	</div>
</div>
<!-- contents -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>