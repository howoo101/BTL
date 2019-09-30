<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  <style>
/*  #menu_nav {width:100%;  text-align: center;}
  #mprc { border: 3px solid #F2F2F2;height:80px; vertical-align: middle;} */
 </style>     -->  
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



    <div class="col-lg-12 mt-4" id="menu_nav">
        <div class="row text-primary text-center">

            <div class="col-lg-3" id="mprc">
                <h4><a href="${pageContext.request.contextPath}/myPage_ReviewComment">내 리뷰 코멘트</a></h4>
            </div>
            <div class="col-lg-3" id="mpir">
                <h4><a href="${pageContext.request.contextPath}/myPage_InterviewReview">내 면접후기</a></h4>
            </div>
            <div class="col-lg-3" id="mpf">
                <h4><a href="${pageContext.request.contextPath}/myPage_Following">팔로잉 기업</a></h4>
            </div>
            <div class="col-lg-3" id="mpl">
                <h4><a href="${pageContext.request.contextPath}/myPage_Last">최근 본 기업</a></h4>
            </div>
        </div>
    </div>

