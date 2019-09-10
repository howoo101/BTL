<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </div>
                            </div>
                            <h5 class="card-title">2.9</h5>
                        </div>
                        <div class="card-body col-md-6" style="position: relative; height:30vh; width:80vw">
                            <canvas id="companyChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion" id="accordionExample">
                <div class="card-body">
                    <div class="card-header" id="headingOne">
                        <div class="border-info mb-0">
                            <div class="row">
                                <div class="col-lg-10">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="false" aria-controls="collapseOne">
                                        승진 기회 및 가능성 <span class="text-primary">(5)</span>
                                    </button>
                                </div>
                                <div class="col-lg-2">
                                    <div class="row">
                                        <div class="text-warning small">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        4.0
                                    </div>
                                </div>
                            </div>
                            <%-- end border-ingo--%>
                        </div>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>총 5개의 기업리뷰 코멘트</th>
                                </tr>
                                </thead>
                                <tbody class="chat">
                                <tr>
                                    <td>
                                        <div class="container">
                                            <div class="row">
                                                <div class="row col-lg-11 text-warning">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="col-lg-auto">
                                                    <p>
                                                        <small class="text-right">2018-01-01</small>
                                                    </p>
                                                </div>
                                            </div>

                                            내용~~~~~~~~~~~
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>

                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&lt;</span>
                                        </a>

                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&gt;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>

                            <div class="input-group">
                                <div class="container">
                                    <div class="row">
                                        <div class="starrr stars text-warning"></div>
                                        <span class="count">0</span>점
                                    </div>
                                </div>
                                <input type="text" class="form-control cr_comment" placeholder="입력해주세요"
                                       aria-label="Recipient's username with two button addons"
                                       aria-describedby="button-addon4">
                                <input class="cr_category" type="hidden" value="1">
                                <div class="input-group-append" id="button-addon4">
                                    <button class="btn btn-outline-secondary registerBtn" type="button">제출</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--별점과 리뷰 db에 등록--%>
<script>
<%--    //v파라미터로 callback과 error를 함수로 받는다.--%>
<%--    //Ajax호출이 성공하고 callback값으로 적절한 함수가 존재한다면 해당 함수를 호출하여 결과 반영--%>
<%--    //자바스크립트는 함수의 개수를 일치 시킬 필요가 없음--%>
<%--    $(document).ready(function () {--%>

<%--        var ci_idValue = '<c:out value="${companyReview.ci_id}" />';--%>
<%--        var companyReviewUL = $(".chat");--%>

<%--        showList(1);--%>

<%--        //showList()는 페이지 번호를 파라미터로 받게 설계 파라미터가 없는경우 자동으로 페이지 1이 되도록--%>
<%--        //DOM처리 이후 자동적으로 showList()가 호추되며 <ul>태그 내에 내용으로 처리--%>
<%--        //만약 1페이지가아니라면 <tbody>에 <tr>들이 추가되는 형태--%>

<%--        function showList(page) {--%>

<%--            console.log("show list"+page);--%>

<%--            companyReviewService.getList({ci_id: ci_idValue, page: page || 1}, function (companyReviewCtn,list) {--%>

<%--                console.log("companyReviewCtn : "+companyReviewCtn);--%>
<%--                console.log("list: "+list);--%>
<%--                console.log(list);--%>

<%--                if(page === -1){--%>
<%--                    pageNum = Math.ceil(companyReviewCtn/10.0);--%>
<%--                    showList(pageNum);--%>
<%--                    return;--%>
<%--                }--%>

<%--                var str = "";--%>
<%--                if (list === null || list.length === 0) {--%>

<%--                    companyReviewUL.html("");--%>

<%--                    return;--%>
<%--                }--%>
<%--                for (var i = 0, len = list.length || 0; i < len; i++) {--%>
<%--                    str+="<tr class='clearfix' data-cr_id='"+list[i].cr_id+"'><td>";--%>
<%--                    str+="<div class='container'><div class='row'><div class='row col-lg-11 text-warning'>";--%>
<%--                    str+=""--%>
<%--                    if(companyReview.cr_starRt){}--%>

<%--                }--%>
<%--            // <tr>--%>
<%--            //     <td>--%>
<%--            //     <div class="container">--%>
<%--            //         <div class="row">--%>
<%--            //         <div class="row col-lg-11 text-warning">--%>
<%--            //         <i class="fa fa-star"></i>--%>
<%--            //         <i class="fa fa-star"></i>--%>
<%--            //         <i class="fa fa-star"></i>--%>
<%--            //         <i class="fa fa-star"></i>--%>
<%--            //         <i class="fa fa-star-o"></i>--%>
<%--            //         </div>--%>
<%--            //         <div class="col-lg-auto">--%>
<%--            //         <p>--%>
<%--            //         <small class="text-right">2018-01-01</small>--%>
<%--            //         </p>--%>
<%--            //         </div>--%>
<%--            //         </div>--%>
<%--            //--%>
<%--            //     내용~~~~~~~~~~~--%>
<%--            //     </div>--%>
<%--            //     </td>--%>
<%--            //     </tr>--%>

<%--                companyReviewUL.html(str);--%>

<%--                showReplyPage(companyReviewCtn);--%>
<%--            });//end function--%>

<%--        }//end showList--%>

        //별점 등록
        $(".registerBtn").on("click", function (e) {

            var cr_comment = $(".cr_comment").val();
            var starRating = $(".count").text();
            var cr_category = $(".cr_category").val();

            $.ajax({
                type: "post",
                url: "/btl/companyReview/new",
                data: JSON.stringify({
                    cr_comment: cr_comment,
                    cr_starRt: starRating,
                    cr_category: cr_category
                }),
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    alert("리뷰가 등록되었습니다.");
                    // showList(-1);
                }

            });
        });
        // $(".registerBtn").on("click", function (e) {
        //
        //     var cr_comment = $(".cr_comment").val();
        //     var starRating = $(".count").text();
        //     var cr_category = $(".cr_category").val();
        //
        //     var companyReview = {
        //         cr_comment: cr_comment,
        //         cr_starRt: starRating,
        //         cr_category: cr_category
        //     };
        //     companyReviewService.add(companyReview, function (result) {
        //
        //         alert(result);
        //
        //         // showList(-1);
        //     })
        //
        // })
        // $(".chat").on("click", "li", function (e) {
        //
        //     var rno = $(this).data("rno");
        //
        //     replyService.get(rno, function (reply) {
        //
        //         modalInputReply.val(reply.reply);
        //         modalInputReplyer.val(reply.replyer);
        //         modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
        //             .attr("readonly", "readonly");
        //         modal.data("rno", reply.rno);
        //
        //         modal.find("button[id != 'modalCloseBtn']").hide();
        //         modalModBtn.show();
        //         modalRemoveBtn.show();
        //
        //         $(".modal").modal("show");
        //
        //     });
        // });
    //
    // });

</script>

<%-- 아이콘--%>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<%--star JS--%>
<script type="text/javascript" src="resources/js/star.js"></script>