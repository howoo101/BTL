<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 화면</title>

</head>
<body>
<%@ include file="includes/header.jsp" %>
<div class="container mt-4">
    <div class="card border-primary" id="go">
        <h5 class="ml-4 mt-4" style="color: royalblue;">기업 검색 결과</h5>

        <c:forEach items="${companyList }" var="item">
            <div class="card-body" data-startNo=${item.ci_id }>
                <hr style="border: 1px solid #c7d5f8; padding: 0px;">
                <div class="row">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 ml-5">
                                <div class="row justify-content-center">
                                    <h4>
                                        <a href="${path }/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}">${item.ci_companyName}</a>
                                        <c:if test="${item.followId eq 0}">
                                            <button id="unfollow" class="follow btn btn-outline-danger"
                                                    data-ciId=${item.ci_id }>♡
                                            </button>
                                        </c:if>
                                        <c:if test="${item.followId ne 0}">
                                            <button id="follow" class="follow btn btn-outline-danger"
                                                    data-ciId=${item.ci_id } data-followId=${item.followId }>♥
                                            </button>
                                        </c:if>
                                    </h4>
                                </div>
                                <div class="row justify-content-center">
                                        ${item.ci_industry } | ${item.ci_address }</div>
                                <div class="row justify-content-center">평균연봉 ${fn:substring(item.ci_avgsalary,0,4) } 만원</div>
                            </div>

                            <div class="col-lg-auto">
                                <div class="row justify-content-center">
                                    <div class="text-warning">
                                        <c:forEach begin="1" end="${item.companyReviewAvg}" step="1">
                                            <i class="fa fa-star"></i>
                                        </c:forEach>
                                        <c:forEach begin="${item.companyReviewAvg}" end="4" step="1">
                                            <i class="fa fa-star-o"></i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="row "
                                     style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">
                                    <div class="col-sm-12 text-center">${item.companyReviewCnt }</div>
                                    <div class="col-sm-12 text-center">
                                        <a href="${path}/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}#locCr">리뷰 코멘트</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-auto text-center">
                                <div class="row justify-content-center">
                                    <h5>${item.companyReviewAvg }</h5>
                                </div>
                                <div class="row " style="">
                                    <div class="col-sm-12 text-center">${item.interviewReviewCnt }</div>
                                    <div class="col-sm-12 text-center">
                                        <a href="${path}/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}#locIr">면접정보</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>

<script src="resources/js/scroll.js"></script>
<script src="resources/js/follow.js"></script>
<script>
    window.onpageshow = function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            location.reload(true);
        }
    }

    let isEnd = false;
    var path = "${path}";
    $(document).ready(function () {
        //follow
        $(document).on("click", ".follow", function () {
            var btn = $(this);
            follow(path, btn)
        });//onclick
        //follow end

        //scroll
        var keyword = '${keyword}';
        var timer;
        $(window).scroll(function () {

            let $window = $(this);
            let scrollTop = parseInt($window.scrollTop());
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            if (timer) {
                clearTimeout(timer);
            }
            timer = setTimeout(function () {
                if (scrollTop + windowHeight >= documentHeight - 1) {
                    fetchList(keyword, path);
                }
            }, 100)

        })//scroll
    });//ready
</script>
</body>
</html>