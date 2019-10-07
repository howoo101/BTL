<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<title></title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<!-- 네이버 로그인 콜백 jsp -->
<section>
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("qbkbZvOsyDOQedGRhs0e", "http://localhost:8282/findjob/callback");
        naver_id_login.get_naver_userprofile("naverSignInCallback()");

        function naverSignInCallback() {

            var user_email = naver_id_login.getProfileData('email')
            var user_name = naver_id_login.getProfileData('nickname');

            //부모창 한테 값넘기기
            $("#naver_email", opener.document).val(user_email);
            $("#naver_name", opener.document).val(user_name);

            opener.parent.naverlogin();  // 부모창 함수 호출

            self.close(); // 콜백창 닫음
        }
    </script>
</section>



