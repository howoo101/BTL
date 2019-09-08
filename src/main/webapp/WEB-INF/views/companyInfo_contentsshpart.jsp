<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="includes/header.jsp" %>

<section>
	
	
	
	
	
	
<div class="container panel panel-default" style="background-color: white">
								<h2 class="text-primary">기업정보</h2>
								   		 <c:forEach items="${companyList}" var="vo"> <!-- 기업정보 리스트 시작 -->
												<div class="row">
														<div class="col-md-6">
														     소재지 | ${vo.ci_industry} 
														 </div>
														<div class="col-md-6">
														  주소 | ${vo.ci_address} 
														</div>         
												 </div>
										 </c:forEach>  <!-- 기업정보 리스트 끝 -->


    									<div class="row">
					                        <div class="col-md-6">
					                            <button class="btn btn-default btn-lg btn-block" id="human" >
					                           	 총 인원  ${cptotal}명
					                            </button>
					                        </div>
					 					   <div class="col-md-6">
				                            <button class="btn btn-default btn-lg btn-block" id="since">
				                			          업력 ${cpsince}년
				                            </button>
				                          </div>			                 
			                  		  </div>
					                    <div class="row">
					                        <div class="col-md-6">
					                            <button class="btn btn-default btn-lg btn-block" id="join" >
					                                	이번달 입사 ${tmin}명
					                            </button>
					                        </div>
					                        <div class="col-md-6">
					                            <button class="btn btn-default btn-lg btn-block" id="leave">
					                             	       이번달 퇴사 ${tmout}명
					                            </button>
					                        </div>            
					                    </div>
	                    
	                    
	  <div class="row" >
        <div class="container panel panel-default">
        <div class="col-xs-12" style="background-color: white">
            <div class="row">
                <div class="col-xs-12 text-center"><h3 id="select"></h3></div>
            </div>
            <hr style="border:1px solid #c7d5f8; padding: 0px;">
            <div class="row">
                <div class="col-md-3" >현재기업 </div>
                    <div class="col-md-7">
                        <div class="progress">
                            <div id="precp" class="progress-bar progress-bar-success" role="progressbar" style="width:20%"></div>
                        </div>
                    </div>
                <div class="col-md-2" id="precptxt" ></div>
                
                <div class="col-md-3">동종기업</div>
                    <div class="col-md-7">
                        <div class="progress">
                         <div id="samecp" class="progress-bar progress-bar-success" role="progressbar" style="width:40%">
                        </div>
                    </div>
                </div>
                <div class="col-md-2" id="samecptxt"></div>
		        </div>
		    </div>
	                    
	                    
 
		</div>
	</div>
</div>



 <script>
 
 
 
  
 window.onload = function() {
	 
	 var cptotal = ${cptotal} //인원
	 var cpsince = ${cpsince} //업력
	 var tmin = ${tmin} // 이번달 입사자
	 var tmin = ${tmout} // 이번달 퇴사자
	 
	 var sincerank = ${sincerank} //동종업계 업력 순위
	 var totalrank = ${totalrank} // 동종업계 최신달 순위
	 var alltminrank = ${alltminrank} // 동종업계 이번달 입사자 순위
	 var alltmoutrank = ${alltmoutrank} // 동종업계 이번달 퇴사자 순위
	 
	 $(document).ready(function() {
		   $("#select").html("총 인원");
		   $('#precp').attr("style", "width:100%");
           $('#precptxt').html(cptotal+"명");
           $('#samecp').attr("style", "width:"+totalrank+"%");
           $('#samecptxt').html(totalrank+"%");
		} );
	
	 
        /* 인원 */
        $(document).ready(function(){
            $("#human").click(function(){
                $("#select").html("총 인원");
                $('#precp').attr("style", "width:100%");
                $('#precptxt').html(cptotal+"명");
                $('#samecp').attr("style", "width:"+totalrank+"%");
                $('#samecptxt').html(totalrank+"%");
            });
        });
        /* 업력 */
        $(document).ready(function(){
            $("#since").click(function(){
                $("#select").html("업력");
                $('#precp').attr("style", "width:100%");
                $('#precptxt').html(cpsince+"년");
                $('#samecp').attr("style", "width:"+sincerank+"%");
                $('#samecptxt').html(sincerank+"%");
              
      
            });
        });
        /* 입사 */
        $(document).ready(function(){
            $("#join").click(function(){
                $("#select").html("이번 달 입사");
                $('#precp').attr("style", "width:100%");
                $('#precptxt').html(tmin+"명");
                $('#samecp').attr("style", "width:"+alltminrank+"%");
                $('#samecptxt').html(alltminrank+"%");
              
                
                
            });
        });
        /* 퇴사 */
        $(document).ready(function(){
            $("#leave").click(function(){
                $("#select").html("이번 달 퇴사");
                $('#precptxt').html(tmin+"명");
                $('#samecp').attr("style", "width:"+alltmoutrank+"%");
                $('#samecptxt').html(alltmoutrank+"%");
            });
        });
 }
 
   </script>




</section>

<%@ include file="includes/footer.jsp" %>



    
    
    