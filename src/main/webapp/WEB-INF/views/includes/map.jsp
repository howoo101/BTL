<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="section7" class="mt-3">
	<div class="container center-block">
		<div class="card border-primary">
			<div class="card-body">
				<%-- 기업 위치 제목--%>
				<div class="text-primary font-weight-bold card-title">
					<h5>기업 위치</h5>
				</div>
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 350px; display: block;"></div>

					<div id="notfound" style="display: none;">
						<img src="https://colorlib.com/wp/wp-content/uploads/sites/2/404-error-template-3.png" style="width: 100%; height: 350px;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--end section --%>
</div>

<script>
	//마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex : 1});

	//회사 이름과 주소를 넣는 변수
	var mapkey = '${ci_companyName}';
	<c:forEach items="${companyList}" var="vo">
		mapkey = mapkey + '${vo.ci_address}';
	</c:forEach>

	// 장소를 검색합니다
	ps.keywordSearch(mapkey, placesSearchCB);

	// 검색이 안됐을때 뜨는 페이지
	var notfoundImg = document.getElementById('notfound');

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	        
	    // 에러가 뜬다면 404 이미지 띄우기
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			notfoundImg.style.display = "block";
			mapContainer.style.display = "none";
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {
			notfoundImg.style.display = "block";
			mapContainer.style.display = "none";
			return;
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
</script>