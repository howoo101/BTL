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
                <div class="col-lg-12 mt-4" id="admin_footer">
                    <nav aria-label="Admin Page navigation">
                        <ul class="pagination justify-content-end">
                            <c:if test="${pageMaker.prev}">
                                <li class="page-item previous"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
                                </li>
                            </c:if> <c:forEach var="num" begin="${pageMaker.startPage }"
                                               end="${pageMaker.endPage }">
                            <li class="page-item ${pageMaker.cri.pageNum == num? 'active' : ''}"><a class="page-link"
                                                                                                    href="${num}">${num}</a>
                            </li>
                        </c:forEach> <c:if test="${pageMaker.next }">
                            <li class="page-item next"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
                        </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <!-- 페이징번호 -->
        <form id='actionForm' action="admin_page" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'>
            <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'>
        </form>

    </div>

</section>


