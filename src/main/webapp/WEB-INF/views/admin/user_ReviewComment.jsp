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





