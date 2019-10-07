<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="section6" class="mt-3">
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
                <%--뉴스 제목--%>
                <div class="text-primary font-weight-bold card-title"><h5>News</h5></div>
                <br>
                <%--뉴스 글 링크에 대해서 검은색처리 날짜는 회색 처리--%>
                <c:if test="${news.size() != 0 }">
                    <c:forEach items="${news}" var="item">
                        <div class="row">
                            <div class="col-lg-10">
                                <a class="text-left text-dark" href="${item[1]}" target="_blank">${item[0] }</a><br>
                            </div>
                            <span class="col-lg-2  text-black-50 text-right">${item[2] }</span>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${news.size() == 0 }">
                    <div class="alert alert-warning" role="alert">
						검색된 뉴스가 없습니다.
                    </div>
                </c:if>
                <%-- 1 개 뉴스 끝--%>
            </div>
        </div>
    </div>
</div>

