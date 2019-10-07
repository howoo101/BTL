<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp" %>
<div class="row text-center" style="margin: 50px">
    <div class="col-md-2">
        <h1 class="text-primary">FAQ</h1>
    </div>

    <div class=" col-md-8">
        <div class="FAQ-section">
            <div class="accordion" id="faq">

                <div class="faq 1 text-left">
                    <div class="faq-title">
                        <h3>연봉정보</h3>
                    </div>

                    <!-- 아코디언1 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse1" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 평균 연봉은 어떻게 산출하나요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse1" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        해당 회사의 국민연금 납부액과 납부인원수를 역산하여 계산합니다. 단, 상한액이 존재해 정확히지 않을수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 아코디언2 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse2" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 제가 알고있는 인원 수와 나와 있는 정보가 달라요. </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse2" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        국민연금 신고기준이므로 실제 일하시는 분들의 수와 다를 수 있습니다. 파견 / 도급 등은 포함되지 않고 계약직과 정규직을 모두 포함합니다.
                                        60시간 미만을 근로하는 단시간(일용)근로자 및 60세 이상 근로자는 당연가입대상에서 제외되기 때문에 다를 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 아코디언3 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse3" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 아는 회사가 검색이 되지 않아요. </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse3" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        검색되는 기업은 국민연금을 3인 이상 납부하는 사업장입니다.
                                        검색시 나오지 않는다면 국민연금에 신고된 이름이 다를 수 있습니다.
                                        또한 스타트업 같은 경우, 서비스명과 법인명(사업장명)이 달라 검색이 안 될 수도 있습니다. 개인사업자 정보는 제공되지 않습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="FAQ 2  text-left">
                    <div class="FAQ-title">
                        <h3>기업정보</h3>
                    </div>

                    <!-- 아코디언4 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse4" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 기업정보는 어디서 가지고 오는건가요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse4" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        공공데이터 포털에서 제공된 국민연금 가입 사업장 내역에서 가지고 옵니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="FAQ 3  text-left">
                    <div class="FAQ-title">
                        <h3>기업 위치</h3>
                    </div>

                    <!-- 아코디언5 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse5" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 기업위치는 어떻게 찾는 건가요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse5" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        회사이름과 도로명 주소를 조합해, 다음 API로 요청을해서 지도를 사용합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="FAQ 4  text-left">
                    <div class="FAQ-title">
                        <h3>채용정보</h3>
                    </div>

                    <!-- 아코디언6 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse6" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 채용정보는 어떤 기준으로 보여주는 건가요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse6" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        회사 이름으로 사람인 API에 요청을해서 채용 공고가 아직 끝나지 않은 회사들을 보여줍니다.
                                        회사이름, 근무부서, 경력유무, 학력, 회사 위치를 알려줍니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="FAQ 5  text-left">
                    <div class="FAQ-title">
                        <h3>월별 그래프</h3>
                    </div>

                    <!-- 아코디언7 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse7" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 월별 그래프는 무엇인가요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse7" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        국민연금을 납부액을 기준으로, 1년동안 월별로 입사자, 퇴사자, 회사 총인원, 평균 급여를 보여주게 됩니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="FAQ 6  text-left">
                    <div class="FAQ-title">
                        <h3>뉴스</h3>
                    </div>

                    <!-- 아코디언8 -->
                    <div class="faq-wrapper">
                        <div class="faq-header">
                            <div class="row" data-toggle="collapse" data-target="#collapse8" aria-expanded="false"
                                 aria-controls="collapse">
                                <span class="faq-header-text"> 뉴스는 어떻게 불러오나요? </span>
                                <i class="material-icons">keyboard_arrow_down</i>
                            </div>
                            <hr class="faq-header-text"/>
                        </div>
                        <div class="faq-body">
                            <div id="collapse8" class="collapse" aria-expanded="false" data-parent="#faq">
                                <div class="faq-body-text">
                                    <p>
                                        회사 이름을 네이버 뉴스 검색 API를 사용해서 검색을 한뒤, 제목에 회사이름이 있으면 가지고 옵니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>