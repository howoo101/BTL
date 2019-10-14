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
    <div class="col-lg-12 mt-4">
        <div class="row col-lg-12 mt-3 text-center" id="menu_nav">
            <div class="col-lg-6" id="admin_page">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>유저 관리</h4></button>
            </div>
            <div class="col-lg-6" id="admin_answer">
                <button class="btn btn-light text-primary mt-2" style="width:100%"><h4>문의 답변</h4></button>
            </div>
        </div>

        <div id="ap_body">

        </div>

    </div>
</div>
<!-- mypage js들 -->
<script>
    $('#admin_page').click(function () {
        $("#ap_body").load("${path}/admin_page");
    });
    $('#admin_answer').click(function () {
        $("#ap_body").load("${path}/admin_answer");
    });
</script>

<%@ include file="../includes/footer.jsp" %>
  
