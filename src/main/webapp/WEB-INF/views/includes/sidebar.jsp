<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="section8" class="mt-3">
	<div id="page-wrapper" style="padding-left: 250px;">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper"
			style="position: fixed; z-index: 10; background-color: white; margin-left: -240px; width: 80px; overflow-x: hidden; overflow-y: auto;">
			<div class="card border-primary">
				<div class="card-body" style="padding:20px 0px 20px 0px">
					<ul class="sidebar-nav" style="list-style: none; list-style-type: none; text-align: center;" >
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('0')" href="#" style="font-size:10px;"> 
							<i class="material-icons text-primary" style="font-size:30px;">info</i> <br> 기업정보</a>
						</li>
						
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('7')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">location_searching</i> <br> 기업위치</a>
						</li>
						
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('2')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">business_center</i> <br> 채용정보</a>
						</li>
						
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('3')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">show_chart</i> <br> 월별그래프</a>
						</li>
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('4')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">rate_review</i> <br> 리뷰 코멘트</a>
						</li>
						
						
						<li style="padding-bottom:15px;">
							<a onclick="fnMove('5')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">perm_camera_mic</i> <br> 면접후기</a>
						</li>
						
										
						<li>
							<a onclick="fnMove('6')" href="#" style="font-size:10px">
							<i class="material-icons text-primary" style="font-size:30px">fiber_new</i> <br> 뉴스</a>
						</li>
						
					</ul>
				</div>
				<!-- /사이드바 -->
			</div>
		</div>
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
