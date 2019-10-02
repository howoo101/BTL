<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>
<div class="container">
    <div class="card-body text-center mt-5">
<h1> 멤버쉽 결제 </h1>


<form method="post" action="kakaoPay" target="popup_window">
    <button class="btn btn-light " id="kakaoBtnSubmit"><img src="${path}/resources/img/kakopay_small.png" alt=""></button>

</form>
    </div>
</div>

<%@ include file="includes/footer.jsp"%>

<script>
    $("#kakaoBtnSubmit").on("click", function(){
        window.open("", "popup_window", "width=500, height=700, scrollbars=no");
        // $("#myform").submit();
    });
</script>