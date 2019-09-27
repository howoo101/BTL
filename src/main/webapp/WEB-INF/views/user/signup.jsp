<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<form id="signupform">
	<h3 class="form-signin-heading">회원가입</h3>
    <br>
   	<h6>이메일</h6>
    <label for="inputEmail" class="sr-only">Email address</label>
	<input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
	<input type="button" id="check" value="중복체크" class="btn btn-dark mt-2">
    <p id="EmailCheck" class="mt-2" style="font-size:small"></p>
    
    <div class="container text-center" id="loading-bar1">
		<img class="img-responsive center-block" src="resources/img/ajax-loader.gif" />
	</div>
  
   
   	<div id="EmailAuthdiv">
   	<br>
   	<h6>이메일 인증</h6>
    <label for="inputAuthNum" class="sr-only">이메일 인증번호</label>
	<input type="text" name="auth_key" id="inputAuthNum" class="form-control " placeholder="이메일로 발송된 인증번호를 입력해주세요." required>
	<p id="EmailAuth" class="mt-2" style="font-size:small">이메일 중복체크를 먼저 해주세요.</p>
	<input type="button" id="authsubmit" value="이메일 인증번호 발송" class="btn btn-dark mt-2">
	<input type="button" id="authcheck" value="이메일 인증번호 확인" class="btn btn-dark mt-2">
	<br>
	</div>
   	<h6 class="mt-3">닉네임</h6>
    <label for="inputName" class="sr-only">Name</label>
	<input type="text" name="user_name" id="inputName" class="form-control" placeholder="닉네임" required>
	<p id="nick" class="mt-2" style="font-size:small">닉네임은 2~10글자로 작성해주세요.</p>	
	<br>	
	<h6>비밀번호</h6>
	<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호" required>	      
		<input type="password" name="user_passwordchk" id="inputPasswordchk" class="form-control" placeholder="비밀번호 확인" required>	      
	<p id="pwchk" class="mt-2" style="font-size:small">비밀번호는 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.</p>		
	<div class="container text-center" id="loading-bar2">
		<img class="img-responsive center-block" src="resources/img/ajax-loader.gif" />
	</div>
	<br>
		<input type="button" id="signUp" value="가입" class="btn btn-lg btn-dark btn-block">
</form>
 	
<script>
$(document).ready(function(e){




//최초의 숨김 요소들
	$("#authsubmit").hide();
	$("#authcheck").hide(); 
	$("#loading-bar1").hide();
	$("#loading-bar2").hide(); 
	
	var Erchk = 0; //이메일 정규식 
	var pwch = 0;	 // 비밀번호 정규식
	var namech = 0;	 //이름 정규식
	var authch = 0;	 // 인증키 인증여부
	
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
	  else 
		  $("#EmailCheck").html("올바른 이메일 양식 ok");
		  Erchk = 1;
	}); 


	// 비밀번호 실시간 입력감지
	$("#inputPassword").on("propertychange change click keyup input paste",function(){
		var pw = $(this).val();
		if( pw == '' || pw == 'undefined' || pw == null) 
			return;
		if(! pw_chk(pw)){
			pwch = 0;
			return false;
		}
		else 
			pwch = 1;
		});
	
	//이름 실시간 입력감지
	$("#inputName").on("propertychange change click keyup input paste",function(){
		var name = $(this).val();
		if( name == '' || name == 'undefined' || name == null) 
			return;
		if(! name_chk(name)){
			namech = 0;
			return false;
		}
		else 
			namech = 1;
	});
	
	//이메일 정규표현식 통과시 true 반환		
	 function email_check( email ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email)); 
	}

	// 비밀번호 정규표현식 통과시 true 반환
	function pw_chk(pw){
		var passRule = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		return (pw != '' && pw != 'undefined' && passRule.test(pw)); 
	}

	// 닉네임 정규표현식 통과시 true 반환
	function name_chk(name){
		var nameRule = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
		return (name != '' && name != 'undefined' && nameRule.test(name)); 
	}

	var emailch = false; // 이메일 체크 

	//유효성검사
	$('#signUp').click(function(){
		if($.trim($('#inputEmail').val()) == ''){
			alert("이메일 입력이 되지 않았습니다.");
			$('#inputEmail').focus();
			return;
		}else if($.trim($('#inputPassword').val()) == ''){
			alert("패스워드 입력이 되지 않았습니다.");
			$('#inputPassword').focus();
			return;
		}
		//패스워드 2번 입력 확인
		else if($('#inputPassword').val() != $('#inputPasswordchk').val()){
			alert('패스워드가 다릅니다.');
			$('#inputPasswordchk').focus();
			return;
		}
		
		else if(pwch==0){
			alert('비밀번호를 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.');
			$('#inputPassword').focus();
			return;
		}	
		else if(namech==0){
			alert('닉네임은 2~10글자로 작성해주세요.');
			$('#inputName').focus();
			return;
		}
		
		//이메일 , 인증번호 중복확인 
		else if(emailch==false){
			alert("이메일 중복체크를 해주세요.");
			return;
			}
		else if(authch==false){
			alert("이메일 인증코드 체크를 해주세요.");
			return;
		}else{
	 	 	$.ajax({
				url: "${pageContext.request.contextPath}/signup_go.do",
				type: "post",
				data:{
					"user_email":$('#inputEmail').val(),
					"user_password":$('#inputPassword').val(),
					"user_name":$('#inputName').val()
				},
				beforeSend:function(){
					$("#loading-bar").show();
				},
				success: function(data){
	 	 			$("#loading-bar").hide(); 
	 	 			
	 	 			if(data=='1'){
		 	 		 	alert("가입이 완료 되었습니다! 로그인 해주세요.");
		 		 	 	 $( ".loginmodal-body" ).load( "login");  	
	 	 			}
				},
	 	 		error: function(){
					alert("서버에러");
				}
			});
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
					$('#inputEmail').attr("readonly",true);	
					$('#EmailCheck').empty();
					$('#EmailCheck').html("사용가능한 이메일입니다.");
					$('#check').hide();
					$('#authsubmit').show();
					$('#EmailAuth').empty();
					
				}else{
					$('#EmailCheck').empty();
					$('#EmailCheck').html("이미 가입된 이메일입니다.");
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
	
	
	/* 이메일 인증번호 발송 */
	

	$('#authsubmit').click(function(){
	var result = confirm('현재 입력된 메일로 인증코드를 발송 하시겠습니까?');
		if(result){
		$.ajax({
			url: "${pageContext.request.contextPath}/auth_submit.do",
			type: "post",
			data:{
				"user_email":$('#inputEmail').val()
				},
			beforeSend:function(){
				$("#loading-bar1").show();
				},
			success: function(data){
				$("#loading-bar1").hide();
				if(data == '1' ){
				alert("입력하신 이메일로 인증코드가 발송되었습니다. \n 확인 후 인증코드란에 코드를 입력해주세요.");
				$("#EmailAuthdiv").show();
				$("#authcheck").show(); 
				}
				},
				error: function(){
					alert("서버에러");
				}
			}); //ajax 이벤트 끝
		}
		else {}
	}); // click 이벤트 끝



	
	
	
	
	/* 이메일 인증번호 확인 */
	$('#authcheck').click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/auth_check.do",
			type: "post",
			data:{
				"auth_key":$('#inputAuthNum').val()
				},
			success: function(data){
				if(data == '1' ){
				$('#inputAuthNum').attr("readonly",true);	
				alert("인증번호가 확인되었습니다.");
				$("#authsubmit").hide();
				$("#authcheck").hide(); 
				$('#EmailAuth').html("인증번호가 확인되었습니다.");
				authch = 1;
				}
				else if(data == '2' ){
				alert("인증번호가 틀렸습니다.");
				$('#EmailAuth').html("인증번호가 틀렸습니다.");
				}
				},
				error: function(){
					alert("서버에러");
				}
			}); //ajax 이벤트 끝
		}); // click 이벤트 끝
});		
</script>