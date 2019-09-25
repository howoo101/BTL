<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 -->
    <script type="text/javascript" src="resources/js/bootstrap.js"></script>
    <%--부트스트랩 CSS--%>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
    <%-- index css 커스텀--%>
    <link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">
    <%-- TH css 커스텀--%>
    <link rel="stylesheet" type="text/css" href="resources/css/THStyle.css">

    <!--부트스트랩 와치-->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-D/7uAka7uwterkSxa2LwZR7RJqH2X6jfmhkJ0vFPGUtPyBMF2WMq9S+f9Ik5jJu1" crossorigin="anonymous">

    <!-- 카카오 js -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- 카카오 init -->

    <script>Kakao.init('34800e916b17799e85bcefde72c06423')</script>
    <!-- 네이버 js -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <%--구글 로그인 커스텀--%>

    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <%-- 아이콘--%>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <!-- 카카오 지도 -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3c4fdcbe2ae096fbd9562312c53b316&libraries=services,clusterer,drawing"></script>

    <%-- chart 생성 위한 Chart.js --%>
    <script type="text/javascript" src="resources/js/Chart.js"></script>
    <script type="text/javascript" src="resources/js/Chart.bundle.js"></script>
    <title>홈</title>
</head>

<body>

<!-- 세션받아오기 -->
    <% String user = (String) session.getAttribute("user");%>
    <% String name = (String) session.getAttribute("name");%>

<!-- 로그인 인터셉터 (로그인창을 띄어주는 스크립트 임시호출)-->
    <% String ltr = (String) request.getAttribute("ltr");
if(user==null){
	if(ltr != null){  
%>
    <%=ltr%>
    <%
	}
}
%>

<input id="session" type="hidden" value="<%=user%>">  <!-- 로그인 세션파라미터 -->
<input id="name" type="hidden" value="<%=name%>">  <!-- 유저 이름 세션파라미터 -->

<header class="header-fixed">

    <div id="content-wrap">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="${path}/">
                <img src="${path}/resources/img/logo.png" height="36" width="69" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <div class="row">
                    <div style=" display:inline-block; position:fixed; top:10px">
                        <form action="search" class="form-inline my-2 my-lg-0" style="padding-left: 20px">
                            <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="기업명을 검색해주세요">
                            <button type="submit" class="btn btn-dark">검색</button>
                        </form>
                    </div>
                    <div style="display:inline-block; position:fixed; top:13px;right: 10px">
                        <input type="button" class="btn btn-info" onclick="location.href='${path}/list'" name="게시판"
                               value="우리다함께 취업합시다 ,취뽀게시판">

                        <div id="ucon">${name}</div>
                        <!-- login modal -->
                        <button type="button" id="loginmd" class="btn btn-primary" data-toggle="modal"
                                data-target="#loginModal">
                            로그인
                        </button>
                    </div>
                </div>
            </div>


            <!-- 모달 div -->
            <div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog loginmodal-dialog">
                    <div class="modal-content loginmodal-content">
                        <div class="modal-header loginmodal-header">
                            <h5 class="modal-title loginmodal-title">LOGIN</h5>
                            <button type="button" id="close" class="close" data-dismiss="modal" aria-hidden="true">×
                            </button>
                        </div>
                        <div class="modal-body loginmodal-body">

                        </div>
                        <div class="modal-footer loginmodal-footer">

                            <button id="login" class="btn btn-primary">로그인</button>
                            <button id="signup" class="btn btn-primary">회원가입</button>
                            <button id="pwfind" class="btn btn-primary">비밀번호찾기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 div 끝 -->

            <!-- 로그인했을시 보이는 user dropmenu -->
            <div class="btn-group" id="usermodal">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                        aria-expanded="false">
                    <span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">정회원 인증</a></li>
                    <li><a href="${pageContext.request.contextPath}/myPage_Following">마이페이지</a></li>
                    <li><a href="logout">log out</a></li>
                </ul>
            </div>
            <!-- 로그인했을시 보이는 user dropmenu 끝 -->
        </nav>
    </div>
</header>
<br/>
<br/>

<script>
    $("#loading-bar").hide(); // 평상시 감춤


    //로그인 후 유저 이름표시
    if ($('#name').val() == 'null') {
        $("#ucon").hide();
    }
    if ($('#name').val() != 'null') {
        $("#ucon").show();
    }

    // 세션이 있을시 로그인 메뉴를 감추고 회원메뉴를 show
    if ($('#session').val() == 'null') {
        $("#usermodal").hide();
        $("#loginmd").show();
    }
    if ($('#session').val() != 'null') {
        $("#usermodal").show();
        $("#loginmd").hide();
    }

    //최초 modal-body에 로드되는 로그인 페이지
    $("#loginModal").on("show.bs.modal", function () {
        $(".loginmodal-body").load("login");
        $("#login").hide();
        $("#signup").show();
        $("#pwfind").show();
    });

    //클릭시 modal-body에 해당 url로드
    $("#login").click(function () {
        $(".loginmodal-body").load("login");
    });

    $("#signup").click(function () {
        $(".loginmodal-body").load("signup");
    });

    $("#pwfind").click(function () {
        $(".loginmodal-body").load("pwfind");
    });

    // modal-footer
    $("#login").click(function () {
        $("#login").hide();
        $("#signup").show();
        $("#pwfind").show();
    });

    $("#signup").click(function () {
        $("#login").show();
        $("#signup").hide();
        $("#pwfind").show();
    });

    $("#pwfind").click(function () {
        $("#login").show();
        $("#signup").show();
        $("#pwfind").hide();
    });
</script>
