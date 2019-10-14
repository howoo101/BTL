<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="resources/js/star.js"></script>


<div class="container mt-4">
    <div class="card border-primary">
        <div class="card-body">
            <h5 style="color:royalblue;">내 리뷰 코멘트</h5>
            <hr style="border:1px solid #c7d5f8; padding: 0px;">
            <!-- Bootstrap table class -->
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">기업명</th>
                    <th scope="col">평가 내용</th>
                    <th scope="col">작성일</th>
                    <th scope="col">삭제</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${myReviewCommentList }" var="list">
                    <tr>
                        <th scope="row">
                            <a class='move'
                               href="${pageContext.request.contextPath}/info?ci_companyName=${list.ci_companyName}&ci_id=${list.ci_id}">${list.ci_companyName}</a>
                        </th>
                        <td><c:out value="${list.cr_comment }"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                                            value="${list.cr_regDate}" /></td>
                        <td><a href="${pageContext.request.contextPath}/adminCRdelete?cr_id=${list.cr_id}&user_email=${user_email}" >삭제</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>






