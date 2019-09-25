					let fetchList = function(keyword,path) {

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
					                    renderList(false, idx,vo,path);
					                })
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);
							}
						});
						
					};//fetchList
					
					
					
					
					let renderList = function(mode, idx,res,path){
						console.log(res)
						//follow check
						let followBtn = ""
						if(res.followId === 0) followBtn = '<button id="unfollow" class="follow btn btn-outline-danger" data-ciId="'+res.ci_id+ '">♡</button>'
						else followBtn = '<button id="follow" class="follow btn btn-outline-danger" data=ciId="' +res.ci_id+ '" data-followId="'+res.followId+ '">♥</button>'
						// check end
						var starHtml = '<div class="text-warning">';
						for(var i = 1; i <= res.companyReviewAvg; i++) {
							starHtml += '<i class="fa fa-star"></i>'
						}
						for(var i = 1; i <= 5-res.companyReviewAvg; i++) {
							starHtml += '<i class="fa fa-star-o"></i>'
						}
						starHtml += '</div>'
		        // 리스트 html을 정의
		        let html = "<div class='card-body' data-startNo="+res.ci_id+">"
		        			+ '<hr style="border: 1px solid #c7d5f8; padding: 0px;">'
		        			+	'<div class="row">'
		        	        +		'<div class="container-fluid">'
		                    +			'<div class="row">'
		                    +				'<div class="col-lg-6 ml-5">'
							+	                 '<div class="row justify-content-center">'
		                    +						'<h4>'
		                    +						'<a href="'+path+'/info?ci_companyName='+res.ci_companyName+'&ci_id='+res.ci_id+'">' +res.ci_companyName+'</a>'
		                    +						followBtn
		                    +						'</h4>'
		        			+					 '</div>'
		        			+					 '<div class="row justify-content-center">'
		        			+						res.ci_industry+" | " + res.ci_address
		        			+					 '</div>'
		        			+					 '<div class="row justify-content-center">'
		        			+					  "평균연봉 "+res.ci_avgsalary+"만원"+	'</div>'
		        			+					 '</div>'
		        			+					 '<div class="col-lg-auto">'
		        			+						'<div class="row justify-content-center">'
		        			+					    	'<h5 class="">'+starHtml+'</h5>'
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
		        			+							'<h5>'+res.companyReviewAvg.toFixed(1)+'</h5>'
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
		    };//renderList