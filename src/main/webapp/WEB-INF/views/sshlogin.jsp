  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com">
     
    
    
  <form class="form-signin" action="sshlogin_chk">
        <h2 class="form-signin-heading">LOGIN</h2>
	        <label for="inputEmail" class="sr-only">Email address</label>
	        <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
	        <label for="inputPassword" class="sr-only">Password</label>
			 <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="Password" required>	      
	      	<div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> 이메일 기억하기
	          </label>
	        </div>    
	
	          <div class="g-signin2" data-onsuccess="onSignIn"></div> <!-- 구글 로그인 -->
	              
	       <button id="login-btn" class="btn btn-lg btn-primary btn-block" >로그인</button>    
 	</form>
 	
<script>
function onSignIn(googleUser) {
	  var id_token = googleUser.getAuthResponse().id_token; //id 토큰 획득 (id토큰에 사용자 정보가 모여있다 아이디번호,닉네임,이메일,프로필사진)
	  

	
	  //id 토큰을 서버로전송
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', 'tokens');
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xhr.onload = function() {
	    console.log('Signed in as: ' + xhr.responseText);
	  };
	  xhr.send('idtoken=' + id_token);
	
	}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
  
  
  
  
  
  
$('#login-btn').click(function(){
	$.ajax({
		url: "${pageContext.request.contextPath}/sshlogin_chk",
		type: "GET",
		data:{
			"user_email":$('#user_email').val()
			"user_password":$('#user_password').val()
		},
		
		success: function(data){
		
			
			}else{
			
			}
		},
		error: function(){
			alert("서버에러");
		}
	});
	
  
  
  
  
  
  
  
  
  
  
  
  
  
</script>