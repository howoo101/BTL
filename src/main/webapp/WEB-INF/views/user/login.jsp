<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>
<script>  

  
  var googleUser = {};
  
  
  var startApp = function() {
	    gapi.load('auth2', function(){
	      auth2 = gapi.auth2.init({
	        client_id: '589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	     });
	      attachSignin(document.getElementById('customBtn'));
	    });
	  };


  
  
  function attachSignin(element) {
    console.log(element.id);
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          document.getElementById('name').innerText = "Signed in: " +
              googleUser.getBasicProfile().getName();
        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
  </script>	
  
<style type="text/css">
  #customBtn {
      display: inline-block;
      background: white;
      color: #444;
      width: 100%;
      border-radius: 5px;
      border: thin solid #888;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-family: serif;
      font-weight: normal;
    }
    span.icon {
      background: url('resources/img/google_icon.png') transparent 5px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 42px;
      height: 42px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 42px;
      padding-right: 42px;
      font-size: 14px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  
    #kakao_btn {
    display: inline-block;
    background: #ffeb00;
    color: #444;
    width: 100%;
    border-radius: 5px;
    border: thin solid #888;
    box-shadow: 1px 1px 1px grey;
    white-space: nowrap;
  }
  
    #naver_btn {
    display: inline-block;
    background: #00c73c;
    color: #444;
    width: 100%;
    border-radius: 5px;
    border: thin solid #888;
    box-shadow: 1px 1px 1px grey;
    white-space: nowrap;
  }
  
  </style>
	

<!-- 네이버 js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 구글 login -->
 
<!-- 카카오 로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<form class="form-login">
	<h2 class="form-signin-heading">LOGIN</h2>
	<br> <label for="inputEmail" class="sr-only">Email address</label>
	<input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="이메일주소" required autofocus> 
	<label for="inputPassword" class="sr-only">Password</label> 
	<input type="password" name="user_password" id="inputPassword"class="form-control" placeholder="비밀번호" required> <br> 
	<input type="button" id="loginbtn" value="로그인"class="btn btn-lg btn-primary btn-block">
</form>
<br>


<!-- 소셜 로그인 패널 -->
<div id="sns_nav" class="text-center">

<div id="gSignInWrapper">
    <span class="label">Sign in with:</span>
    <div id="customBtn" class="customGPlusSignIn">
      <span class="icon"></span>
      <span class="buttonText">Google</span>
    </div>
 </div>
   <div id="name"></div>
   
<input type="button" id="kakao_btn" value="카카오 로그인" class="btn btn-lg">  <br>
<input type="button" id="naver_btn" value="네이버 로그인" class="btn btn-lg"> 

<div class="g-signin2 div-inline" data-onsuccess="onSignIn"></div> 
<a id="custom-login-btn" href="javascript:loginWithKakao()"><img src="resources/img/kakao_login_btn_medium.png"  height="42px"></a>
<div id="naver_id_login"></div>

</div>

<!-- 네이버 이메일 콜백리턴 -->
<input id="naver_email" type="hidden" value="">
<!-- 네이버 닉네임  콜백리턴 -->
<input id="naver_name" type="hidden" value="">


<script>

startApp();

// 네이버로그인 처리

var naver_id_login = new naver_id_login("qbkbZvOsyDOQedGRhs0e",
		"http://localhost:8282/findjob/callback");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 2, 40);
naver_id_login.setDomain("http://localhost:8282/");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();

/* 로그인 */
$('#loginbtn').click(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/login_chk.do",
		type : "POST",
		data : {
		"user_email" : $('#inputEmail').val(),
		"user_password" : $('#inputPassword').val(),
		},
		success : function(data) {
			if (data == '1') {
				alert("로그인 되었습니다.");
				$('.close').trigger('click');
				location.reload();
			} else if (data == '2') {
				alert("이메일 혹은 비밀번호를 다시 확인해주세요.");
				$('#inputEmail').focus();
			} else if (data == '3') {
				alert("이미 접속중인 계정입니다.");
				$('.close').trigger('click');
				location.reload();
			} else if (data == "google"
					|| data == "naver"
					|| data == "kakao") {
				var snstype = data;
				alert("회원님은 "
						+ snstype
						+ " SNS 계정으로 가입된 회원입니다.\n 해당 SNS플랫폼으로 로그인 해주세요.");
				$('#inputEmail').focus();
			 } 
			},
		error : function() {
			alert("서버에러");
		}
	});
});

/* 구글 로그인 */
 

 function onSignIn(googleUser) {
	var id_token = googleUser.getAuthResponse().id_token; //id 토큰 획득 (id토큰에 사용자 정보가 모여있다 아이디번호,닉네임,이메일,프로필사진)

	$.ajax({
		url : "${pageContext.request.contextPath}/google",
		type : "post",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			"idtoken" : id_token
		},
		success : function(data) {
			if (data == '1') {
				$('.close').trigger('click');
				location.reload();
			} else if (data == '2') {
				alert("로그인에 실패하였습니다 해당 이메일은 이미 다른 sns플랫폼 혹은 일반회원 계정으로 가입되어있습니다.")
				$('.close').trigger('click');
				location.reload();
			} else if (data == '3') {
				alert("sns회원 자동가입이 완료되었습니다.")
				$('.close').trigger('click');
				location.reload();
			}
		},
		error : function() {
			alert("서버에러");
		}
	});
}

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
}


/* 카카오 로그인  */
function loginWithKakao() {
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					var user_email = res.kaccount_email;
					var user_name = res.properties['nickname'];
					$.ajax({
							url : "${pageContext.request.contextPath}/kakao",
							type : "post",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							data : {
								"user_email" : user_email,
								"user_name" : user_name
							},
							success : function(data) {
								if (data == '1') {
									$('.close').trigger('click');
									location.reload();
								} else if (data == '2') {
									alert("로그인에 실패하였습니다 해당 이메일은 이미 다른 sns플랫폼 혹은 일반회원 계정으로 가입되어있습니다.")
									$('.close').trigger('click');
									location.reload();
								} else if (data == '3') {
									alert("sns회원 자동가입이 완료되었습니다.")
									$('.close').trigger('click');
									location.reload();
								}
							},
							error : function() {
								alert("서버에러");
							}
						});
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
};

//네이버 로그인 		     
function naverlogin() {
	$.ajax({
		url : "${pageContext.request.contextPath}/naver",
		type : "post",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			"user_email" : $('#naver_email').val(),
			"user_name" : $('#naver_name').val()
		},
		success : function(data) {
			if (data == '1') {
				$('.close').trigger('click');
				location.reload();
			} else if (data == '2') {
				alert("로그인에 실패하였습니다 해당 이메일은 이미 다른 sns플랫폼 혹은 일반회원 계정으로 가입되어있습니다.")
				$('.close').trigger('click');
				location.reload();
			} else if (data == '3') {
				alert("sns회원 자동가입이 완료되었습니다.")
				$('.close').trigger('click');
				location.reload();
			}
	
		},
		error : function() {
			alert("서버에러");
		}
	});
}
</script>