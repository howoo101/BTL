<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  <!-- 카카오 js -->
   <script>Kakao.init('34800e916b17799e85bcefde72c06423')</script>  <!-- 카카오 init -->
  
  
   <!-- 네이버 js -->
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 
 


    <title>홈</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>

<!-- 세션받아오기 -->
<% String user = (String) session.getAttribute("user");%>
<% String non_auth = (String) session.getAttribute("non_auth");%>
<% String name = (String) session.getAttribute("name");%>

<!-- 로그인 인터셉터 관련 -->
<% String ltr = (String) request.getAttribute("ltr");
	
	 if(user==null){
  if(ltr != null){  %>
    <%=ltr%> 
  
<% 
  }
}
%> 
<!-- 등급 인터셉터 관련 -->
<% String gtr = (String) request.getAttribute("gtr");
	
	 if(user!=null){
  if(gtr != null){  %>
    <%=gtr%> 
  
<% 
  }
}
%> 

   <input id="session" type="hidden" value="<%=user%>">  <!-- 로그인 세션파라미터 -->
   <input id="nonauth" type="hidden" value="<%=non_auth%>">  <!-- 비인증회원 세션파라미터  -->
   <input id="name" type="hidden" value="<%=name%>">  <!-- 유저 이름 세션파라미터 -->



<header class="mt-3">
    <div id="content-wrap">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="${path}/">
                <img src="resources/img/logo.png" height="36" width="69" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <form action="search" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="기업명을 검색해주세요">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
                </form>
            </div>
            
            <div id="authmail">
               <img id ="loading-bar" class="img-responsive center-block" src="resources/img/ajax-loader.gif" />  
            	<button class="btn btn-dark" id="authbtn">인증메일 다시 받기</button>
            </div>
            
            <div id="ucon">${name}님 로그인 하셨습니다.</div>
            

            
            <!-- login modal -->
			<button type="button" id="loginmodal" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">
			  로그인			
			</button> 
			
			<!-- 모달 div -->
	 	     <div id="loginModal" class="modal fade" tabindex="-1" role="dialog"> 
			        <div class="modal-dialog" id="loginmodal-dialog">
			            <div class="modal-content" id="loginmodal-content">
			                <div class="modal-header" id="loginmodal-header">	
			                    <h5 class="modal-title" id="loginmodal-title">LOGIN</h5>
			                    <button type="button" id="close" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                </div>
			                <div class="modal-body" id="loginmodal-body">
			 
			                </div>
			                <div class="modal-footer" id="loginmodal-footer">
					     
			                <button id="login" class="btn btn-primary">로그인</button>
			                <button id="signup" class="btn btn-primary">회원가입</button>
			                <button id="pwfind" class="btn btn-primary">비밀번호찾기</button>
			                </div>
			            </div>
			        </div>
			    </div>
		 <!-- 모달 div 끝 -->
			    
		 <!-- 로그인했을시 보이는 user dropmenu -->
		<div class="btn-group" id="usermodal">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				  <span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span> 
				</button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#">정회원 인증</a></li>
			    <li><a href="${pageContext.request.contextPath}/myPage_Following">마이페이지</a></li>
			     <li><a href="logout">log out</a></li>
			  </ul>
		</div>
		<!-- 로그인했을시 보이는 user dropmenu 끝 -->
		

	  
        </nav>
    </div>
    

    
</header>


<script>
$("#loading-bar").hide(); // 평상시 감춤


// 인증메일 보내기

if ($('#nonauth').val() == 'null'){
		$("#authmail").hide();
		} 
if ($('#nonauth').val() != 'null'){
		$("#authmail").show();
		$("#authmail").click(function(){
	
			var result = confirm (" 현재 가입된 "+ $('#session').val() + "으로 인증메일을 다시 보내겠습니까?");
			if(result){
				$.ajax({
					url:"${pageContext.request.contextPath}/re_auth",
					type: "POST",
					data:{
						 "user_email" :$('#session').val(),
						},
						beforeSend:function(){
							$("#loading-bar").show();
						},
					success: function(data){
						$("#loading-bar").hide();
						if(data == '1' ){
							alert("인증메일이 전송되었습니다. 메일함에서 확인해주세요")	;
							}
						else if(data == '2' ){
							alert("이미 인증된 회원입니다. 재 로그인해주세요.");
							location.reload();
						}	
					   },
						error: function(){
							alert("서버에러");
						}
						}); 			
			}
			else {
			
			} 
			
		});


} 






//로그인 후 유저 이름표시

if ($('#name').val() == 'null'){
			$("#ucon").hide();
		} 
if ($('#name').val() != 'null'){
		$("#ucon").show();
} 
	


// 세션이 있을시 로그인 메뉴를 감추고 회원메뉴를 show

if ($('#session').val() == 'null'){
			$("#usermodal").hide();
			$("#loginmodal").show();	
		} 
if ($('#session').val() != 'null'){
		$("#usermodal").show();
		$("#loginmodal").hide();	
} 


//최초 modal-body에 로드되는 로그인 페이지
  $("#loginModal").on("show.bs.modal", function() {
	$( "#loginmodal-body" ).load( "login");
    $("#login").hide();
   	$("#signup").show();
   	$("#pwfind").show();
}); 



 //클릭시 modal-body에 해당 url로드
 
 	 $("#login").click(function(){
    	 $( "#loginmodal-body" ).load( "login");
    
     });

     $("#signup").click(function(){
    	 $( "#loginmodal-body" ).load( "signup");
    
     });

     $("#pwfind").click(function(){
    	 $( "#loginmodal-body" ).load( "pwfind");
 	
     });
   
 // modal-footer 


 
 $("#login").click(function(){
	$("#login").hide();
   	$("#signup").show();
   	$("#pwfind").show();
	});
  
    $("#signup").click(function(){
    	$("#login").show();
    	$("#signup").hide();
    	$("#pwfind").show();
     });

   $("#pwfind").click(function(){
    		$("#login").show();
        	$("#signup").show();
        	$("#pwfind").hide();
     });
 
  
 
 




</script>
