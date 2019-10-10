<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="section2" class="mt-3">
	<div class="container center-block">
		<div class="card border-primary">
			<div class="card-body">
				<div class="text-primary font-weight-bold card-title">
					<h5 style="float:left;padding-right: 20px;'">채용정보</h5> 
					<h5 style="float:left"><a href="${path}/calendar?ci_companyName=${ci_companyName}" style="text-decoration: none"><i class="material-icons">
						calendar_today
					</i></a></h5>
				</div>
				<div style="clear:both"></div>

				<!-- 채용정보 -->
				<div class="row" id="saramInRow">
					<div></div>				
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var hireName = '${ci_companyName}';

$.ajax({
    url:"/findjob/hireinfo?ci_companyName=" + hireName,
    type:"GET",
    dataType:"JSON",

    success : function(data) {
    	var week = ['일', '월', '화', '수', '목', '금', '토'];
    	var currentDate = + new Date();
    	var saramInRow = document.getElementById("saramInRow");
    	// 검색된 회사만큼 반복
    	for(var i = 0; i < data['jobs']['count']; i++){
	    	// 접수 마감일 (~월/일(요일))
			//1988118000000 이거라면 채용시까지
	    	var exprieationTime = data['jobs']['job'][i]['expiration-timestamp'];
	    	var date = new Date(exprieationTime*1000);
			
	    	var hireDate = "";
	    	if (exprieationTime == 1988118000){
	    		hireDate = "채용시까지";
	    	} else {
	    		hireDate = (date.getMonth()+1) + "-" + date.getDate() + "(" + week[date.getDay()] + ")"
	    	}
	    	
	    	// 회사 이름
	    	var companyName = data['jobs']['job'][i]['company']['detail']['name'];
	    	
	    	// 직무
	    	var positionTitle = data['jobs']['job'][i]['position']['title'];
	    	var positionTitleUrl = data['jobs']['job'][i]['url'];
		
	    	// 경력, 학력, 지역
	    	var experienceLevel = data['jobs']['job'][i]['position']['experience-level']['name'];
			var requiredEducationLevel = data['jobs']['job'][i]['position']['required-education-level']['name'];
			var location = data['jobs']['job'][i]['position']['location']['name'];
    	
    		saramInRow.innerHTML +=
    			  '<div class="col-sm-4" style="padding-top:5px; padding-bottom: 5px;">'
    			+ '  <!-- 패널 배경색 넣는곳 -->'
    			+ '  <div class="panels panel-default text-center panel-border">'
    			+ '    <!-- 패널 헤드 배경색 넣는곳  -->'
    			+ '    <div class="panel-headings panel-border" style="background-color: #819FF7;">'
    			+ '      <span class="text-light font-weight-bold">'+hireDate+'</span>'
    			+ '    </div>'
    			+ '    <div class="panel-body">'
    			+ '      <!-- 회사 이름을 넣는곳 -->'
    			+ '      <h4 class="name">'+companyName+'</h4>'
    			+ '      <h5>'
    			+ '        <!-- 사람인 채용공고 링크로 넣어주는곳-->'
    			+ '        <a href="'+positionTitleUrl+'"><b>'+positionTitle+'</b></a>'
    			+ '      </h5>'
    			+ '    </div>'
    			+ '    <!-- panel-footers에다가 아래 값들을 넣어주는 역할.-->'
    			+ '    <div class="panel-footers">'
    			+ '      <p>'
    			+ '        <small> <span class="experienceLevel">'+experienceLevel+'</span> | <span class="requiredEducationLevel">'+requiredEducationLevel+'</span> | <span class="location">'+location+'</span></small>'
    			+ '      </p>'
    			+ '    </div>'
    			+ '  </div>'
    			+ '</div>'
    	}
    },
	error : function(xhr, status, error) {
    	Swal.fire({
    		  type: 'error',
    		  text: '채용정보 에러발생',
    		})
	}
});
</script>