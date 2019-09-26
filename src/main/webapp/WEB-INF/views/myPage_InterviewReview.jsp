<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>


    <%@ include file="includes/myPage_Menu.jsp" %>

    <div class="container mt-4">
        <div class="card border-primary">
            <div class="card-body">
                <h5 style="color:royalblue;">내 면접 후기</h5>
                <hr style="border:1px solid #c7d5f8; padding: 0px;">
                <!-- Bootstrap table class -->
                <table class="table ">
                    <thead>
                    <tr class="">
                        <th scope="col">기업명</th>
                        <th scope="col">면접결과</th>
                        <th scope="col">작성일</th>
                        <th scope="col">수정 | 삭제</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${myInterviewList }" var="list">
                        <tr>
                            <th scope="row"><a class='move' href="${path}/info?ci_companyName=${list.ci_companyName}&ci_id=${list.ci_id}">${list.ci_companyName}</a></th>
                            <td><c:out value="${list.ir_result}"/></td>
                            <td><c:out value="${list.ir_interviewDate}"/></td>
                            <td><a class='move' href='<c:out value="${list.ci_id }"/>'>수정</a> | <a class='move' href='<c:out value="${list.ci_id }"/>'>삭제</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="includes/footer.jsp" %>

