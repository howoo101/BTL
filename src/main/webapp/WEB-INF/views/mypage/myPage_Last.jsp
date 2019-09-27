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

<div class="mySection">

    <%@ include file="includes/myPage_Menu.jsp" %>


    <div class="container mt-4">
        <div class="card border-primary">
            <div class="card-body">
                <h5 style="color:royalblue;">최근 본 기업</h5>
				<c:forEach items="${companyList }" var="item">
                <hr style="border:1px solid #c7d5f8; padding: 0px;">
				
                <div class="row">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 ml-5">
                                <div class="row">
                                    <h4>
                                        <a href="${path }/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}">${item.ci_companyName}</a>
										<c:if test="${item.followId eq 0}">
											<button id="unfollow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id }>♡</button>
										</c:if>
										<c:if test="${item.followId ne 0}">
											<button id="follow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id } data-followId=${item.followId }>♥</button>
										</c:if>
                                    </h4>
                                </div>
                                <div class="row">
                                    ${item.ci_industry } | ${item.ci_address }
                                </div>
                                <div class="row">
                                   	평균연봉 ${item.ci_avgsalary } 만원
                                </div>
                            </div>

                            <div class="col-lg-auto ">
                                <div class="row ">
                                   	<div class="text-warning">
                                       <c:forEach begin="1" end="${item.companyReviewAvg}" step="1">
                                           <i class="fa fa-star"></i>
                                       </c:forEach>
                                       <c:forEach begin="${item.companyReviewAvg}" end="4" step="1">
                                           <i class="fa fa-star-o"></i>
                                       </c:forEach>
                                   	</div>
                                </div>
                                <div class="row " style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">
                                    <div class="col-sm-12 text-center">23</div>
                                    <div class="col-sm-12 text-center"><a href="">리뷰 코멘트</a></div>
                                </div>
                            </div>
                            <div class="col-lg-auto">
                                <div class="row">
                                    <h5>${item.companyReviewAvg }</h5>
                                </div>
                                <div class="row " style="">
                                    <div class="col-sm-12 text-center">23</div>
                                    <div class="col-sm-12 text-center"><a href="">면접정보</a></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
    <%@ include file="includes/footer.jsp" %>
	<script src="resources/js/follow.js"></script>