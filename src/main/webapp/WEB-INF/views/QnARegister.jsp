<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<div class="container mt-3">
    <form role="form" action="QnARegister" method="post" name="need">
        <div class="row">
            <div class="form-group col-lg-8">
                <label>제목</label> <input class="form-control" name='qnA_title'>
            </div>
            <div class="form-group col-lg-4">
                <input class="form-control" name="qnA_user_id" type="hidden" value="<%=user_id%>">
            </div>
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='qnA_content'></textarea>
        </div>
        <button id="registerBtn" class="btn btn-primary" type="submit">등록</button>
    </form>
    <br>
</div>