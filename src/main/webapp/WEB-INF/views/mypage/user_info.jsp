<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>


<section>

<% String snschk = (String) request.getAttribute("snschk"); %>
<input type="hidden" id="snschk" value="<%=snschk%>">

<!-- 닉네임 수정 -->


<div class="container col-lg-12 mt-4" id="user_info_modal">

 <c:forEach var="ul" items="${Uinfo_list}">
		<i class="material-icons mt-1" style="font-size:35px;">settings_applications</i><h3>회원 정보</h3>
       
      	<br>
    	<h6>이메일</h6>
        <label for="inputEmail" class="sr-only">Email address</label>
	        <input type="email" value=${ul.user_email} name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
    	<br>
    	<h6>닉네임</h6>
        <label for="inputName" class="sr-only">Name</label>
 		 <input type="text" value=${ul.user_name} name="user_name" id="inputName"  class="form-control" placeholder="닉네임" required>
		<p id="nick" class="mt-2" style="font-size:small">닉네임은 2~10글자로 작성해주세요.</p>		
 		<input type="button" id="name_modify" value="닉네임 수정" class="btn btn-lg btn-dark btn-block">
 </c:forEach>

<br>
<!-- 비밀번호  수정 -->

	<div id="pw_modify">
	<h6>비밀번호</h6>	
       <label for="inputPassword" class="sr-only">Password</label>
	 <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호" required>	      
   	 <input type="password" name="user_passwordchk" id="inputPasswordchk" class="form-control" placeholder="비밀번호 확인" required>	      
	<p id="pwchk" class="mt-2" style="font-size:small">비밀번호는 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.</p>		
   	<input type="button" id="pw_modify" value="비밀번호 수정" class="btn btn-lg btn-dark btn-block">
   	</div>
   	<br>

<div id="uim_back">
   	<button id="uim_back_btn" class="btn btn-light">
		<i class="material-icons" style="size:35px">
		meeting_room
		</i>
    </button>
</div>

</div>

<script>
$(document).ready(function(e){
	
$('#inputEmail').attr("readonly",true);	

var snschk = $("#snschk").val(); 


if(snschk==1){
$('#pw_modify').hide();
}



var namech = 1;	 //닉네임 정규식
var pwch = 0; //비밀번호 정규식	

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


// 닉네임 정규표현식 통과시 true 반환
function name_chk(name){
	var nameRule = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
	return (name != '' && name != 'undefined' && nameRule.test(name)); 
}
	
//닉네임 수정 유효성검사
$('#name_modify').click(function(){
	var result = confirm('닉네임을 현재 입력된 닉네임으로 수정하시겠습니까?');
	if(result){
		 if(namech==0){
			alert('닉네임을 2~10글자로 작성해주세요.');
			$('#inputName').focus();
			return;
			}
		else{
		 	$.ajax({
			url: "${pageContext.request.contextPath}/name_modify.do",
			type: "post",
			data:{
				"user_email":$('#inputEmail').val(),
				"user_name":$('#inputName').val()
			},	
			success: function(data){
	 		if(data=='1'){
	 		 	alert("수정이 완료되었습니다.");
	 		 	$(location).attr("href", "myPage_menu");
 			}
			},
	 		error: function(){
			alert("서버에러");
			}
			});
		  } 
	}else{}
});
	
	
	
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
	
//비밀번호 정규표현식 통과시 true 반환
function pw_chk(pw){
	var passRule = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	return (pw != '' && pw != 'undefined' && passRule.test(pw)); 
}

		
$('#pw_modify').click(function(){
var result = confirm('비밀번호를 현재 입력된 비밀번호로 수정하시겠습니까?');
if(result){
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
		alert('비밀번호를 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.');
		$('#inputPassword').focus();
		return;
	}	
	else{
	 	$.ajax({
		url: "${pageContext.request.contextPath}/pw_modify.do",
		type: "post",
		data:{
			"user_email":$('#inputEmail').val(),
			"user_password":$('#inputPassword').val()
		},	
		success: function(data){
	 		if(data=='1'){
	 		 	alert("수정이 완료되었습니다. 수정한 비밀번호로 다시 로그인 해주세요.");
	 		 	$(location).attr("href", "${pageContext.request.contextPath}/");
	 			}
		},
	 		error: function(){
			alert("서버에러");
		}
		});
  		}
	}else{}
});
	
$('#uim_back_btn').click(function(){
	var result = confirm('현재 입력을 취소하고 뒤로 가시겠습니까?');
	if(result){ 
	history.back(-1);
	}
	else{	
	}
});


});

</script>


</section>

<%@ include file="../includes/footer.jsp" %>

