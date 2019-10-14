<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../includes/header.jsp" %>

<div class="container mt-3">
<form action="${path}/answerUpdate" method="post">
        <div class="row">
            <div class="form-group col-lg-8">
                <label>제목</label> <input class="form-control" name='qnA_title' value="${qnAList.qnA_title}" readonly="readonly">
            </div>
            <div class="form-group col-lg-4">
                <input class="form-control" name="qnA_user_id" type="hidden" value="<%=user_id%>">
                <input type="hidden" name="qnA_id" value="${qnAList.qnA_id}">
            </div>
        </div>
        <div class="form-group">
            <label>내용</label>
                <textarea class="form-control" rows="5" name='qnA_content' readonly="readonly">${qnAList.qnA_content}</textarea>
        </div>
    <div class="form-group">
        <label>답변</label>
            <textarea class="form-control" rows="5" name='qnA_answer'>${qnAList.qnA_answer}</textarea>
    </div>
        <button class="btn btn-info mb-3" type="submit" onclick="opener.parent.location.reload(); self.close()">답변</button>
    <br>
</form>
</div>