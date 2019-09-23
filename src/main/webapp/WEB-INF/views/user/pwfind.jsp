  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
    
<form id="signupform" class="form-pwfind">
      <h2 class="form-signin-heading">비밀번호 찾기</h2>
      		<br>
    	<h6>이메일</h6>
        <label for="inputEmail" class="sr-only">Email address</label>
	        <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
	        <input type="button" id="check" value="체크" class="btn btn-info">
        <p id="EmailCheck"></p>
		<p>회원님의 비밀번호는 암호화되어 데이터베이스에 저장되므로 관리자도 알 수 없으므로 새로운 임시비밀번호를 생성하여 전달합니다.</p>
		<p> 소셜 기능으로 가입된 회원님의 비밀번호 
		 찾기기능은 이 홈페이지에서 제공하지 않습니다. 
		  해당 플랫폼 홈페이지에서 이용해주세요.</p>
  <div class="container text-center" id="loading-bar"><img class="img-responsive center-block" src="resources/img/ajax-loader.gif" /></div><br>
  <input type="button" id="submit" value="전송" class="btn btn-lg btn-info btn-block">
</form>
		
 	  
 	  
<script type="text/javascript">

$(document).ready(function(e){
 	$("#loading-bar").hide(); //첫 시작시 로딩바를 숨겨준다.
	
	var emailch = false;
	var Erchk = 0;
 	// 이메일 실시간 입력감지
	$("#inputEmail").on("propertychange change click keyup input paste",function(){	 
		var email = $(this).val();
	
		// if value is empty then exit
		if( email == '' || email == 'undefined' || email == null) 
			return;
		if(! email_check(email) ) {	
			$("#EmailCheck").html("잘못된 이메일 양식 ");
		    $(this).focus();
		    Erchk = 0;
		    return false;
		}
		else { 
		    $("#EmailCheck").html("올바른 이메일 양식 ok");
		    Erchk = 1;	  
		}
	}); 
 	
	function email_check( email ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email)); 
	}
	
	$('#check').click(function(){
		 if(!Erchk == 0){ //이메일 정규식 통과 검사
			$.ajax({
				url: "${pageContext.request.contextPath}/emailchk.do",
				type: "GET",
				data:{
					"user_email":$('#inputEmail').val()
					},
				success: function(data){
					if(data == 0 && $.trim($('#inputEmail').val()) != '' ){
						$('#EmailCheck').empty();
						$('#EmailCheck').html("존재하지 않는 이메일 입니다.");
					}else{
						$('#inputEmail').attr("readonly",true);	
						emailch=true;
						$('#EmailCheck').empty();
						$('#EmailCheck').html("이메일 확인 완료");
						}
					},
				error: function(){
					alert("서버에러");
				}
				}); //ajax 이벤트 끝
		 }else{
			 $('#EmailCheck').empty();
			 $('#EmailCheck').html("이메일을 올바르게 입력하고 확인버튼을 눌러주세요.");
	 	 }
	});  
			
	$('#submit').click(function(){
		if($.trim($('#inputEmail').val()) == ''){
			alert("이메일 입력이 되지 않았습니다.");
			$('#inputEmail').focus();
			return;
		}
		
		//이메일 중복확인 
		if(emailch==false){
			alert("이메일 체크를 해주세요.");
			return;
		} else{	
	 	 	$.ajax({
				url: "${pageContext.request.contextPath}/pwfind_go",
				type: "post",
				data:{
					"user_email":$('#inputEmail').val()
				},
				beforeSend:function(){
					$("#loading-bar").show();
				},
	 	 		success: function(data){
	 	 			$("#loading-bar").hide(); 
		 	 		if(data=='1'){
		 	 			 alert("이메일로 임시비밀번호가 전송 되었습니다. 확인해주세요.");
		 		 	 	 $( "#loginmodal-body" ).load( "login");  	
		 	 		}
		 	 		else if(data=='2'){
					alert("소셜 기능으로 가입된 회원님의 비밀번호 찾기기능은 이 홈페이지에서 제공하지 않습니다.");
						}
	 	 		},
	 	 		error: function(){
					alert("서버에러");
				}
			});
		} 
	});	
});
</script>