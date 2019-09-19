  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com">
     
    
    
  <form class="form-login"  >
        <h2 class="form-signin-heading">LOGIN</h2>
	        <label for="inputEmail" class="sr-only">Email address</label>
	        <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
	        <label for="inputPassword" class="sr-only">Password</label>
			 <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호" required>	      
	       
	
	          <div class="g-signin2" data-onsuccess="onSignIn"></div> <!-- 구글 로그인 -->
	        <input type="button" id="loginbtn" value="로그인" class="btn btn-lg btn-primary btn-block">         
 	</form>
 
 	
<script>


/* 로그인 */
 
 

 $('#loginbtn').click(function() {
	 
		$.ajax({
			url: "${pageContext.request.contextPath}/login_chk.do",
			type: "POST",
			data:{
				 "user_email" : $('#inputEmail').val(),
		         "user_password" : $('#inputPassword').val(),
				},
			success: function(data){
				if(data == '1' ){
					alert("로그인 되었습니다.");
					$('.close').trigger('click'); 
					location.reload();
					}
				else if(data == '2' ){
					alert("로그인 되었습니다. 현재 인증메일 비인증회원입니다 인증메일을 확인하시고 인증해주세요.");		
					$('.close').trigger('click'); 
					location.reload();
					}
				else if(data == '4' ){
					alert("이미 접속중인 계정입니다.");		
					$('.close').trigger('click'); 
					location.reload();
					}
				else if(data == "google" || data == "naver" || data == "kakao"){
					var snstype = data;
					alert("회원님은 " + snstype  +" SNS 계정으로 가입된 회원입니다.해당 SNS플랫폼으로  로그인 해주세요.");
					$('#inputEmail').focus();
					}
				else{
					alert("이메일 혹은 비밀번호를 다시 확인해주세요.");
					$('#inputEmail').focus();
					}
				}
				,
				error: function(){
					alert("서버에러");
				}
				}); 
	 
 }); 



/* sns 로그인 */
function onSignIn(googleUser) {
	  var id_token = googleUser.getAuthResponse().id_token; //id 토큰 획득 (id토큰에 사용자 정보가 모여있다 아이디번호,닉네임,이메일,프로필사진)
	  
	

	  
	 	$.ajax({
			url: "${pageContext.request.contextPath}/tokens",
			type: "post",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{
				 "idtoken" : id_token
				},
				success: function(data){
					if(data == '1' ){
						$('.close').trigger('click'); 
						location.reload();
					}else if(data == '2' ){
						alert("이미 일반회원으로 가입된 이메일입니다. 일반회원 로그인으로 접근해주세요.")
						$('.close').trigger('click'); 
						location.reload();
					}
					else{
						alert("sns회원 자동가입이 완료되었습니다.")
						$('.close').trigger('click'); 
						location.reload();
						}
					},
					error: function(){
						alert("서버에러");
					}
				});  
	
	    
	
	}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
  
  
  

  

  
  
  
  
  
  
  
  
  
  
  
  
</script>