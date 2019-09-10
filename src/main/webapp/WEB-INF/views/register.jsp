<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>
<div class="container center-block mt-4">
	<div class="card border-primary">
		<div class="row">
			<div class="col-lg-12 mt-2 ml-2">
				<h4 class="page-header text-primary font-weight-bold card-title">글작성</h4>
				<hr>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<div class="container center-block mt-4">
						<div class="panel-heading"></div>
						<div class="panel-bady">

							<div class="container">
								<form role="form" action="register" method="post">
									<div class="form-group">
										<label>제목</label> <input class="form-control"
											name='board_title'>
									</div>


									<div class="form-group">
										<label>내용</label>
										<textarea class="form-control" rows="3" name='board_content'></textarea>
									</div>
									<div class="form-group">
										<label>작성자</label> <input class="form-control"
											name='board_writer'>
									</div>
									<button  type="submit" class="btn btn-warning">작성</button>
									<button  type="reset" class="btn btn-info">초기화</button>
								</form>
								<br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	<%@ include file="includes/footer.jsp"%>