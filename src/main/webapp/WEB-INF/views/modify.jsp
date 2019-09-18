<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>
<!--공간띄우는것 필요함. 임시로 br태그사용-->
<div class="container center-block mt-4">
	<div class="card border-primary">
		<div class="row">
			<div class="col-lg-12 mt-2 ml-2">
				<h4 class='page-header text-primary font-weight-bold card-title'>작성글
					수정</h4>
				<hr>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="container center-block mt-4">

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="container">
								<form role="form" action="modify" method="post">
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
								<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
								<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>


									<div class="form-group">
										 <input class="form-control" type='hidden'
											name='board_id' value='<c:out value="${board.board_id}" />'
											readonly="readonly">
									</div> 

									<div class="form-group">
										<label>제목</label> <input class="form-control"
											name='board_title'
											value='<c:out value="${board.board_title}" />'>
									</div>

									<div class="form-group">
										<label>내용</label>
										<textarea class="form-control" rows="3" name='board_content'><c:out
												value="${board.board_content}" /></textarea>
									</div>

									<div class="form-group">
										<label>작성자</label> <input class="form-control"
											name='board_writer'
											value='<c:out value="${board.board_writer }"/>'
											readonly="readonly">
									</div>

									<div class="form-group">
										<label>등록일</label> <input class="form-control"
											name='board_regdate'
											value='<fmt:formatDate pattern="yyyy/MM/dd" value = "${board.board_regdate}" />'
											readonly="readonly">
									</div>

									<div class="form-group">
										<label>수정일</label> <input class="form-control"
											name='board_updateDate'
											value='<fmt:formatDate pattern="yyyy/MM/dd" value = "${board.board_updateDate}" />'
											readonly="readonly">
									</div>

									<button type="submit" data-oper='modify'
										class="btn btn-warning">수정</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
									<button type="submit" data-oper='list' class="btn btn-info">List</button>
								</form>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "remove");
			} else if (operation === 'list') {
				formObj.attr("action", "list").attr("method", "get");
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}
			formObj.submit();
		});

	});
</script>
<%@ include file="includes/footer.jsp"%>