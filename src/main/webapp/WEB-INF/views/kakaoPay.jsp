<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1> kakaoPay api 이용하기 </h1>


<form method="post" action="kakaoPay" target="_blank">
    <button class="btn-outline-light"><img src="${path}/resources/img/kakopay_small.png" alt=""></button>
</form>


</body>
</html>
