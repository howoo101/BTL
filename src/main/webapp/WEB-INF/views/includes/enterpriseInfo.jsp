<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="section1" class="mt-3">
                <div class="container center-block">
                    <div class="card border-primary"><!-- 기업정보 컨테이너 시작-->
                        <div class="card-body">
                <div class="info"> <!-- info 컨테이너 시작 -->
                    <div class="text-primary font-weight-bold card-title"><h5>기업 정보</h5></div>

                    <div class="row mt-3">
                        <div class="col-md-6">소재지</div>
                        <div class="col-md-6">산업군</div>
                    </div>


                    <div class="row mt-4">
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="human">
                                인원 5명
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="sinse">
                                업력 1년
                            </button>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="join">
                                입사 5명
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="leave">
                                퇴사 0명
                            </button>
                        </div>
                    </div>
                    <br>

                    <div class="card border-primary">
                        <div class="card-body">
                            <div class="row justify-content-center">  <!-- 통계 그래프 시작-->
                                <div class="col-md-9"> <!--  그래프 컨테이너 시작-->
                                    <table class="table table-condensed border-info" style="width: 100%"> <!--테이블 시작 -->
                                        <th class="text-center" >  <!-- 선택시에 따라 해당탭으로 이동 ex) 인원,업력,입사,퇴사-->
                                            <h4 id="select">
                                                인원
                                            </h4>
                                        </th>

                                        <tr class="row"> <!-- 현재 기업 시작-->
                                            <td class="col-md-3">
                                                현재 기업
                                            </td>
                                            <td class="col-md-9">
                                                <div class="progress">
                                                    <div class="progress-bar-danger" role="progressbar"
                                                         aria-valuenow="60"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100" style="width: 40%">
                                                        명
                                                    </div>
                                                </div>
                                            </td>
                                        </tr> <!-- 현재 기업 끝-->


                                        <tr class="row"> <!-- 동종산업군  시작 -->
                                            <td class="col-md-3 ">
                                                동종 산업군
                                            </td>
                                            <td class="col-md-9">
                                                <div class="progress">
                                                    <div class=" progress-bar-warning" role="progressbar"
                                                         aria-valuenow="60"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100" style="width: 80%;">
                                                        60%
                                                    </div>
                                                </div>
                                            </td>
                                        </tr> <!-- 동종산업군 끝 -->


                                        <tr class="row"> <!-- 전체 기업-시작 -->
                                            <td class="col-md-3">
                                                전체 기업
                                            </td>
                                            <td class="col-md-9">
                                                <div class="progress">
                                                    <div class="progress-bar-info" role="progressbar" aria-valuenow="60"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100" style="width: 80%;">
                                                        60%
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>  <!-- 전체 기업 끝 -->


                                    </table> <!--테이블 끝-->
                                </div> <!-- 그래프 컨테이너 끝-->
                            </div> <!-- 통계 그래프 끝-->
                        </div>

                        <div class="row"> <!-- 주의사항 -->
                            <div class="col-lg-11 text-right"> <small style="color: red">※최근 1년간 데이터 기준</small></div>
                        </div> <!-- 주의사항 끝 -->

                    </div>  <!-- info 끝 -->

                </div>
            </div>
        </div><!-- 기업정보 컨테이너 끝-->
    </div>
</div>