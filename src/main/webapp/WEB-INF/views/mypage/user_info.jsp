<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<style>
.col-xs-12 { margin: 10px; padding: 20px; }
</style>
<section>

<!-- 정보 수정 -->
<c:forEach var="ul" items="${Uinfo_list}">
<div class="container">
	 <form id="userinfo_modify">
	        <h2 class="userinfo_modify">회원 정보</h2>
	       		<br>
		    	<h6>이메일</h6>
		        <label for="inputEmail" class="sr-only">Email address</label>
			        <input type="email" value=${ul.user_email} name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
		    	<br>
		    	<h6>닉네임</h6>
		        <label for="inputName" class="sr-only">Name</label>
		 		 <input type="text" value=${ul.user_name} name="user_name" id="inputName"  class="form-control" placeholder="닉네임" required>
				<p id="nick">닉네임은 2~10글자로 작성해주세요.</p>	
				<br>
				<h6>비밀번호</h6>
		        <label for="inputPassword" class="sr-only">Password</label>
				 <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호" required>	      
		    	 <input type="password" name="user_passwordchk" id="inputPasswordchk" class="form-control" placeholder="비밀번호 확인" required>	      
		 		  <p id="pwchk">정보 수정을 위해 비밀번호를 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.</p>
		 		
		 		      
		 		  <input type="button" id="info_modify" value="정보수정" class="btn btn-lg btn-info btn-block">
		        
	 	</form>
 </div>	
</c:forEach>
 	
<script>
$(document).ready(function(e){
$('#inputEmail').attr("readonly",true);	
	var pwch = 1;	
	var namech = 1;	

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





		
//유효성검사
$('#info_modify').click(function(){
	if($.trim($('#inputPassword').val()) == ''){
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
		alert('정보 수정을 위해 비밀번호를 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.');
		$('#inputPassword').focus();
		return;
	}
	else if(namech==0){
		alert('닉네임을 2~10글자로 작성해주세요.');
		$('#inputName').focus();
		return;
	}
	
	//이메일 중복확인 
	else{
 	 	$.ajax({
			url: "${pageContext.request.contextPath}/user_info_modify.do",
			type: "post",
			data:{
				"user_email":$('#inputEmail').val(),
				"user_password":$('#inputPassword').val(),
				"user_name":$('#inputName').val()
			},	
			success: function(data){
 	 		if(data=='1'){
 	 		 	alert("수정이 완료되었습니다.");
 	 		 	$(location).attr("href", "myPage_Following");
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



 	


</section>

<%@ include file="../includes/footer.jsp" %>

