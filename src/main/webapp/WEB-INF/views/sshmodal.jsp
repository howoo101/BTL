<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>


<!-- Link trigger modal -->
<a href="sshlogin" data-remote="false" data-toggle="modal" data-target="#myModal" class="btn btn-primary">
    로그인
</a>

<div class="container">
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
				 <button type="button" class="btn btn-primary">회원가입</button>
				 <button type="button" class="btn btn-primary">비밀번호 찾기</button>
                </div>
            </div>
        </div>
    </div>
</div>
 
<script>


 $("#myModal").on("show.bs.modal", function(e) {
    var link = $(e.relatedTarget);
    $(this).find(".modal-body").load(link.attr("href"));
});





$('#login-btn').click(function() {
    $.ajax({
        type: "POST",
        url: "/sshlogin_chk",
        data: {    "user_email" : $('#inputEmail').val(),
            "user_password" : $('#inputPassword').val()},
        success: function() {
            alert('로그인 성공');
            location.reload();
        }, error: function() {
            alert('로그인 정보가 올바르지 않습니다.');
        }
    });
});


</script>



 <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<%--css ì»¤ì¤í--%>
<link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">
<!--ë¶í¸ì¤í¸ë© ìì¹ ììë³-->
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-D/7uAka7uwterkSxa2LwZR7RJqH2X6jfmhkJ0vFPGUtPyBMF2WMq9S+f9Ik5jJu1" crossorigin="anonymous">

<script type="text/javascript" src="resources/js/bootstrap.js"></script>

</body>
</html>