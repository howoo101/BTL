<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="card-body text-center mt-5">
        <h1>멤버쉽 회원입니다.</h1>
        <button class="btn btn-outline-info"  onclick="location.href='${path}/'">확인</button>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>
