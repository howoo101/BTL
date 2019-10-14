<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<style>
    #user_status {
        position: relative;
        bottom: -3px;
        border: 3px solid #F2F2F2;
        padding: 8px;
        text-align: center;
    }

    #mprc:hover {
        cursor: pointer;
    }

    #mpir:hover {
        cursor: pointer;
    }

    #mpf:hover {
        cursor: pointer;
    }

    #mpl:hover {
        cursor: pointer;
    }

</style>

<div class="container">
    <div class="col-lg-12 mt-4" id="user_status">
        <c:forEach var="ul" items="${Uinfo_list}">

            <script>
                var authorization = ${ul.authorization_id};
                if (authorization == 4) {
                    var grade = "<b>일반회원</b>";
                } else if (authorization == 3) {
                    var grade = "<b>정회원</b>";
                } else if (authorization == 1) {
                    var grade = "<b>관리자</b>";
                }
            </script>

            <%String str = "<script>document.writeln(grade)</script>";%>

            <div class="col-lg-12 mt-4" id="user_status_header">
                <h4 style="color:royalblue">${ul.user_name}</h4>

            </div>
            <div class="col-ls-12 mt-3" id="user_status_body">
                회원 등급  <%=str%> | 가입일자 <b>
                <fmt:formatDate pattern="yyyy-MM-dd"
                                value="${ul.user_create_date}" /></b>
            </div>

            <div class="col-lg-12 mt-4" id="user_status_footer">
                    <button type="button" class="btn btn-primary navbar-btn mt-2"
                            onclick="location.href='${path}/user_info'">
                        <b>회원정보 수정</b>
                    </button>
                    <button type="button" class="btn btn-primary navbar-btn mt-2"
                            onclick="location.href='${path}/calendar'">
                        <b>채용 달력</b>
                    </button>
                    <form method="get" action="QnA" target="popup_window" style="display: inline-block">
                        <button id="QnAbtn" type="submit" class="btn btn-primary navbar-btn mt-2">
                            <b>문의 하기</b>
                        </button>
                    </form>
                <hr>
            </div>
        </c:forEach>

        <div class="row col-lg-12 mt-3 text-center" id="menu_nav">
            <div class="col-lg-3" id="mprc">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>내 리뷰 코멘트</h4></button>
            </div>
            <div class="col-lg-3" id="mpir">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>내 면접 후기</h4></button>
            </div>
            <div class="col-lg-3" id="mpf">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>팔로잉 기업</h4></button>
            </div>
            <div class="col-lg-3" id="mpl">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>최근 본 기업</h4></button>
            </div>
        </div>

        <div id="mp_body">

        </div>

    </div>
</div>
<!-- mypage js들 -->
<script>
    $('#mprc').click(function () {
        $("#mp_body").load("${pageContext.request.contextPath}/myPage_ReviewComment");
    });
    $('#mpir').click(function () {
        $("#mp_body").load("${pageContext.request.contextPath}/myPage_InterviewReview");
    });
    $('#mpf').click(function () {
        $("#mp_body").load("${pageContext.request.contextPath}/myPage_Following");
    });
    $('#mpl').click(function () {
        $("#mp_body").load("${pageContext.request.contextPath}/myPage_Last");
    });
    $("#QnAbtn").on("click", function () {
        window.open("", "popup_window", "width=500, height=700, scrollbars=no");
    });
</script>

<%@ include file="../includes/footer.jsp" %>
  
