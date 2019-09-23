<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mt-3" id="section4">
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
                <div class="text-primary font-weight-bold card-title"><h5>리뷰 코멘트</h5></div>
                <div class="card border-info">
                    <div class="row">
                        <div class="card-body col-md-6 text-center">
                            <p>총 만족도</p>
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="text-warning">
                                        <c:forEach begin="1" end="${totalStarRt}" step="1">
                                            <i class="fa fa-star"></i>
                                        </c:forEach>
                                        <c:forEach begin="${totalStarRt}" end="4" step="1">
                                            <i class="fa fa-star-o"></i>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <h5 class="card-title">${totalStarRt}</h5>
                        </div>
                        <div class="card-body col-md-6" style="position: relative; height:30vh; width:80vw">
                            <%--차트 출력--%>
                            <canvas id="companyChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion" id="test">
                <c:forEach items="${map}" var="list" begin="0" end="4" varStatus="status">
                    <div id="reviewAccordion${status.index}">
                        <div class="accordion" id="accordion">
                            <div class="card-body">
                                <div class="card-header" id="heading${status.index}">
                                    <div class="border-info mb-0">
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <button class="btn" type="button" data-toggle="collapse"
                                                        data-target="#collapse${status.index}"
                                                        aria-expanded="false" aria-controls="collapse${status.index}">
                                                        ${list.categoryName[status.index]} <span
                                                        class="text-primary">(<span
                                                >${list.categoryCtn[status.index]}</span>)</span>
                                                </button>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="row">
                                                    <div class="text-warning small starRatingAveStar${status.index}">
                                                        <c:forEach begin="1" end="5" step="1">
                                                            <i class="fa fa-star-o"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="categoryAve">${list.categoryAve[status.index]}</div>
                                                </div>
                                            </div>
                                        </div>
                                            <%-- end border-ingo--%>
                                    </div>
                                </div>
                                <div id="collapse${status.index}" class="collapse" aria-expanded="false"
                                     data-parent="#test">
                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>총 <span>${list.categoryCtn[status.index]}</span>개의 기업리뷰 코멘트
                                                </th>
                                                    <%--기업 총 코메트--%>
                                            </tr>
                                            </thead>
                                            <tbody class="reviews">
                                                <%--리뷰들 들어가는 부분--%>
                                            </tbody>
                                        </table>
                                        <div class="companyReview_pagination"></div>
                                            <%--페이징 처리가 들어가는 부분--%>
                                        <div class="input-group">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="starrr stars text-warning"></div>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" name="cr_comment"
                                                       class="form-control cr_comment${status.index}"
                                                       placeholder="입력해주세요.">
                                                <input type="hidden" class="cr_index" value="${status.index}">
                                                <input class="count" type="hidden">
                                                <input class="cr_category" type="hidden"
                                                       value="${status.index}">
                                                    <%--회사정보 집어넣기 위해서 id--%>
                                                <input class="forInsert" type="hidden"
                                                       value="${companyList[0].ci_id}">
                                                    <%--<input class="user_id" type="hidden">--%>
                                                <button class="btn btn-outline-secondary registerBtn${status.index}"
                                                        type="button">제출
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <input type="hidden" value="${starCtn}">
            </div>
        </div>
    </div>
</div>
<script>
    const ctx = document.getElementById('companyChart').getContext('2d');
    const chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: ['1점', '2점', '3점', '4점', '5점'],
            datasets: [{
                label: '평가 인원',
                backgroundColor: 'rgb(255,235,142)',
                borderColor: 'rgb(255,235,142)',
                data: [...${starCtn}]
            }]
        },

        // Configuration options go here
        options: {
            scales: {
                xAxes: [{
                    display: true,
                    ticks: {
                        autoSkip: false
                    }
                }],
                yAxes: [{
                    display: false,
                    ticks: {
                        suggestedMin: 0,
                    }
                }]
            },
            legend: {
                display: false
            }

        }
    });

</script>

<%--별점과 리뷰 db에 등록--%>
<script>
    $(document).ready(function () {
        const ci_idValue = '<c:out value="${companyList[0].ci_id}"/>';//homeController에 있는 모델 받아서 사용 0 넣지 안으면 에러

        //별점 등록
        $(".registerBtn0,.registerBtn1,.registerBtn2,.registerBtn3").on("click", function (e) {
            var cr_index = $(".cr_index");

            var $div = $(this).closest('div');

            // var fudate = $tr.find('input[name="fdate"]').val();
            var cr_comment = $div.find('input[name="cr_comment"]').val();
            var starRating = $div.find('input[class="count"]').text();
            var forInsert = $div.find('input[class="forInsert"]').val();
            var cr_category = $div.find('input[class="cr_category"]').val();
            $.ajax({
                    type: "post",
                    url: "${path}/companyReview/new",
                    data: JSON.stringify({
                        cr_comment: cr_comment,
                        cr_starRt: starRating,
                        cr_category: cr_category,
                        ci_id: forInsert
                    }),
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        alert("리뷰가 등록되었습니다.");
                        // showList(1);
                        location.reload();
                    }

                }
            );

        });

        let starRating = "";//별 표현하기 위해
        let starRatingAveStar = {}; //string 담기 위

        let starRatingAveStarUL0 = $(".starRatingAveStar0");
        let starRatingAveStarUL1 = $(".starRatingAveStar1");
        let starRatingAveStarUL2 = $(".starRatingAveStar2");
        let starRatingAveStarUL3 = $(".starRatingAveStar3");

        for (let i = 0; i < 4; i++) {
            let categoryAve = Number($(".categoryAve")[i].innerHTML); //카테고리별 평균 평점

            if (0.0 <= categoryAve && categoryAve < 1.0) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>";
            } else if (1.0 <= categoryAve && categoryAve < 2.0) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>";
            } else if (2.0 <= categoryAve && categoryAve < 3.0) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>";
            } else if (3.0 <= categoryAve && categoryAve < 4.0) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star-o'></i>" +
                    "<i class='fa fa-star-o'></i>";
            } else if (4.0 <= categoryAve && categoryAve < 5.0) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star-o'></i>";
            } else if (categoryAve === 5) {
                starRatingAveStar[i] =
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>" +
                    "<i class='fa fa-star'></i>";
            }
        }
        starRatingAveStarUL0.html(starRatingAveStar[0]);
        starRatingAveStarUL1.html(starRatingAveStar[1]);
        starRatingAveStarUL2.html(starRatingAveStar[2]);
        starRatingAveStarUL3.html(starRatingAveStar[3]);


        $("#reviewAccordion0, #reviewAccordion1, #reviewAccordion2, #reviewAccordion3 ").on("click", function (e) {

            const $div = $(this).closest('div');
            const cr_category = $div.find('input[class="cr_category"]').val();
            const companyReviewUL = $(".reviews");

            showList(1);

            let pageNum = 1;
            const companyReviewFooter = $(".companyReview_pagination");

            //showList
            function showList(page) {

                companyReviewService.getCrWithPaging({
                    ci_id: ci_idValue,
                    cr_category: cr_category,
                    page: page || 1,
                }, function (companyReviewCtn, companyReviewList) {
                    if (page === -1) {
                        pageNum = Math.ceil(companyReviewCtn / 10.0);
                        showList(pageNum);
                        return;
                    }

                    let str = "";

                    //List가 비어있는 경우 "" 처리
                    if (companyReviewList.length === 0) {

                        companyReviewUL.html("");

                        return;
                    }

                    for (let i = 0, len = companyReviewList.length || 0; i < len; i++) {

                        // 별처리 위해
                        switch (companyReviewList[i].cr_starRt) {
                            case 1:
                                starRating +=
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>";
                                break;
                            case 2:
                                starRating +=
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>";
                                break;
                            case 3:
                                starRating +=
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>";
                                break;
                            case 4:
                                starRating +=
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star-o'></i>";
                                break;
                            case 5:
                                starRating += "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>" +
                                    "<i class='fa fa-star'></i>";
                                break;
                            default:
                                starRating += "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>" +
                                    "<i class='fa fa-star-o'></i>";
                                break;
                        }


                        // categoryAve += companyReviewList[i].cr_starRt;

                        str += "<tr>" +
                            "<td>" +
                            "<div class='container'>" +
                            "<div class='row'>" +
                            "<div class='row col-lg-11 text-warning'>"
                            +
                            starRating
                            + "</div>" +
                            "<div class='col-lg-auto'>" +
                            "<small class='text-right'>" + companyReviewService.displayTime(companyReviewList[i].cr_regDate) + "</small>" +
                            "</div>" +
                            "</div>" + companyReviewList[i].cr_comment +
                            "</div>" +
                            "</td>" +
                            "</tr>";

                        //별초기
                        starRating = "";

                    }

                    companyReviewUL.html(str);

                    showCompanyReviewPage(companyReviewCtn);
                })
            }//end page


            //페이지처리
            function showCompanyReviewPage(companyReviewCtn) {

                let endNum = Math.ceil(pageNum / 10.0) * 10;
                const startNum = endNum - 9;

                const prev = startNum !== 1;
                let next = false;

                if (endNum * 10 >= companyReviewCtn) {
                    endNum = Math.ceil(companyReviewCtn / 10.0);
                }

                if (endNum * 10 < companyReviewCtn) {
                    next = true;
                }

                let str = "<ul class='pagination justify-content-center'>";

                if (prev) {
                    str += "<li class='page-item'><a class='page-link' href='" + "/" + (startNum - 1) + "'>Previous</a></li>";
                }

                for (var i = startNum; i <= endNum; i++) {

                    var active = pageNum === i ? "active" : "";

                    str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
                }

                if (next) {
                    str += "<li class ='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a><li>";
                }


                str += "</ul></div>";

                companyReviewFooter.html(str);

            }

            companyReviewFooter.on("click", "li a", function (e) {

                e.preventDefault();

                var targetPageNum = $(this).attr("href");

                pageNum = targetPageNum;

                showList(pageNum);

            });

        });

        var companyReviewService = (function () {
            //리뷰 출력 param이라는 개체를 통해 파라미터를 전달받어 JSON목록을 호출하며 JSON 형태가 필요하므로 URL 호출 확장자를 .json으로 처
            function getCrWithPaging(param, callback, error) {

                var ci_id = param.ci_id;
                var cr_category = param.cr_category;
                var page = param.page;

                $.getJSON("${path}/companyReview/pages/" + ci_id + "/" + cr_category + "/" + page + ".json", function (data) {
                    if (callback) {
                        // callback(data);
                        callback(data.companyReviewCtn, data.list);
                    }
                }).fail(function (xhr, status, err) {
                    if (error) {
                        error();
                    }
                });

            }

            //시간 표시 XMl이나 JSON의 형태로 데이터를 받을때는 순수하게 숫자로 표현되는 시간ㅇ값이 나오게 되어 벼환해서 사용
            function displayTime(timeValue) {
                var today = new Date();

                var gap = today.getTime() - timeValue;

                var dateObj = new Date(timeValue);
                var str = "";

                if (gap < (1000 * 60 * 60 * 24)) {

                    var hh = dateObj.getHours();
                    var mi = dateObj.getMinutes();
                    var ss = dateObj.getSeconds();

                    return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
                } else {
                    var yy = dateObj.getFullYear();
                    var mm = dateObj.getMonth() + 1;
                    var dd = dateObj.getDate();

                    return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
                }

            }

            return {getCrWithPaging: getCrWithPaging, displayTime: displayTime}

        })();
    });

</script>

<%--star JS--%>
<script type="text/javascript" src="resources/js/star.js"></script>