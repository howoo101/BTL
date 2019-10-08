<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp" %>


<c:forEach var="ul" items="${Uinfo_list}">
    <div class="col-lg-12 mt-4" id="user_status">
        <div class="col-lg-12 mt-4" id="user_status_header">
            <h4 style="color:royalblue">${ul.user_name}님의 페이지</h4>
        </div>
        <div class="col-ls-12 mt-2 md-3" id="user_status_body">
               <p>  3 = 정회원   4 = 일반회원  5 = 회원기능제한</p>
               <b>${ul.user_name}</b>님의 회원등급
            <input type="number" min="3" max="5" id="authorization_id" value="${ul.authorization_id}">
            <button class="btn btn-primary" id="modify">등급수정</button>
            <br>
            <br>
        </div>
    </div>
    <div class="row col-lg-12 mt-3 text-center" id="menu_nav">
        <div class="col-lg-6 text-primary mt-2" id="mprc">
           <button class="btn btn-light text-primary" style="width:100%"><h5>${ul.user_name}님의 리뷰 코멘트</h5></button> 
        </div>
        <div class="col-lg-6 text-primary mt-2" id="mpir">
            <button class="btn btn-light text-primary" style="width:100%"><h5>${ul.user_name}님의 면접후기</h5></button> 
        </div>
    </div>

    <div id="mp_body">

    </div>

    <!-- mypage js들 -->
    <script>

        var user_id = ${ul.user_id}
            $('#modify').click(function () {
                var result = confirm('회원님의 등급을 변경하시겠습니까?');
                if (result) {
                    {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/grade_modify.do",
                            type: "post",
                            data: {
                                "authorization_id": $('#authorization_id').val(),
                                "user_id": user_id
                            },
                            success: function (data) {
                                if (data == '1') {
                                    alert("수정이 완료되었습니다.");
                                }
                            },
                            error: function () {
                                alert("서버에러");
                            }
                        });
                    }
                } else {
                }
            });


        $('#mprc').click(function () {
            $("#mp_body").load("${pageContext.request.contextPath}/user_ReviewComment", {"user_id":${ul.user_id}});
        });
        $('#mpir').click(function () {
            $("#mp_body").load("${pageContext.request.contextPath}/user_InterviewReview", {"user_id":${ul.user_id}});
        });
    

    </script>
</c:forEach>
<%@ include file="../includes/footer.jsp" %>
  
