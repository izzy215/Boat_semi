<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <jsp:include page="/sjKim/boat/header.jsp" />
<title>오시는 길</title>
 <link href ="${pageContext.request.contextPath}/jhLee/css/map.css"  rel ="stylesheet">
</head>
<body>


<hr>
<div class="map-wrap">
<div id="map" style="width:500px;height:400px;"></div>

<div class = "mapdetail">
<h2> <b class="boat">Boat</b>&nbsp;&nbsp;&nbsp;를 만나는곳 </h2>

<p><b>주소</b> <div class = "mapsub"> 서울 특별시 종로구 율곡로 10길 105 디아망 4층(봉익동 10-1)</div></p>
<p><b>전화</b> <div class = "mapsub"> 070-8240-3211~3</div></p>
<br>

<p><b class ="boat">Boat</b><b>&nbsp;&nbsp;&nbsp;구성원</b> <div class = "mapsub">김정근 김소중 양은정 이지현 </div>
<p><b><a href ="https://github.com/gittrain129/Boat">Github</a></b> <div class = "mapsub"> </div></p></p>
</div>
</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	7fdfc33ff395298d7cf8053acedaf837"></script>
	
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.57302473180881, 126.99232504321166),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);

		var imageSrc = '${pageContext.request.contextPath}/jhLee/image/boatmaker.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(37.57291886305824, 126.99229675412815); // 마커가 표시될 위치입니다
		    

		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		     position: markerPosition, 
		     image: markerImage // 마커이미지 설정 
		 });

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

	</script>
	
	
<jsp:include page="/sjKim/boat/footer.jsp" />
</body>
</html>