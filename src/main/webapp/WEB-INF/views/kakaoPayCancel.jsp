<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="card-body text-center mt-5">
        <h1>결제가 취소되었습니다.</h1>
        <button class="btn btn-outline-primary" onclick="location.href='${path}/'">홈으로</button>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>