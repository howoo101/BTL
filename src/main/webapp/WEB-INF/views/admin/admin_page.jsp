<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<section>

    <div class="container">
        <div class="mt-4" id="admin_div">
            <div class="col-lg-12 mt-4 text-primary" id="admin_header">
                <h2>관리 모드</h2>
                <form id="searchForm" action="admin_page" class="mt-4" method="get">
                    <select name='type'>
                        <option value="i"
                                <c:out value="${pageMaker.cri.type eq 'i'? 'selected' : ''}"/>>유저번호
                        </option>
                        <option value="n"
                                <c:out value="${pageMaker.cri.type eq 'n'? 'selected' : ''}"/>>닉네임
                        </option>
                    </select>

                    <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
                    <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
                    <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
                    <button class='btn btn-primary'>검색</button>
                </form>
            </div>
            <div class="col-ls-12 mt-4" id="admin_body">
                <table id="tables" class="table">
                    <tr>
                        <td><b>user_id</b></td>
                        <td><b>등급</b></td>
                        <td><b>닉네임</b></td>
                        <td><b>이메일</b></td>
                        <td><b>가입일</b></td>
                        <td><b>정보수정일</b></td>
                        <td><b>소셜가입</b></td>
                        <td><b>관리</b></td>
                    </tr>
                    <c:forEach var="ul" items="${user_list}">
                        <tr>

                            <td>${ul.user_id}</td>
                            <td>${ul.authorization_id}</td>
                            <td>${ul.user_name}</td>
                            <td>${ul.user_email}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${ul.user_create_date}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${ul.user_modify_date}"/></td>
                            <td>${ul.sns_type}</td>
                            <td><a href="user_status?user_email=${ul.user_email}"
                                   onclick="window.open(this.href,'유저 관리','width=800, height=500'); return false;">클릭</a>
                            </td>
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

    <script>
        var actionForm = $("#actionForm");
        $(".page-item a").on("click", function (e) {
            e.preventDefault();

            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        $(".move").on("click", function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='user_id' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "get");
            actionForm.submit()

        });

    </script>
</section>


