<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 31.
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 	int user_id = (int) request.getAttribute("user_id");   %>




<div class="container mt-4">
    <div class="card border-primary">
        <div class="card-body">
            <h5 style="color:royalblue;">내 면접 후기</h5>
            <hr style="border:1px solid #c7d5f8; padding: 0px;">
            <!-- Bootstrap table class -->
            <table class="table ">
                <thead>
                <tr class="">
                    <th scope="col">기업명</th>
                    <th scope="col">면접결과</th>
                    <th scope="col">면접날짜</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${myInterviewList }" var="list">
                    <tr>
                        <th scope="row"><a class='move' href="${pageContext.request.contextPath}/info?ci_companyName=${list.ci_companyName}&ci_id=${list.ci_id}">${list.ci_companyName}</a>
                        </th>
                        <td><c:out value="${list.ir_result}"/></td>
                        <td><c:out value="${list.ir_interviewDate}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div class="modal modifyInterview fade" tabindex="-1" role="dialog"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body" name="need">
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 난이도</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <select class="form-control custom-select" name="ir_difficulty">
                                <option>쉬움</option>
                                <option>약간 쉬움</option>
                                <option>보통</option>
                                <option>약간 어려움</option>
                                <option>어려움</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 날짜</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <input class="form-control" type="date" name='ir_interviewDate'>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 경험</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <select class="form-control custom-select" name="ir_experience">
                                <option>긍정적</option>
                                <option>보통</option>
                                <option>부정적</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>지원 경로</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <select class="form-control custom-select" name="ir_route">
                                <option>공개 채용</option>
                                <option>상시 채용</option>
                                <option>취업 센터</option>
                                <option>학교 취업 센터</option>
                                <option>온라인 지원</option>
                                <option>기타</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접, 채용 과정 등 요약</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                                <textarea class="form-control" name='ir_title' rows="4"
                                          placeholder="최대한 자세하게 작성해주세요. 최초 연락부터 인터뷰 횟수, 분위기, 면접관의 특징, 면접 팁 등"></textarea>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 질문</label>
                    </div>
                    <div class="col-sm-9">

                        <label>
                            <textarea class="form-control" name='ir_question' rows="4"></textarea>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 답변</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <textarea class="form-control" name='ir_answer' rows="4"></textarea>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>면접 결과</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <select class="form-control custom-select" name="ir_result">
                                <option>합격</option>
                                <option>대기중</option>
                                <option>불합격</option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>결과 발표</label>
                    </div>
                    <div class="col-sm-9">
                        <label>
                            <input class="form-control" type="date" name='ir_resultDate'>                         
                     
                         	<input class="user_id" type="hidden" value="<%=user_id%>"> 
                            <input class="ir_id" type="hidden" name="ir_id">
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id='interviewModifyBtn' type="button" class="btn btn-outline-info">Modify</button>
                <button id='interviewCloserBtn' type="button" class="btn btn-warning" data-dismiss="modal"
                        aria-hidden="true">Close
                </button>
            </div>
        </div>
    </div>
</div>




