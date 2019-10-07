<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script src="resources/js/star.js"></script>

<div class="container mt-4">
    <div class="card border-primary">
        <div class="card-body">
            <h5 style="color:royalblue;">내 리뷰 코멘트</h5>
            <hr style="border:1px solid #c7d5f8; padding: 0px;">
            <!-- Bootstrap table class -->
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">기업명</th>
                    <th scope="col">평가 내용</th>
                    <th scope="col">작성일</th>
                    <th scope="col">수정</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${myReviewCommentList }" var="list">
                    <tr>
                        <th scope="row">
                            <a class='move'
                               href="${pageContext.request.contextPath}/info?ci_companyName=${list.ci_companyName}&ci_id=${list.ci_id}">${list.ci_companyName}</a>
                        </th>
                        <td><c:out value="${list.cr_comment }"/></td>
                        <td><c:out value="${list.cr_regDate }"/></td>
                        <td>
                            <input type="hidden" value="${list.ci_id}">
                            <button class="callmodify btn btn-light" value="<c:out value='${list.cr_id }'/>">수정</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div class="modal modifyComment fade" tabindex="-1" role="dialog"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body" name="need">
                <div class="form-group row">
                    <div class="col-sm-9">
                        <label>
                            <select class="form-control custom-select" name="cr_category">
                                <option value="0">승진 기회 및 가능</option>
                                <option value="1">복지 및 급여</option>
                                <option value="2">업무와 삶의 균형</option>
                                <option value="3">사내 문화</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>리뷰 코멘트</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <textarea class="form-control" name='cr_comment' rows="4"></textarea>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>평가 점수</label>
                    </div>
                    <div class="col-sm-9">
                        <div class="starrr stars text-warning"></div>
                        <span class="count" hidden="hidden"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id='reviewCommentModifyBtn' type="button" class="btn btn-outline-info">Modify</button>
                <button id='reviewCommentCloserBtn' type="button" class="btn btn-warning" data-dismiss="modal"
                        aria-hidden="true">Close
                </button>
            </div>
        </div>
    </div>
    <input name="cr_id" type="hidden">
</div>


<script>
    // 상수->변수
    var modifyService = (function () {
        function commentModify(reviewComment, callback, error) {
            $.ajax({
                type: 'put',
                url: '${pageContext.request.contextPath}/companyReview/' + reviewComment.cr_id,
                data: JSON.stringify(reviewComment),
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },

                error: function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function get(cr_id, callback, error) {

            $.get("${pageContext.request.contextPath}/companyReview/" + cr_id + ".json", function (result) {

                if (callback) {
                    callback(result);
                }

            }).fail(function (xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }
        return {
            commentModify: commentModify,
            get: get
        };
    })();


    $(document).ready(function () {

        $(".callmodify").on("click", function (e) {
            var cr_id = $(this).closest('button').val();

            /* 모달창*/
            var modal = $(".modifyComment");

            let cr_CommentModal = modal.find("textarea[name='cr_comment']");
            let cr_categoryModal = modal.find("select[name='cr_category']");
            let cr_starRtModal = modal.find("span[class='count']");
            const cr_idModal = modal.find("input[name='cr_id']");
            const user_id = modal.find('input[class="user_id"]');

            modifyService.get(cr_id, function (reviewComment) {
                cr_CommentModal.val(reviewComment.cr_comment);
                cr_categoryModal.val(reviewComment.cr_category);
                cr_idModal.val(reviewComment.cr_id);
                cr_starRtModal.text(reviewComment.cr_starRt);
                user_id.val(reviewComment.user_id);

                $(".modifyComment").modal("show");
            });


            $("#reviewCommentModifyBtn").on("click", function (e) {
                const reviewComment = {
                    cr_id: cr_idModal.val(),
                    cr_comment: cr_CommentModal.val(),
                    cr_category: cr_categoryModal.val(),
                    cr_starRt: cr_starRtModal.text(),
                    user_id: user_id.val()
                };
                if (!reviewComment.cr_starRt || !reviewComment.cr_category || !reviewComment.cr_comment) {
                    alert("필수값이 입력되지 않았습니다.");
                } else {
                    modifyService.commentModify(reviewComment, function (result) {
                        alert("성공적으로 변경되었습니다.");
                        modal.modal("hide");
                        /*   location.reload() */
                    });
                }
            });


        });

    });
</script>


