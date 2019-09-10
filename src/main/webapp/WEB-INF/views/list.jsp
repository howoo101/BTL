<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>
<!--공간띄우는것 필요함. 임시로 br태그사용-->
<div class="container center-block mt-4">
	<div class="card border-primary">
		<div class="row">
			<div class="col-lg-12">
				<h3
					class="page-header text-primary font-weight-bold card-title mt-2 ml-2">취뽀게시판</h3>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading text-right">
						<button id='regBtn' type="button"
							class="btn btn-primary pull-right mr-3">글작성</button>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="container">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>수정일</th>
									</tr>
								</thead>

								<c:forEach items="${list }" var="board">
									<tr>
										<td><c:out value="${board.board_id }" /></td>
										<td><a
											href='get?board_id=<c:out value="${board.board_id }"/>'>
												<c:out value="${board.board_title }" />
										</a></td>
										<td><c:out value="${board.board_writer }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_regdate }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_updateDate}" /></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- Modal-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="myModalLabel">확 인 창</h5>
										<button class="close" type="button" data-dismiss="modal"
											aria-label="true">&times;</button>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">확 인</button>
									</div>
								</div>
								<%--/.modal-content--%>
							</div>
							<%--./modal-dialog--%>
						</div>
						<%--modal--%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				$("#regBtn").on("click", function() {
					self.location = "register";
				});
			});
</script>


<%@ include file="includes/footer.jsp"%>