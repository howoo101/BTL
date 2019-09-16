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
    <title>홈</title>
</head>

<body>

<% String user = (String) session.getAttribute("user");

%>






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
            
            ${user}
            <!-- login modal -->
         
 			<a href="login" data-remote="false" id="loginmodal" data-toggle="modal" data-target="#myModal" class="btn btn-primary">
			    로그인
			</a>

			    <div id="myModal" class="modal fade" tabindex="-1" role="dialog"> 
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">	
			                    <h5 class="modal-title">LOGIN</h5>
			                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                </div>
			                <div class="modal-body">
			      <div class="g-signin2" data-onsuccess="onSignIn"></div>    
			                </div>
			                <div class="modal-footer">
			                
			                <button id="login" class="btn btn-primary">로그인</button>
			                <button id="signup" class="btn btn-primary">회원가입</button>
			                <button id="pwfind" class="btn btn-primary">비밀번호찾기</button>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    
		 <!-- user modal -->
		<div class="btn-group" id="usermodal">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				  <span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span> 
				</button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#">정회원 인증</a></li>
			    <li><a href="#">마이페이지</a></li>
			     <li><a href="logout">log out</a></li>
			  </ul>
			</div>
		
        </nav>
    </div>
</header>


<script>



// 세션이 있을시 로그인 메뉴를 감추고 회원메뉴를 show
var user = '<%out.print(user);%>';


if(user != null){
	$("#usermodal").show();
	$("#loginmodal").hide();
	
}  
if (user == 'null'){
	$("#usermodal").hide();
	$("#loginmodal").show();
	
} 

//최초 modal-body에 로드되는 로그인 페이지
 $("#myModal").on("show.bs.modal", function(e) {
    var link = $(e.relatedTarget);
    $(this).find(".modal-body").load(link.attr("href"));
});
 
 
 
 //클릭시 modal-body에 해당 url로드
 
 	 $("#login").click(function(){
    	 $( ".modal-body" ).load( "login");
     });

     $("#signup").click(function(){
    	 $( ".modal-body" ).load( "signup");
     });

     $("#pwfind").click(function(){
    	 $( ".modal-body" ).load( "pwfind");
     });
   
 // modal-footer 
 
 	$("#login").hide();
	$("#signup").show();
	$("#pwfind").show();
  
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
   $("#login").click(function(){
	$("#login").hide();
   	$("#signup").show();
   	$("#pwfind").show();
});
  



</script>
