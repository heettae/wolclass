<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//내 위치 찾기
if (navigator.geolocation) {
   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
   navigator.geolocation.getCurrentPosition(function(position) {
       var lat = position.coords.latitude, // 위도
           lon = position.coords.longitude; // 경도
       alert(lat + ' , ' + lon);
     });
   
} else {
	alert('geolocation을 사용할수 없어요..');
}
// 내 위치 찾기
</script>
</body>
</html>