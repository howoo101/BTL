<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>



<!-- 구글 로그인 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<!-- 카카오 로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
        charset="utf-8"></script>


<form class="form-login">
    <h3 class="form-signin-heading">로그인</h3>
    <br> <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" name="user_password" id="inputPassword" class="form-control mt-2" placeholder="비밀번호"
           required> <br>
    <input type="button" id="loginbtn" value="로그인" class="btn btn-dark btn-block">
</form>
<br>


<!-- 소셜 로그인 패널 -->
<div id="sns_nav"><!-- sns nav -->
    <div id="gSignInWrapper">
        <div id="customBtn">
            <span id="cbicon" class="icon"></span>
            <span id="cblogin" class="customGPlusSignIn ml-3">Google</span>
        </div>
    </div>

    <div id="kSignInWrapper" class="ml-2 mr-2 mt-2">
        <div id="kakaoBtn">
            <span id="kbicon" class="kicon"></span>
            <span id="custom-login-btn" class="ml-3"><b>Kakao</b> </span>
        </div>
    </div>

    <div id="NSignInWrapper" class="mt-2">
        <div id="naverBtn" onclick="document.getElementById('naver_id_login_anchor').click();">
            <span id="nbicon" class="nicon"></span>
            <span id="custom-login-btn2" class="ml-3"><b>Naver</b><div id="naver_id_login"
                                                                      style="display:none;"></div></span>
        </div>
    </div>

</div>
<!-- // sns nav -->

<!-- 네이버 이메일 콜백리턴 -->
<input id="naver_email" type="hidden" value="">
<!-- 네이버 닉네임 콜백리턴 -->
<input id="naver_name" type="hidden" value="">


<script>

$("#kakaoBtn").click(function () {
    loginWithKakao();
});

    /* 구글 로그인  */
var googleUser = {};
var startApp = function () {
    gapi.load('auth2', function () {
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
            client_id: '589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com',
            cookiepolicy: 'single_host_origin',

            // Request scopes in addition to 'profile' and 'email'
            //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('customBtn'));
    });
};

function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function (googleUser) {
        var id_token = googleUser.getAuthResponse().id_token; //id 토큰 획득 (id토큰에 사용자 정보가 모여있다 아이디번호,닉네임,이메일,프로필사진)
    $.ajax({
        url: "${pageContext.request.contextPath}/google",
        type: "post",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            "idtoken": id_token
        },
        success: function (data) {
            if (data == '1') {
                $('.close').trigger('click');
                location.reload();
            } else if (data == '2') {
            	 Swal.fire({
                   	type: 'error',                    	
                 		title:"로그인에 실패하였습니다. ",
                 		text:"해당 이메일은  다른 소셜플랫폼 혹은 일반회원 계정으로 가입되어있습니다."
                   	});     
                $('.close').trigger('click');
                location.reload();
            } else if (data == '3') {
            	Swal.fire({
                	  type: 'success',
              		  text: '소셜회원 자동가입이 완료되었습니다.',
              		showConfirmButton: false,
              		  timer: 1500,
                	 });
                $('.close').trigger('click');
                location.reload();
            }
        },
      error: function () {
      	 Swal.fire({
             	type: 'error',
           		text: '서버 에러',
             	});
      }
  });

}, function (error) {

});
}

    startApp();


// 네이버로그인 처리
var Erchk = 0;

$("#inputEmail").on("propertychange change click keyup input paste", function () {
    var email = $(this).val();

    // if value is empty then exit
    if (email == '' || email == 'undefined' || email == null)
        return;
    if (!email_check(email)) {
        Erchk = 0;
        return false;
    } else
        Erchk = 1;
});


    //이메일 정규표현식 통과시 true 반환
    function email_check(email) {
        var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return (email != '' && email != 'undefined' && regex.test(email));
    }


    var naver_id_login = new naver_id_login("qbkbZvOsyDOQedGRhs0e",
        "http://localhost:8282/findjob/callback");
    var state = naver_id_login.getUniqState();
    naver_id_login.setDomain("http://localhost:8282/");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();


/* 로그인 */
$('#loginbtn').click(function () {
if ($.trim($('#inputEmail').val()) == '') {
	Swal.fire({
		  type: 'warning',
		  text: '이메일 입력이 되지 않았습니다.'
		})
    $('#inputEmail').focus();
    return;
} else if ($.trim($('#inputPassword').val()) == '') {
	Swal.fire({
  type: 'warning',
  text: '패스워드 입력이 되지 않았습니다.'
})
    $('#inputPassword').focus();
    return;
} else if (Erchk == 0) {
	Swal.fire({
  type: 'warning',
  text: '이메일을 정확히 입력해주세요.'
})
    $('#inputEmail').focus();
    return;
} else {
$.ajax({
    url: "${pageContext.request.contextPath}/login_chk.do",
    type: "POST",
    data: {
        "user_email": $('#inputEmail').val(),
        "user_password": $('#inputPassword').val(),
    },
    success: function (data) {
        if (data == '1') {
        	Swal.fire({
        	  type: 'success',
      		  text: '로그인 되었습니다.',
      		showConfirmButton: false
        	});
        	var timer = setInterval(function() { 
        		$('.close').trigger('click');
        		 location.reload(); 
   			}, 1000); 
        } else if (data == '2') {
            Swal.fire({
          	type: 'error',
        	text: '이메일 혹은 비밀번호를 다시 확인해주세요.',
          	});
            $('#inputEmail').focus();
        } else if (data == '3') {
        	 Swal.fire({
             	type: 'error',
           		text: '이미 접속중인 계정입니다.',
             	});
            $('.close').trigger('click');
            location.reload();
        } else if (data == "google"
            || data == "naver"
            || data == "kakao") 
        	{
            var snstype = data;  
            Swal.fire({
             	type: 'error',                    	
           		html:"회원님은 " + snstype + " 소셜 계정으로 가입된 회원입니다. <br> 해당 플랫폼 계정으로 로그인 해주세요."
             	});      
            $('#inputEmail').focus();
        }
    },
    error: function () {
    	 Swal.fire({
          	type: 'error',
        		text: '서버 에러',
          	});
    }
});
    }
});

    /* 카카오 로그인  */
function loginWithKakao() {  // 로그인 창을 띄웁니다.
   Kakao.Auth.login({
   success: function (authObj) {
   Kakao.API.request({
   url: '/v1/user/me',
   success: function (res) {
   var user_email = res.kaccount_email;
   var user_name = res.properties['nickname'];
    $.ajax({
        url: "${pageContext.request.contextPath}/kakao",
        type: "post",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            "user_email": user_email,
            "user_name": user_name
        },
   success: function (data) {
       if (data == '1') {
           $('.close').trigger('click');
           location.reload();
       } else if (data == '2') {
       	 Swal.fire({
             	type: 'error',                    	
           		title:"로그인에 실패하였습니다. ",
           		text:"해당 이메일은  다른 소셜 플랫폼 혹은 일반회원 계정으로 가입되어있습니다."
             	});      
           $('.close').trigger('click');
           location.reload();
       } else if (data == '3') {
       	Swal.fire({
         	  type: 'success',
       		  text: '소셜 회원 자동가입이 완료되었습니다.',
       		showConfirmButton: false,
       		  timer: 1500,
         	 });
           $('.close').trigger('click');
           location.reload();
	       }
	   },
	     error: function () {
	     	 Swal.fire({
	            	type: 'error',
	          		text: '서버 에러',
	            	});
	     }
    });
             }
         });
     },
     fail: function (err) {
 	 Swal.fire({
        	type: 'error',
      		text: JSON.stringify(err),
       	}); 
     }
 });
}

    //네이버 로그인
function naverlogin() {
  $.ajax({
      url: "${pageContext.request.contextPath}/naver",
      type: "post",
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      data: {
          "user_email": $('#naver_email').val(),
          "user_name": $('#naver_name').val()
      },
    success: function (data) {
        if (data == '1') {
            $('.close').trigger('click');
            location.reload();
        } else if (data == '2') {
        	 Swal.fire({
               	type: 'error',                    	
             		title:"로그인에 실패하였습니다. ",
             		text:"해당 이메일은 다른 소셜 플랫폼 혹은 일반회원 계정으로 가입되어있습니다."
               	});    
            $('.close').trigger('click');
            location.reload();
        } else if (data == '3') {
        	Swal.fire({
            	  type: 'success',
          		  text: '소셜 회원 자동가입이 완료되었습니다.',
          		showConfirmButton: false,
          		  timer: 1500,
            	 });
            $('.close').trigger('click');
            location.reload();
        }

    },
   error: function () {
   	 Swal.fire({
          	type: 'error',
        		text: '서버 에러',
          	});
   }
    });
}
</script>