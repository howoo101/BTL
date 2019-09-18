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
				<h4
					class='page-header text-font-weight-bold card-title text-primary'>작성글</h4>
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
								<div class="form-group">
									<input class="form-control" type='hidden' name='board_id'
										value='<c:out value="${board.board_id}" />'
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										name='board_title'
										value='<c:out value="${board.board_title}" />'
										readonly="readonly">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" name='board_content'
										readonly="readonly"><c:out
											value="${board.board_content}" /></textarea>
								</div>
								<div class="form-group">
									<label>작성자</label> <input class="form-control" rows="3"
										name='board_writer'
										value='<c:out value="${board.board_writer}" />'
										readonly="readonly">
								</div>

								<button data-oper='modify' class="btn btn-warning"
									onclick="location.href='modify?board_id=<c:out value="${board.board_id }"/>'">수정</button>
								<!-- 				<button data-oper='list' class="btn btn-info" onclick="javascript:test();">List</button> -->

								<button data-oper='list' class="btn btn-info"
									onclick="location.href='list'">List</button>
							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id='operForm' action="modify" method="get">
	<input type='hidden' id='board_id' name='board_id'
		value='<c:out value="${board.board_id }"/>'> <input
		type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
	<input type='hidden' name='amount'
		value='<c:out value="${cri.amount }"/>'> <input type='hidden'
		name='type' value='<c:out value="${cri.type }"/>'> <input
		type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
</form>


<script type="text/javascript" src="resources/js/reply.js"></script>
 <script>
console.log("===========");
console.log("JS TEST");

var board_idValue = '<c:out value="${board.board_id}"/>';
replyService.getList({board_id : board_idValue, page:1}, function(list){
	
	for(var i=0, len=list.length || 0; i<len; i++) {
		console.log(list[i]);
	}
});

</script> 

<script>
	console.log("=================");
	console.log("JS TEST");
	var board_idValue = '<c:out value="${board.board_id}"/>';

	//for replyService add test
 	replyService.add({
		user_id : 1,
		reply_content : "JS Test",
		reply_writer : "tester",
		board_id : board_idValue
	}, function(result) {
		alert("RESULT:" + result);
	}

	);
	
	replyService.getList({board_id : board_idValue, page:1}, function(list){
		
		for(var i=0, len=list.length || 0; i<len; i++) {
			console.log(list[i]);
		}
	}); 
	
 	replyService.remove(55, function(count){
		console.log(count);
		if(count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert('ERROR...');
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#board_id").remove();
			operForm.attr("action", "list")
			operForm.submit();
		});
	});
</script>
<%@ include file="includes/footer.jsp"%>