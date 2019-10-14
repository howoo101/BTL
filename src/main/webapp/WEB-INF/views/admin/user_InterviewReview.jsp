<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% int user_id = (int) request.getAttribute("user_id"); %>

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
                    <th scope="col">면접날짜</th>
                    <th scope="col">삭제</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${myInterviewList }" var="list">
                    <tr>
                        <th scope="row"><a class='move'
                                           href="${pageContext.request.contextPath}/info?ci_companyName=${list.ci_companyName}&ci_id=${list.ci_id}">${list.ci_companyName}</a>
                        </th>
                        <td><c:out value="${list.ir_result}"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${list.ir_interviewDate}" /></td>
                        <td><a href="${pageContext.request.contextPath}/adminIRdelete?ir_id=${list.ir_id}&user_email=${user_email}" >삭제</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

