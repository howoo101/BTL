<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp"%>


<br>
<br>
<br>
<br>

카카오페이 결제가 정상적으로 완료되었습니다.

결제일시:   [${info.approved_at}]<br/>
주문번호:    [${info.partner_order_id}]<br/>
상품명:    [${info.item_name}]<br/>
상품수량:    [${info.quantity}]<br/>
결제금액:    [${info.total}]<br/>
결제방법:    [${info.payment_method_type}]<br/>

<button class="btn btn-outline-info" onclick="opener.parent.location.reload(); self.close() ">확인</button>

<%@ include file="includes/footer.jsp"%>