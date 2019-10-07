<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp" %>

<style>



#mprc:hover {cursor:pointer;}
#mpir:hover {cursor:pointer;}
#mpf:hover {cursor:pointer;}
#mpl:hover {cursor:pointer;} 

</style>

<div class="col-lg-12 mt-4" id="user_status"> 
	<c:forEach var="ul" items="${Uinfo_list}">

  
	<script> 
	var authorization = ${ul.authorization_id}; 
	if(authorization==4){var grade = "<b>일반회원</b>";}
	else if(authorization==3){var grade = "<b>정회원</b>";}
	else if(authorization==1){var grade = "<b>관리자</b>";}
	</script>
	
<%String str = "<script>document.writeln(grade)</script>";%>
	
	<div class="col-lg-12 mt-4" id="user_status_header">
	<h4 style="color:royalblue">${ul.user_name}</h4>
	
	</div>
	<div class="col-ls-12 mt-3" id="user_status_body">
		 회원 등급  <%=str%> | 가입일자  <b>${ul.user_create_date}</b>
	</div>
	
	 <div class="col-lg-12 mt-4" id="user_status_footer">
		 <button type="button" class="btn btn-primary navbar-btn mt-2" onclick="location.href='${path}/user_info'">  <i class="material-icons ">settings_applications</i><b>회원정보 수정</b></button>
	 </div>
	</c:forEach>
</div>


<div class="row col-lg-12 mt-3 text-center" id="menu_nav">

        <div class="col-lg-3 text-primary" id="mprc" >
        <h4>내 리뷰 코멘트</h4>
        </div>
        <div class="col-lg-3 text-primary" id="mpir" >
        <h4>내 면접 후기</h4>
        </div>
        <div class="col-lg-3 text-primary" id="mpf" >
        <h4>팔로잉 기업</h4>
        </div>
        <btn class="col-lg-3 text-primary" id="mpl" >
        <h4>최근 본 기업</h4>
        </btn>      
</div>
<div id="mp_body">
    
</div> 

<!-- mypage js들 -->
<script>

$('#mprc').click(function(){
$("#mp_body").load("${pageContext.request.contextPath}/myPage_ReviewComment");
});
$('#mpir').click(function(){
$("#mp_body").load("${pageContext.request.contextPath}/myPage_InterviewReview");
});
$('#mpf').click(function(){
$("#mp_body").load("${pageContext.request.contextPath}/myPage_Following");
});
$('#mpl').click(function(){
$("#mp_body").load("${pageContext.request.contextPath}/myPage_Last");
});

</script>

  <%@ include file="../includes/footer.jsp" %>
  
