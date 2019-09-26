<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="includes/header.jsp" %>

<section>
    <div class="headerVideo">
        <div class="overlay"></div>
        <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
            <source src="${path}/resources/video/Internet-Cafe-156.mp4" type="video/mp4">
            <source src="${path}/resources/video/Internet-Cafe-156.webm" type="video/webm">
            죄송합니다. 동영상이 지원되지 않습니다.
        </video>
        <div class="container h-100">
            <div class="d-flex h-100 text-center align-items-center">
                <div class="w-100 text-white">
                    <h1 class="display-3">Find Job </h1>
                    <article class="center">
                        <form action="search" class="form-inline row" id="main-search-form" novalidate="novalidate">
                            <div class="form-group">
                                <input class="form-control form-control-lg" name="keyword" type="text"
                                       placeholder="기업명을 검색해주세요" id="inputLarge">
                                <button class="btn btn-secondary my-2 my-sm-0 ml-2" type="submit">검색</button>
                            </div>
                        </form>
                    </article>
                </div>
            </div>
        </div>
    </div>


    <!--carousel-->
    <div class="row mt-4">
        <div class="col-md-12">
            <div id="infoCarousel" class="carousel slide" data-ride="carousel">

                <ol class="carousel-indicators" style="margin-bottom: 0; margin-top: 20px; height: 25px;">
                    <li data-target="#infoCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#infoCarousel" data-slide-to="1"></li>
                    <li data-target="#infoCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <div class="row">
                        	<c:forEach items="${map1}" var="map1" >
                            <div class="col-md-6 text-center">
                                <h5>${map1.key }</h5>
                                <c:forEach items="${map1.value }" var="item">
                                <a href="${path}/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}">
                                    <p>${item.ci_companyName }</p>
                                </a>
                                </c:forEach>
                            </div>
                            </c:forEach>
                            
                        </div>
                        <!--.row-->
                    </div>
                    <!--.item-->
                    <c:forEach items="${map2 }" var="map">
	                   	<div class="carousel-item">
	                        <div class="row">
	                        	<c:forEach items="${map.value }" var="innerMap">
		                            <div class="col-md-6 text-center">
		                                <h5>${innerMap.key }</h5>
		                                <c:forEach items="${innerMap.value }" var="item">
			                                <a href="#">
			                                    <p>${item.ci_companyName }</p>
			                                </a>
		                                </c:forEach>
		                            </div>
	                            </c:forEach>
	                        </div>
	                        <!--.row-->
	                    </div>
                    </c:forEach>
                   
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

