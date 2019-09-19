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
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </div>
                            </div>
                            <h5 class="card-title">${totalStarRt}</h5>
                        </div>
                        <div class="card-body col-md-6" style="position: relative; height:30vh; width:80vw">
                            <%--차트 출--%>
                            <canvas id="companyChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>


            <c:forEach items="${map}" var="list" begin="1" end="5" varStatus="status">
                <div class="accordion" id="accordion${status.count}">
                    <div class="card-body">
                        <div class="card-header" id="heading${status.count}">
                            <div class="border-info mb-0">
                                <div class="row">
                                    <div class="col-lg-10">
                                        <button class="btn" type="button" data-toggle="collapse" data-target="#collapse${status.count}"
                                                aria-expanded="false" aria-controls="collapse${status.count}">
                                            ${list.categoryName[status.count]} <span class="text-primary">(<span
                                                class="totalCompanyReviewCtn${status.count}">0</span>)</span>
                                        </button>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="row">
                                            <div class="text-warning small starRatingAveStar">
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div>${list.categoryAve[status.count]}</div>
                                        </div>
                                    </div>
                                </div>
                                    <%-- end border-ingo--%>
                            </div>
                        </div>

                        <div id="collapse${status.count}" class="collapse" aria-labelledby="heading${status.count}" data-parent="#accordion${status.count}">
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>총 <span class="totalCompanyReviewCtn${status.count}">0</span>개의 기업리뷰 코멘트</th>
                                            <%--기업 총 코메트--%>
                                    </tr>
                                    </thead>
                                    <tbody class="chat">
                                        <%--리뷰들 들어가는 부분--%>
                                    </tbody>
                                </table>
                                <div class="companyComment"></div>
                                    <%--페이징 처리가 들어가는 부분--%>
                                <div class="input-group">
                                    <div class="container">
                                        <div class="row">
                                            <div class="starrr stars text-warning"></div>
                                            <span class="count">0</span>점
                                        </div>
                                    </div>
                                    <input type="text" class="form-control cr_comment" placeholder="입력해주세요"
                                           aria-describedby="button-addon${status.count}">
                                    <input class="cr_category" type="hidden" value="${status.count}">
                                        <%--회사정보 집어넣기 위해서 id--%>
                                    <input class="forInsert" type="hidden" value="${companyList[0].ci_id}">
                                    <div class="input-group-append" id="button-addon${status.count}">
                                        <button class="btn btn-outline-secondary registerBtn${status.count}" type="button">제출</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>



        </div>
    </div>
</div>
<%--별점과 리뷰 db에 등록--%>
<script>


</script>

<%-- 아이콘--%>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<%--star JS--%>
<script type="text/javascript" src="resources/js/star.js"></script>