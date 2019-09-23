<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>

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
									<label>글 번호 baord_id</label> <input class="form-control"
										name='board_id' value='<c:out value="${board.board_id}" />'
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

							<div class="container">
								<%--댓글 목록처리 위한 div--%>
								<%--각 li태그는 하나의 댓글을 의미한다. 수정이나 삭제시 이를 클릭하며 댓글번호가 필요하기에 data-rno속성을 이용한다.--%>
								<div class="row">
									<div class="col-lg-12">

										<%--/.panel--%>
										<div class="penel penel-default">
											<!-- <div class="panel-heading">
										<i class="fa fa-comments fa-fw"></i> 댓글
									</div> -->
											<div class="panel-heading">
												<i class="fa fa-comments fa-fw"></i>댓글
												<button id='addReplyBtn'
													class='btn btn-primary btn-xs pull-end'>New Reply</button>

												<div class="container">
													<%--/.pnel-heading--%>
													<div class="panel-body">

														<ul class="chat">

														</ul>
														<%--end ul--%>
													</div>
													<%--panel .chat-panel--%>
													<div class="panel-footer"></div>
												</div>
												<%--end row--%>
											</div>
										</div>
									</div>
									<!-- End of Main Content -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 페이징 -->
<form id='operForm' action="modify" method="get">
	<input type='hidden' id='board_id' name='board_id'
		value='<c:out value="${board.board_id }"/>'> <input
		type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
	<input type='hidden' name='amount'
		value='<c:out value="${cri.amount }"/>'> <input type='hidden'
		name='type' value='<c:out value="${cri.type }"/>'> <input
		type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
</form>

<!-- 댓글 모달창 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
	aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button> -->
				<h4 class="modal-title" id="myModalLabel">댓글</h4>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label>내용</label> <input class="form-control" name='reply_content'
						value='New Reply!!'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name=reply_writer
						value=''>
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control"
						name=reply_date value=''>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<!-- <button id='modalCloseBtn' type="button"
												class="btn btn-default">Close</button> -->
			</div>
		</div>
	</div>
</div>


<!-- get 동작설정 -->
<script type="text/javascript">
$(document).ready(function() {

	var operForm = $("#operForm");

	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "modify").submit();
	});

	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#board_id").remove();
		operForm.attr("action", "list");
		operForm.submit();
	});
});
</script>

<!-- js같이 코드돌아감 -->
<script type="text/javascript" src="resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		var board_idValue = '<c:out value="${board.board_id}"/> ';
		var replyUL = $(".chat");

		showList(1);

		//showList()는 페이지 번호를 파라미터로 받게 설계하며 파라미터가 없는경우 자동르로 1페이지가 되도록 설정
		//브라우저에서 DOM 처리가 끝나면 자동적으로 showList()가 호출되며 <ul> 태그 내에 내용으로 처리
		//만약 1페이지가 아니라면 <ul>에 <li>들이 추가되는 형태
		function showList(page) {
			console.log("show list" + page);

			replyService.getList(
				{
					board_id : board_idValue,
					page : page || 1
				},
				function(replyCnt, list) {

					console.log("replyCnt : "
							+ replyCnt);
					console.log("list: " + list);
					console.log(list);

					if (page === -1) {
						pageNum = Math
								.ceil(replyCnt / 10.0);
						showList(pageNum);
						return;
					}

					var str = "";
					if (list === null
							|| list.length === 0) {

						replyUL.html("");

						return;
					}
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str += "<li class= 'clearfix' data-reply_id='" + list[i].reply_id + "'>";
						str += "<div><div class='header'><strong class='primary-font'>"
								+ list[i].reply_writer
								+ "</strong>";
						str += "<small class='text-muted'>"
								+ replyService
										.displayTime(list[i].reply_date)
								+ "</small></div>";
						str += "<p>"
								+ list[i].reply_content
								+ "</p></div></li>";
					}

					replyUL.html(str);

					showReplyPage(replyCnt);
				});//end function
		}//end showList

		/* 페이지 번호를 출력하는 로직*/
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");

		function showReplyPage(replyCnt) {

			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum !== 1;
			var next = false;

			if (endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt / 10.0);
			}
			if (endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			if (prev) {
				str += "<li class='page-item'><a class='page-link' href='"
						+ (startNum - 1)
						+ "'>Previous</a></li>";
			}
			
			for (var i = startNum; i <= endNum; i++) {
				var active = pageNum === i ? "active" : "";
				str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"
						+ i + "</a></li>";
			}

			if (next) {
				str += "<li class ='page-item'><a class='page-link' href='"
						+ (endNum + 1) + "'>Next</a><li>";
			}

			str += "</ul></div>";
			console.log(str);
			replyPageFooter.html(str);
		}

		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			console.log("page click");

			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum: " + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});

		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply_content']");
		var modalInputReplyer = modal.find("input[name='reply_writer']");
		var modalInputReplyDate = modal.find("input[name='reply_date']");

		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		//추가 버튼 누를시 close빼고 hide이후 등록 버튼만 보이도록 수정
		$("#addReplyBtn").on("click", function(e) {

			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();

			modalRegisterBtn.show();

			$(".modal").modal("show");
		});

		//댓글이 정상적으로 추가되면 경고창을 이용해 성공
		modalRegisterBtn.on("click", function(e) {

			var reply_content = {
				reply_content : modalInputReply.val(),
				reply_writer : modalInputReplyer.val(),
				board_id : board_idValue
			};
			
			replyService.add(reply_content, function(result) {

				alert(result);

				modal.find("input").val("");
				modal.modal("hide");

				//작성후 새로고침을 통해 불러오기 위해서
				// showList(1);
				//page변수를 이용해서 원하는 댓글 페이지를 가져오게하며 page번호가 -1로 전달되면
				//마지막 페이지를 찾아서 다시 호출하게 하게 한다.
				showList(1);

			});
		});

		//DOM에서 이벤트 리스너를 등록하는 것은 반드시 해당 DOM 요소가 존재해야만 가능.
		//동적으로 Ajax를 통해 li태그들이 만들어지면 이후 이벤트를 등록해야 하기에 일방적인 방식이 아니라 이벤트 위임의 형태로 작성
		//이벤트 위임은 이벤트를 동적으로 생성되는 요소가 아닌 이미 존재하는 요소에 이벤트를 걸어준후 나중에 이벤트의 대상을 변경 on()을 통해 처리한다.
		//댓글조회는 별도조회 필요가 없지만 Ajax로 댓글을 조회한 후 수정/삭제 하는 것이 정상
		//댓글을 가져온후 필요한 항목들을 채우고 수정과 삭제에 필요한 댓글 번호는 data-reply_id 속성을 만들어서 추가해둔다.
		$(".chat").on("click", "li", function(e) {

			var reply_id = $(this).data("reply_id");

			replyService.get(reply_id,function(reply_content) {

				modalInputReply.val(reply_content.reply_content);
				modalInputReplyer.val(reply_content.reply_writer);
				modalInputReplyDate
					.val(replyService.displayTime(reply_content.reply_date))
					.attr("readonly", "readonly");
				modal.data("reply_id",reply_content.reply_id);

				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();

				$(".modal").modal("show");

			});
		});

		modalModBtn.on("click", function(e) {
			var reply_content = {
				reply_id : modal.data("reply_id"),
				reply_content : modalInputReply.val()
			};

			replyService.update(reply_content, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);

			});

		});

		modalRemoveBtn.on("click", function(e) {
			var reply_id = modal.data("reply_id");

			replyService.remove(reply_id, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
	});
</script>

<%@ include file="includes/footer.jsp"%>