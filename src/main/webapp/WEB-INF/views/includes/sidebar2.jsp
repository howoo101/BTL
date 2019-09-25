<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="section8" class="mt-3" style="position: fixed;z-index: 3; top:60px;">
	<div id="mySidenav" class="sidenav">
		<a onclick="fnMove('0'); closeNav()" href="#"> 
		<i class="material-icons">info</i> <br> 기업정보</a>
	  						
		<a onclick="fnMove('7'); closeNav()" href="#">
		<i class="material-icons">location_searching</i> <br> 기업위치</a>
	
		<a onclick="fnMove('2'); closeNav()" href="#">
		<i class="material-icons">business_center</i> <br> 채용정보</a>
	
		<a onclick="fnMove('3'); closeNav()" href="#">
		<i class="material-icons">show_chart</i> <br> 월별그래프</a>
	
		<a onclick="fnMove('4'); closeNav()" href="#">
		<i class="material-icons">rate_review</i> <br> 리뷰 코멘트</a>
	
		<a onclick="fnMove('5'); closeNav()" href="#">
		<i class="material-icons">perm_camera_mic</i> <br> 면접후기</a>
					
		<a onclick="fnMove('6'); closeNav()" href="#">
		<i class="material-icons">fiber_new</i> <br> 뉴스</a>
	</div>

	<span style="font-size:30px;cursor:pointer;padding-left: 20px;background-color: white;" onclick="openNav()">&#9776;</span>

</div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "110px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

function fnMove(seq) {
	var offset = $("#section" + seq).offset();
	$('html, body').animate({
		scrollTop : offset.top
	}, 400);
}
</script>
