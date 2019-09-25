<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="section0" class="mt-3">
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
            <c:forEach items="${companyList}" var="vo">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="font-weight-bold card-title">
                        	<h2>
                        		${vo.ci_companyName }
                        		<c:if test="${vo.followId eq 0}">
									<button id="unfollow" class="follow btn btn-outline-danger" data-ciId=${vo.ci_id }>♡</button>
								</c:if>
								<c:if test="${vo.followId ne 0}">
									<button id="follow" class="follow btn btn-outline-danger" data-ciId=${vo.ci_id } data-followId=${vo.followId }>♥</button>
								</c:if>
                        	</h2>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="small">평균연봉</div>
                        <div class="h2">2435만원</div>
                        <div class="small text-danger">*국민연금 납부 기준</div>
                    </div>
                </div>
               </c:forEach>
            </div>
        </div>
    </div>
</div>  
<div id="section1" class="mt-3">
                <div class="container center-block">
                    <div class="card border-primary"><!-- 기업정보 컨테이너 시작-->
                        <div class="card-body">
                <div class="info"> <!-- info 컨테이너 시작 -->
                    <div class="text-primary font-weight-bold card-title"><h5>기업 정보</h5></div>
					<c:forEach items="${companyList}" var="vo">
	                    <div class="row mt-3">
	                        <div class="col-md-6">
								소재지 | ${vo.ci_industry}
							</div>
	                        <div class="col-md-6">
								주소 | ${vo.ci_address} 
							</div>
	                    </div>
					</c:forEach>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="human">
                                	총 인원  ${cptotal}명
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="since">
                                	업력 ${cpsince}년
                            </button>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="join">
                                	이번달 입사 ${tmin}명
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-info btn-lg btn-block" id="leave">
                                	이번달 퇴사 ${tmout}명
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
                                                    <div id="precp"  class="progress-bar bg-info" role="progressbar"
                                                         aria-valuenow="60"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100" style="width: 40%">
                                                        <div class="col-md" id="precptxt" ></div>
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
                                                    <div id="samecp" class="progress-bar bg-success" role="progressbar"
                                                         aria-valuenow="60"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100" style="width: 80%;">
                                                        <div class="col-md" id="samecptxt" ></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </table> <!--테이블 끝-->
                                </div> <!-- 그래프 컨테이너 끝-->
                            </div> <!-- 통계 그래프 끝-->
                        </div>
      

                    </div>  <!-- info 끝 -->

                </div>
            </div>
        </div><!-- 기업정보 컨테이너 끝-->
    </div>
</div>

<script src="resources/js/follow.js"></script>
<script>
 $(document).ready ( function() {
	 var cptotal = ${cptotal} //인원
	 var cpsince = ${cpsince} //업력
	 var tmin = ${tmin} // 이번달 입사자
	 var tmout = ${tmout} // 이번달 퇴사자
	 
	 var sincerank = ${sincerank} //동종업계 업력 순위
	 var latestcptotal = ${latestcptotal} // 동종업계 인원 최신달 순위
	 var alltminrank = ${alltminrank} // 동종업계 이번달 입사자 순위
	 var alltmoutrank = ${alltmoutrank} // 동종업계 이번달 퇴사자 순위
	 var path = "${path}"
	 
	//follow
	$(document).on("click",".follow", function() {
		var btn = $(this)
		follow(path,btn)
	});//onclick
	//follow end
	
	// 최초에 보이는 기업정보
	  $("#select").html("총 인원");
	  $('#precp').attr("style", "width:100%");
      $('#precptxt').html(cptotal+"명");
      $('#samecp').attr("style", "width:"+latestcptotal+"%");
      $('#samecptxt').html(latestcptotal+"% 순위");
	 
     /* 인원 */
      $("#human").click(function(){
	      $("#select").html("총 인원");
	      $('#precp').attr("style", "width:100%");
	      $('#precptxt').html(cptotal+"명");
	      $('#samecp').attr("style", "width:"+latestcptotal+"%");
	      $('#samecptxt').html(latestcptotal+"% 순위");
      });
     /* 업력 */
      $("#since").click(function(){
          $("#select").html("업력");
          $('#precp').attr("style", "width:100%");
          $('#precptxt').html(cpsince+"년");
          $('#samecp').attr("style", "width:"+sincerank+"%");
          $('#samecptxt').html(sincerank+"% 순위");
      });
     /* 입사 */
      $("#join").click(function(){
          $("#select").html("이번 달 입사");
          $('#precp').attr("style", "width:100%");
          $('#precptxt').html(tmin+"명");
          $('#samecp').attr("style", "width:"+alltminrank+"%");
          $('#samecptxt').html(alltminrank+"% 순위");
      });
     /* 퇴사 */
      $("#leave").click(function(){
          $("#select").html("이번 달 퇴사");
          $('#precp').attr("style", "width:100%");
          $('#precptxt').html(tmout+"명");
          $('#samecp').attr("style", "width:"+alltmoutrank+"%");
          $('#samecptxt').html(alltmoutrank+"% 순위");
      });
 })
</script>

