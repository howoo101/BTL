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

<% String user = (String) session.getAttribute("user");%>


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
            
            
            <!-- login modal -->
         
 			<a href="sshlogin" data-remote="false" id="loginmodal" data-toggle="modal" data-target="#myModal" class="btn btn-primary">
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
			                
			                <button id="signup" class="btn btn-primary">회원가입</button>
			                <button id="pwfind" class="btn btn-primary">비밀번호찾기</button>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    
		 <!-- user modal -->
		 <div id="usermodal">
		   <p>ㅎㅇ</p>
  		 </div>
  		 
  		 
        </nav>
    </div>
</header>


<script>

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

     $("#signup").click(function(){
    	 $( ".modal-body" ).load( "sshsignup");
     });

     $("#pwfind").click(function(){
    	 $( ".modal-body" ).load( "sshpwfind");
     });
    



</script>


<%--ë¶í¸ì¤í¸ë© CSS--%>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<%--css ì»¤ì¤í--%>
<link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">
<!--ë¶í¸ì¤í¸ë© ìì¹ ììë³-->
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-D/7uAka7uwterkSxa2LwZR7RJqH2X6jfmhkJ0vFPGUtPyBMF2WMq9S+f9Ik5jJu1" crossorigin="anonymous">


<!-- JQuery -->
<script type="text/javascript" src="resources/js/bootstrap.js"></script>