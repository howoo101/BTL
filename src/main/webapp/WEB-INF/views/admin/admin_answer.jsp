<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<section>

    <div class="container">
        <div class="mt-4" id="admin_div">
            <div class="col-lg-12 mt-4 text-primary" id="admin_header">
                <h2>문의 답변</h2>
                <div class="col-ls-12 mt-4" id="admin_body">
                    <table id="tables" class="table">
                        <tr>
                            <td><b>제목</b></td>
                            <td><b>이메일</b></td>
                            <td><b>답변 상태</b></td>
                        </tr>
                        <c:forEach var="al" items="${answerList}">
                            <tr>
                                <td>
                                    <a href="#" onclick="window.open('${pageContext.request.contextPath}/admin_answerUpdate?qnA_id=${al.qnA_id}','','width=800, height=500')">${al.qnA_title} </a>
                                </td>
                                <td>${al.user_email}</td>
                                <td><c:out value="${al.qnA_state? '답변 완료': '답변 대기중'}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>

</section>


