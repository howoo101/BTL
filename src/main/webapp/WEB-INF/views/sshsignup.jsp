<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


 <form id="signupform" class="form-signup" action="sshsignup_go">
        <h2 class="form-signin-heading">회원가입</h2>
	        <label for="inputEmail" class="sr-only">Email address</label>
		        <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
		        <input type="button" id="check" value="중복체크" class="btn btn-info">
	        <h6 id="EmailCheck"></h6>
	        
	        <label for="inputPassword" class="sr-only">Password</label>
			 <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호" required>	      
	    	 <input type="password" name="user_passwordchk" id="inputPasswordchk" class="form-control" placeholder="비밀번호 확인" required>	      
	 		  <input type="button" id="signUp" value="가입" class="btn btn-info">
	         
 	</form>
 	
 	
 	
<script>

$(document).ready(function(e){
		
		var Erchk = 0;


// check when email input lost foucus
$("#inputEmail").on("change paste keyup",function(){
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
	  else 
	  	$("#EmailCheck").html("올바른 이메일 양식 ok");
	  	 Erchk = 1;
	  
}); 


		
		
//정규표현식 통과시 true 반환		
 function email_check( email ) {    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email)); 
}




		
		
		var emailch = false; // 이메일 체크 
		
		
		//공백확인 
		$('#signUp').click(function(){
			if($.trim($('#inputEmail').val()) == ''){
				alert("아이디 입력.");
				$('#inputEmail').focus();
				return;
			}else if($.trim($('#inputPassword').val()) == ''){
				alert("패스워드 입력.");
				$('#inputPassword').focus();
				return;
			}
			//패스워드 2번 입력 확인
			else if($('#inputPassword').val() != $('#inputPasswordchk').val()){
				alert('패스워드가 다릅니다.');
				$('#inputPasswordchk').focus();
				return;
			}
			
			//아이디 중복확인 
			if(emailch==false){
				alert("이메일 중복체크를 해주세요.");
				return;
			}else{
				$('#signupform').submit();
			}
		});
	


/* 이메일 중복 확인  */
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
						emailch=true;
						$('#user_email').attr("readonly",true);	
						$('#EmailCheck').empty();
						$('#EmailCheck').html("사용가능");
					}else{
						$('#EmailCheck').empty();
						$('#EmailCheck').html("이미 가입된 메일입니다.");
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
				
			}); // click 이벤트 끝

});			


</script>



 	