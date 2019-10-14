<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<table class="table table-bordered table-hover mt-5" style="text-align: center;">
    <thead>
    <tr>
        <th style="width: 50%">제목</th>
        <th style="width: 20%">작성자</th>
        <th style="width: 30%">답변 상태</th>
    </tr>
    </thead>

    <!--  테이블-->
    <c:forEach items="${list }" var="qna">
        <tr>
            <td style="text-align: left;"><a href='${path}/getQnA?qnA_id=${qna.qnA_id}'>
                    <c:out value="${qna.qnA_title }"/>
            <td><c:out value="${user}"/></td>
            <td>
                <c:out value="${qna.qnA_state ?'답변 완료':'답변 대기중'}"/>
            </td>
        </tr>
    </c:forEach>
</table>


<button id="qnAregisterBtn" onclick="location.href='${path}/QnARegister'">문의하기</button>