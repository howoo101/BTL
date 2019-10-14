<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>
<br>
<div class="container center-block mt-4">
	<div class="card border-primary">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header text-primary font-weight-bold card-title mt-3 ml-4">
					<a href ="${path}/list" style='text-decoration: none'><i class="material-icons">group</i> 취뽀게시판</a>
				</h3>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="container">
							<table class="table table-bordered table-hover"  style="text-align: center;">
								<thead>
									<tr>
										<th style="width: 6%">번호</th>
										<th style="width: 45%">제목</th>
										<th style="width: 12%">작성자</th>
										<th style="width: 10%">작성일</th>
										<th style="width: 10%">수정일</th>
										<th style="width: 5%">조회</th>
									</tr>
								</thead>

								<!--  테이블-->
								<c:forEach items="${list }" var="board">
									<tr>
										<td><c:out value="${board.board_id }" /></td>
										<td style="text-align: left;"><a class='move'
											href='<c:out value="${board.board_id }"/>'>
												<c:out value="${board.board_title }" />
												<b>[<c:out value="${board.replyCnt}" />]</b></a></td>
										<td><c:out value="${board.board_writer }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_regdate }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_updateDate}" /></td>
										<td><c:out value="${board.board_hit }" /></td>
									</tr>
								</c:forEach>
							</table>
							
							<!--  검색 조건 처리기능-->
							<div class = 'row'>
								<div class="col-lg-8">
									<form id = 'searchForm' action="list" method='get'>
										<select name='type'>
											<option value="t"
											<c:out value="${pageMaker.cri.type eq 't'? 'selected' : ''}"/>>제목</option>
											<option value="c"
											<c:out value="${pageMaker.cri.type eq 'c'? 'selected' : ''}"/>>내용</option>
											<option value="w"
											<c:out value="${pageMaker.cri.type eq 'w'? 'selected' : ''}"/>>작성자</option>
											<option value="tc"
											<c:out value="${pageMaker.cri.type eq 'tc'? 'selected' : ''}"/>>제목 + 내용</option>
											<option value="tw"
											<c:out value="${pageMaker.cri.type eq 'tw'? 'selected' : ''}"/>>제목 + 작성자</option>
											<option value="twc"
											<c:out value="${pageMaker.cri.type eq 'twc'? 'selected' : ''}"/>>제목 + 작성자 + 내용</option>
										</select>
										
										<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
										<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
										<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
										<button class='btn btn-primary'>검색</button>
									</form>
								</div>
							<div class="panel-heading text-right col-lg-4">
							<button id='regBtn' type="button" class="btn btn-primary pull-right mr-3 mb-2">글작성</button>
						</div>
					</div>
								<!--  페이지번호 이벤트 처리-->
								<nav aria-label="Board Page navigation">
									<ul class="pagination justify-content-end">
										<c:if test="${pageMaker.prev}">
												<li class="page-item previous"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
											</c:if> <c:forEach var="num" begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }">
												<li class="page-item ${pageMaker.cri.pageNum == num? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
											</c:forEach> <c:if test="${pageMaker.next }">
												<li class="page-item next"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
											</c:if>
								
									</ul>
								</nav>
							</div>
				

						<!--작업 처리용 Modal-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="myModalLabel">알 림 창</h5>
										<button class="close" type="button" data-dismiss="modal"
											aria-label="true">&times;</button>
									</div>
									<div class="modal-body">완료되었습니다.</div>
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
<!--  페이징기능-->
<form id='actionForm' action="list" method='get'>
<input type = 'hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
<input type = 'hidden' name='amount' value='${pageMaker.cri.amount}'> 
<input type = 'hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'>
<input type = 'hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'>
</form>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글" + parseInt(result) + "번이 등록되었습니다."); /* 사용하려했으나  mysql ai 자동증가기능으로 사용안해도됨. */
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			self.location = "register";
		});
		
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e){
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='board_id' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","get");
			actionForm.submit()
			
		});

		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if(!searchForm.find("option:selected").val()) {
				Swal.fire({
					type:"warning",
					text : "검색종류를 선택하세요."});
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()) {
				Swal.fire({
					type:"warning",
					text : "키워드를 입력하세요."});
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		}); 
	});
</script>
<%@ include file="includes/footer.jsp"%>