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
<%@ include file="includes/header.jsp" %>

<div class="mySection">

    <%@ include file="includes/myPage_Menu.jsp" %>


        <div class="container mt-4">
            <div class="card border-primary">
                <div class="card-body">
                    <h5 style="color:royalblue;">팔로잉 기업</h5>
                    <hr style="border:1px solid #c7d5f8; padding: 0px;">


                    <div class="row">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-6 ml-5">
                                    <div class="row">
                                        <h4>
                                            (주)BTL
                                            <button class="btn btn-outline-danger">♡</button>
                                        </h4>
                                    </div>
                                    <div class="row">
                                        IT/웹/통신 | 서울 서초구
                                    </div>
                                    <div class="row">
                                       	 평균연봉 4534 만원
                                    </div>
                                </div>

                                <div class="col-lg-auto">
                                    <div class="row ">
                                        <h5 class="" >*****</h5>
                                    </div>
                                    <div class="row " style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">
                                        <div class="col-sm-12 text-center">23</div>
                                        <div class="col-sm-12 text-center"><a href="">리뷰 코멘트</a></div>
                                    </div>
                                </div>
                                <div class="col-lg-auto text-center">
                                    <div class="row">
                                        <h5>2.9</h5>
                                    </div>
                                    <div class="row " style="">
                                        <div class="col-sm-12 text-center">23</div>
                                        <div class="col-sm-12 text-center"><a href="">면접정보</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    <%@ include file="includes/footer.jsp" %>

