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

<div class="mySection">




    <div class="container mt-4">
        <div class="card border-primary">
            <div class="card-body">
                <h5 style="color:royalblue;">최근 본 기업</h5>
				<c:forEach items="${companyList }" var="item">
                <hr style="border:1px solid #c7d5f8; padding: 0px;">
				
                <div class="row">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 ml-5">
                                <div class="row">
                                    <h4>
                                        <a href="${pageContext.request.contextPath}/info?ci_companyName=${item.ci_companyName}&ci_id=${item.ci_id}">${item.ci_companyName}</a>
										<c:if test="${item.followId eq 0}">
											<button id="unfollow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id }>♡</button>
										</c:if>
										<c:if test="${item.followId ne 0}">
											<button id="follow" class="follow btn btn-outline-danger" data-ciId=${item.ci_id } data-followId=${item.followId }>♥</button>
										</c:if>
                                    </h4>
                                </div>
                                <div class="row">
                                    ${item.ci_industry } | ${item.ci_address }
                                </div>
                                <div class="row">
                                   	평균연봉 ${item.ci_avgsalary } 만원
                                </div>
                            </div>

                            <div class="col-lg-2 ml-2 align-middle ">
                                <div class="row justify-content-center">
                                   	<div class="text-warning">
                                       <c:forEach begin="1" end="${item.companyReviewAvg}" step="1">
                                           <i class="fa fa-star"></i>
                                       </c:forEach>
                                       <c:forEach begin="${item.companyReviewAvg}" end="4" step="1">
                                           <i class="fa fa-star-o"></i>
                                       </c:forEach>
                                   	</div>
                                </div>
                            </div>
                            <div class="col-lg-auto">
                                <div class="row justify-content-center">
                                    <h5>${item.companyReviewAvg }</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
 var follow = function(path,btn) {
	var id = ""
	var tagId = btn.attr("id")
	var url = ""
	var type = ""
	if(tagId == "unfollow"){
		btn.html("♥")
		btn.attr("id","follow")
		id = btn.attr("data-ciId");
		url = path+"/follow/new"
		type = 'post'
	}else {
		btn.html("♡")
		btn.attr("id","unfollow")
		id = btn.attr("data-followId")
		console.log(btn);
		console.log(id);
		btn.removeAttr("data-followId");
		url =path+"/follow/"+id
		type = 'delete'
	}
	
	$.ajax({
		type : type,
		url : url,
		contentType : 'application/json;',
		data : JSON.stringify({
			id: id
		}),
		success : function(data) {
			if(typeof data === 'number') {
				btn.attr("data-followId",data)	
			}
		},
		error : function(request,status,error) {
//			alert("status : "+request.status + 
//					"\n error: "+ error)
			if(request.status === 403) {
				location.href="logininterceptor";
			}
			if(request.status === 404) {
				location.href="gradeceptor";
			}
		}
	})	
	
} 
var path = "${pageContext.request.contextPath}";
window.onpageshow = function(event) {

    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        location.reload(true); 
    }
}

$(document).ready(function() {
   //follow
   $(document).on("click",".follow", function() {
      var btn = $(this)
      follow(path,btn)
   });//onclick
   //follow end
});
</script>