<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>


<section>

    <% String snschk = (String) request.getAttribute("snschk"); %>
    <input type="hidden" id="snschk" value="<%=snschk%>">

    <!-- 닉네임 수정 -->
    <div class="container col-lg-12 mt-4" id="user_info_modal">

        <c:forEach var="ul" items="${Uinfo_list}">
            <i class="material-icons mt-1" style="font-size:35px;">settings_applications</i>
            <h3>회원 정보</h3>

            <br>
            <h6>이메일</h6>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="email" value=${ul.user_email} name="user_email" id="inputEmail" class="form-control"
                   placeholder="이메일주소" required autofocus>
            <br>
            <h6>닉네임</h6>
            <label for="inputName" class="sr-only">Name</label>
            <input type="text" value=${ul.user_name} name="user_name" id="inputName" class="form-control"
                   placeholder="닉네임" required>
            <input type="button" id="nmcheck" value="중복체크 후 사용" class="btn btn-dark">
            <p id="nameCheck" class="mt-2" style="font-size:small">닉네임은 특수문자를 제외 2~10 글자로 입력해주세요.</p>
            <br>
            <input type="button" id="name_modify" value="닉네임 수정" class="btn btn-lg btn-dark btn-block">
        </c:forEach>

        <br>
        <!-- 비밀번호  수정 -->

        <div id="pw_modify_body">
            <h6>비밀번호</h6>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="user_password" id="inputPassword" class="form-control" placeholder="비밀번호"
                   required>
            <input type="password" name="user_passwordchk" id="inputPasswordchk" class="form-control"
                   placeholder="비밀번호 확인" required>
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
$(document).ready(function (e) {

    $('#inputEmail').attr("readonly", true);

    var snschk = $("#snschk").val();

    if (snschk == 1) {
        $('#pw_modify_body').hide();
    }

    var namech = 1;	 //닉네임 정규식
    var namechk = false; // 닉네임 체크
    var pwch = 0; //비밀번호 정규식

//이름 실시간 입력감지
$("#inputName").on("propertychange change click keyup input paste", function () {
    var name = $(this).val();
    if (name == '' || name == 'undefined' || name == null){
    	$("#inputName").attr("style","border-color:none;");
    	$("#nameCheck").empty();
        return;
    }
    if (!name_chk(name)) {
    	 $("#inputName").attr("style","border-color: red; box-shadow: none; -webkit-box-shadow: none;");
    	$("#nameCheck").attr("style","color:red;font-size:small;");
    	$("#nameCheck").html("닉네임은 특수문자를 제외 2~10 글자로 입력해주세요.");
        namech = 0;
        return false;
    } else
    	$("#inputName").attr("style","border-color:none;");
    	$("#nameCheck").attr("style","color:green;font-size:small;");
    	$("#nameCheck").html("올바른 닉네임 양식입니다. ");
        namech = 1;
});

// 비밀번호 실시간 입력감지
$("#inputPassword").on("propertychange change click keyup input paste", function () {
    var pw = $(this).val();
    if (pw == '' || pw == 'undefined' || pw == null)
        return;
    if (!pw_chk(pw)) {
        pwch = 0;
        return false;
    } else
        pwch = 1;
});

// 닉네임 정규표현식 통과시 true 반환
function name_chk(name) {
    var nameRule = /^[0-9a-zA-Z가-힣]{2,10}$/;
    return (name != '' && name != 'undefined' && nameRule.test(name));
}


/* 닉네임 중복 확인  */
$('#nmcheck').click(function () {
  if (!namech == 0) { //닉네임 정규식 통과 검사
  $.ajax({
     url: "${pageContext.request.contextPath}/namechk.do",
     type: "GET",
     data: {
         "user_name": $('#inputName').val()
     },
    success: function (data) {
        if (data == 0 && $.trim($('#inputName').val()) != '') {
        	namechk = true;
            $('#inputName').attr("readonly", true);
            $('#nameCheck').empty();            
            $("#nameCheck").attr("style","color:green;font-size:small;");
            $('#nameCheck').html("사용가능한 닉네임입니다.");
            $('#nmcheck').hide();
            $('#nmchange').show();

        } else {
            $('#nameCheck').empty();
            $("#inputName").attr("style","border-color: red; box-shadow: none; -webkit-box-shadow: none;");
            $("#nameCheck").attr("style","color:red;font-size:small;");
            $('#nameCheck').html("이미 사용중인 닉네임입니다.");
        }
    },
   error: function () {
   	Swal.fire({
 		  type: 'warning',
 		  text: '서버에러'
 		})
   }
    }); //ajax 이벤트 끝
} else {
    $('#nameCheck').empty();
    $("#nameCheck").attr("style","color:red;font-size:small;");
    $('#nameCheck').html("닉네임을 올바르게 입력하고 확인버튼을 눌러주세요.");
}
}); // click 이벤트 끝


//닉네임 수정 유효성검사

$('#name_modify').click(function () {
if(namechk==true){
Swal.fire({
	  text: "닉네임을 현재 입력된 닉네임으로 수정하시겠습니까?",
	  type: 'question',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '취소',
	  confirmButtonText: '확인'
	}).then((result) => {
if (result.value) {
	  if (namech == 0) {
		  Swal.fire({
    		  type: 'warning',
    		  text: '닉네임은 특수문자를 제외 2~10 글자로 입력해주세요.'
    		})
          $('#inputName').focus();
          return;
	  } else {
          $.ajax({
              url: "${pageContext.request.contextPath}/name_modify.do",
              type: "post",
              data: {
                  "user_email": $('#inputEmail').val(),
                  "user_name": $('#inputName').val()
              },
              success: function (data) {
                  if (data == '1') {
              		Swal.fire({
                       	type: 'success',
                     		  text: '수정이 완료되었습니다.',
                     		showConfirmButton: false
                       	});
               	var timer = setInterval(function() { 
               		$(location).attr("href", "myPage_menu");
          			}, 1500); 
                  }
              },
              error: function () {
            	  Swal.fire({
            		  type: 'warning',
            		  text: '서버에러'
            		})
              }
          });
      }
	 }
	})
	}else{
		Swal.fire({
			  type: 'warning',
			  text: '닉네임 중복체크를 해주세요.'
			})
	    $('#inputName').focus();
	    return;
	}
});	


$("#inputPassword").on("propertychange change click keyup input paste", function () {
    var pw = $(this).val();
    if (pw == '' || pw == 'undefined' || pw == null)
        return;
    if (!pw_chk(pw)) {
        pwch = 0;
        return false;
    } else
        pwch = 1;
});

//비밀번호 정규표현식 통과시 true 반환
function pw_chk(pw) {
    var passRule = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    return (pw != '' && pw != 'undefined' && passRule.test(pw));
}

$('#pw_modify').click(function () {
Swal.fire({
	  text: "비밀번호를 현재 입력된 비밀번호로 수정하시겠습니까?",
	  type: 'question',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  cancelButtonText: '취소',
	  confirmButtonText: '확인'
	}).then((result) => {
if (result.value) {
	
	 if ($.trim($('#inputPassword').val()) == '') {
			 Swal.fire({
        		  type: 'warning',
        		  text: '패스워드 입력이 되지 않았습니다.'
        		})
            $('#inputPassword').focus();
            return;
        }
        //패스워드 2번 입력 확인
        else if ($('#inputPassword').val() != $('#inputPasswordchk').val()) {
        	Swal.fire({
         		  type: 'warning',
         		  text: '패스워드가 다릅니다.'
         		})
            $('#inputPasswordchk').focus();
            return;
        } else if (pwch == 0) {
        	Swal.fire({
          		  type: 'warning',
          		  text: '비밀번호를 문자,숫자,특수문자 포함 8~12자리 이내로 입력해주세요.'
          	})
            $('#inputPassword').focus();
            return;
        } else {
        	$.ajax({
                url: "${pageContext.request.contextPath}/pw_modify.do",
                type: "post",
                data: {
                    "user_email": $('#inputEmail').val(),
                    "user_password": $('#inputPassword').val()
                },
                success: function (data) {
                    if (data == '1') {
                        Swal.fire({
                    		  type: 'success',
                    		  html: '수정이 완료되었습니다. <br> 수정한 비밀번호로 다시 로그인 해주세요.',
                    		  showConfirmButton: false
                    		})
                    		var timer = setInterval(function() { 
                    			 $(location).attr("href", "${pageContext.request.contextPath}/");
                    		}, 1500);
                       
                    }
                },
                error: function () {
                	Swal.fire({
                 		  type: 'warning',
                 		  text: '서버에러'
                 		})
                }
            });
        }
	 }
	})
});	



  $('#uim_back_btn').click(function () {
	  Swal.fire({
		  text: "현재 입력을 취소하고 뒤로 가시겠습니까?",
		  type: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '취소',
		  confirmButtonText: '확인'
		}).then((result) => {
	if (result.value) {
		history.back(-1);
			}
  		});
	  });
  	
});

</script>
</section>

<%@ include file="../includes/footer.jsp" %>

