<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<section>

    <div class="jumbotron">
        <video class="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
            <source src="${path}/resources/video/Laptop%20-%201625.mp4" type="video/mp4">
            <source src="${path}/resources/video/Laptop-1625.webm" type="video/webm">
            Sorry, your browser does not support HTML5 video.
        </video>
        <article class="center">
            <form action="search" class="form-inline row" id="main-search-form" novalidate="novalidate">
                <div class="form-group">
                    <input class="form-control form-control-lg" name="keyword" type="text" placeholder="기업명을 검색해주세요" id="inputLarge">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
                </div>
            </form>
        </article>
    </div>

    <!--carousel-->
    <div class="row">
        <div class="col-md-12">
            <div id="infoCarousel" class="carousel slide" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#infoCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#infoCarousel" data-slide-to="1"></li>
                    <li data-target="#infoCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Carousel items -->
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <h5>테스트</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>

                            </div>
                            <div class="col-md-6 text-center">
                                <h5>비추</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>

                            </div>
                        </div>
                        <!--.row-->
                    </div>
                    <!--.item-->
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <h5>팀 장 추 천</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>

                            </div>
                            <div class="col-md-6 text-center"><h5>추 천 기 업</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>

                            </div>
                        </div>
                        <!--.row-->
                    </div>
                    <!--.item-->
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <h5>순위별</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>

                            </div>
                            <div class="col-md-6 text-center">
                                <h5>랜덤</h5>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                                <a href="#">
                                    <p>채용정보1 페이지2</p>
                                </a>
                            </div>
                        </div>
                        <!--.row-->
                    </div>
                    <!--.item-->
                </div>
                <!--.carousel-inner-->

                <a class="carousel-control-prev" href="#infoCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#infoCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!--.Carousel-->
        </div>
    </div>


</section>

<%@ include file="includes/footer.jsp" %>

