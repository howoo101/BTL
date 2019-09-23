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
                    <h5 style="color:royalblue;">팔로잉 기업</h5>
                    <c:forEach items="${companyList }" var="item">
                    <hr style="border:1px solid #c7d5f8; padding: 0px;">


                    <div class="row">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-6 ml-5">
                                    <div class="row">
                                        <h4>
                                            <a href="${path }/info?ci_companyName=${item.ci_companyName}">${item.ci_companyName}</a>
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

                                <div class="col-lg-auto">
                                    <div class="row ">
                                        <h5 class="" >*****</h5>
                                    </div>
                                    <div class="row " style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">
                                        <div class="col-sm-12 text-center">${item.companyReviewCnt }</div>
                                        <div class="col-sm-12 text-center"><a href="">리뷰 코멘트</a></div>
                                    </div>
                                </div>
                                <div class="col-lg-auto text-center">
                                    <div class="row">
                                        <h5>2.9</h5>
                                    </div>
                                    <div class="row " style="">
                                        <div class="col-sm-12 text-center">${item.interviewReviewCnt }</div>
                                        <div class="col-sm-12 text-center"><a href="">면접정보</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </c:forEach>
                    
                </div>
                <!--페이징 버튼-->
				<div class="row justify-content-center">
				<nav aria-label="Board Page navigation">
						<ul class="pagination justify-content-start">
							<c:if test="${pageMaker.prev}">
									<li class="page-item previous">
									<a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
							</c:if> 
							<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
								<li class="page-item ${pageMaker.cri.pageNum == num? 'active' : ''}">
								<a class="page-link" href="${num}">${num}</a></li>
							</c:forEach> 
							<c:if test="${pageMaker.next }">
								<li class="page-item next"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
            </div>
            
            <form id="actionForm" action="myPage_Following" method="get">
            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            </form>
        </div>
</div>
        
<%@ include file="includes/footer.jsp" %>
<script src="resources/js/follow.js"></script>
<script>
var path = "${path}";
window.onpageshow = function(event) {

    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	 location.reload(true); 
    }
}

$(document).ready(function() {
	//follow
	$(document).on("click",".follow", function() {
		var btn = $(this)
		follow(path,btn)
	});//onclick
	//follow end
	
	//page
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));	
		actionForm.submit();
	})
});
</script>
