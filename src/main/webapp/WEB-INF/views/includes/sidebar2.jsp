<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="section8" class="mt-5" style="position: fixed;z-index: 3; top:60px;">
	<div id="mySidenav" class="sidenav mt-5" style="width: 10vw">
		<a onclick="fnMove('0'); " href="#">
		<i class="material-icons">info</i> <br> 기업정보</a>
	  						
		<a onclick="fnMove('7'); " href="#">
		<i class="material-icons">location_searching</i> <br> 기업위치</a>
	
		<a onclick="fnMove('2');" href="#">
		<i class="material-icons">business_center</i> <br> 채용정보</a>
	
		<a onclick="fnMove('3'); " href="#">
		<i class="material-icons">show_chart</i> <br> 월별그래프</a>
	
		<a onclick="fnMove('4'); " href="#">
		<i class="material-icons">rate_review</i> <br> 리뷰 코멘트</a>
	
		<a onclick="fnMove('5');" href="#">
		<i class="material-icons">perm_camera_mic</i> <br> 면접후기</a>
					
		<a onclick="fnMove('6');" href="#">
		<i class="material-icons">fiber_new</i> <br> 뉴스</a>
	</div>


</div>
<script>
function fnMove(seq) {
	var offset = $("#section" + seq).offset();
	$('html, body').animate({
		scrollTop : offset.top
	}, 400);
}
</script>
