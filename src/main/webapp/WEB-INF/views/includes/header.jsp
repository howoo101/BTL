<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title>홈</title>
</head>

<body>

<header class="mt-3">
    <div id="content-wrap">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="resources/img/logo.png" height="36" width="69" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="기업명을 검색해주세요">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
                </form>
            </div>
            <div class="float-lg-right nav-btn-login">
                <div class="btn-primary">로그인</div>
            </div>
        </nav>

    </div>
</header>