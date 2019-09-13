<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<div class="container mt-4">
		<div class="card border-primary" id="go">
			<h5 style="color: royalblue;">기업 검색 결과</h5>

			<c:forEach items="${companyList }" var="item">
				<div class="card-body" data-startNo=${item.ci_id }>
					<hr style="border: 1px solid #c7d5f8; padding: 0px;">
					<div class="row">
						<div class="container-fluid">
							<div class="row">
								<div class="col-lg-6 ml-5">
									<div class="row justify-content-center">
										<h4>
											<a href="${path }/info?ci_companyName=${item.ci_companyName}">${item.ci_companyName}</a>
											<c:if test="${item.followId eq 0}">
												<button id="unfollow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id }>♡</button>
											</c:if>
											<c:if test="${item.followId ne 0}">
												<button id="follow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id } data-followId=${item.followId }>♥</button>
											</c:if>
										</h4>
									</div>
									<div class="row justify-content-center">
										${item.ci_industry } | ${item.ci_address }</div>
									<div class="row justify-content-center">평균연봉 4534 만원</div>
								</div>

								<div class="col-lg-auto">
									<div class="row justify-content-center">
										<h5 class="">*****</h5>
									</div>
									<div class="row "
										style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">
										<div class="col-sm-12 text-center">${item.companyReviewCnt }</div>
										<div class="col-sm-12 text-center">
											<a href="">리뷰 코멘트</a>
										</div>
									</div>
								</div>
								<div class="col-lg-auto text-center">
									<div class="row justify-content-center">
										<h5>2.9</h5>
									</div>
									<div class="row " style="">
										<div class="col-sm-12 text-center">${item.interviewReviewCnt }</div>
										<div class="col-sm-12 text-center">
											<a href="">면접정보</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="includes/footer.jsp"%>
	<script>
		let isEnd = false;
		
		$(document).ready(
				function() {
					//follow
					$(document).on("click",".follow", function() {
						var id = ""
						var tagId = $(this).attr("id")
						var url = ""
						var type = ""
						if(tagId == "unfollow"){
							$(this).html("♥")
							$(this).attr("id","follow")
							id = $(this).attr("data-ciId");
							url = "${path}/follow/new"
							type = 'post'
						}else {
							$(this).html("♡")
							$(this).attr("id","unfollow")
							id = $(this).attr("data-followId")
							$(this).removeAttr("data-followId");
							url ="${path}/follow/"+id
							type = 'delete'
						}
						var btn = $(this)
						
						$.ajax({
							type : type,
							url : url,
							contentType : 'application/json;',
							data : JSON.stringify({
								userId: "1",
								id: id
							}),
							success : function(data) {
								if(typeof data === 'number') {
									btn.attr("data-followId",data)	
								}
								
								
							},
							error : function(request,status,error) {
								alert("status : "+request.status + 
										"\n error: "+ error)
							}
						})	
						
					})
					//follow end
					
					//scroll 
					var keyword = '${keyword}'

					$(window).scroll(function() {
						let $window = $(this);
						let scrollTop = $window.scrollTop();
						let windowHeight = $window.height();
						let documentHeight = $(document).height();
						
						if (scrollTop + windowHeight >= documentHeight-1) {
							fetchList();
						}
					})
					let fetchList = function() {

						if (isEnd == true) {
							return;
						}

						let lastBno = $(".card-body:last").attr("data-startNo")
						
						$.ajax({
							type : 'post',
							url : 'scroll',
							dataType : 'json',
							contentType : 'application/json;',
							data : JSON.stringify({
								'startNo' : lastBno,
								'keyword' : keyword
							}),
							success : function(result) {
								console.log(result)
								if (result.length < 20)
									isEnd = true;
								 $.each(result, function(idx,vo){
					                    renderList(false, idx,vo);
					                })
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);
							}
						})
					}
				})	
				let renderList = function(mode, idx,res){
				//follow check
				let followBtn = ""
				if(res.followId === 0) followBtn = '<button id="unfollow" class="follow btn btn-outline-danger" data-ciId="'+res.ci_id+ '">♡</button>'
				else followBtn = '<button id="follow" class="follow btn btn-outline-danger" data=ciId="' +res.ci_id+ '" data-followId="'+res.followId+ '">♥</button>'
				// check end
				
        // 리스트 html을 정의
        let html = "<div class='card-body' data-startNo="+res.ci_id+">"
        			+ '<hr style="border: 1px solid #c7d5f8; padding: 0px;">'
        			+	'<div class="row">'
        	        +		'<div class="container-fluid">'
                    +			'<div class="row">'
                    +				'<div class="col-lg-6 ml-5">'
					+	                 '<div class="row justify-content-center">'
                    +						'<h4>'
                    +						'<a href="${path}/info?ci_companyName='+res.ci_companyName+'">' +res.ci_companyName+'</a>'
                    +						followBtn
                    +						'</h4>'
        			+					 '</div>'
        			+					 '<div class="row justify-content-center">'
        			+						res.ci_industry+" | " + res.ci_address
        			+					 '</div>'
        			+					 '<div class="row justify-content-center">'
        			+					  "평균연봉 4534 만원"+	'</div>'
        			+					 '</div>'
        			+					 '<div class="col-lg-auto">'
        			+						'<div class="row justify-content-center">'
        			+					    	'<h5 class="">'+"*****"+'</h5>'
        			+					 	'</div>'
        			+					 	'<div class="row " style="border-right: 2px solid #ddd; border-left: 2px solid #ddd">'
        			+							'<div class="col-sm-12 text-center">'+res.companyReviewCnt+'</div>'
					+					 		'<div class="col-sm-12 text-center">'
					+								'<a href="">'+'리뷰 코멘트</a>'
					+							'</div>'
					+						'</div>'
					+ 					'</div>'
        			+					'<div class="col-lg-auto text-center">'
					+						'<div class="row justify-content-center">'
        			+							'<h5>2.9</h5>'
					+						 '</div>'	
					+						'<div class="row ">'
					+							'<div class="col-sm-12 text-center">'+res.interviewReviewCnt+'</div>'
					+							'<div class="col-sm-12 text-center">'
					+								'<a href="">면접정보</a>'
					+							'</div>'
					+						'</div>'
					+					'</div>'
					+				'</div>'
					+			'</div>'
					+		'</div>'
					+	'</div>'
        			
        if( mode ){
            $("#go").prepend(html);
        }
        else{
            $("#go").append(html);
        }
		//scroll end
    }
	</script>
</body>
</html>