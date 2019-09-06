<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="myPage_Menu">
    <div class="text-center" style="height: 100px; background-color: #ccf8ff">
        <div class="card-group">
            <div class="card-body">
                <SPAN class="">
                    사용자 이메일
                </SPAN>
            </div>
        </div>
    </div>

    <div class="col-lg-12 mt-4">
        <div class="row text-primary text-center">

            <div class="col-lg-3">
                <h4><a href="${pageContext.request.contextPath}/myPage_ReviewComment">내 리뷰 코멘트</a></h4>
            </div>
            <div class="col-lg-3">
                <h4><a href="${pageContext.request.contextPath}/myPage_InterviewReview">내 면접후기</a></h4>
            </div>
            <div class="col-lg-3">
                <h4><a href="${pageContext.request.contextPath}/myPage_Following">팔로잉 기업</a></h4>
            </div>
            <div class="col-lg-3">
                <h4><a href="${pageContext.request.contextPath}/myPage_Last">최근 본 기업</a></h4>
            </div>
        </div>
    </div>
</div>