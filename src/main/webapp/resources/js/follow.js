/**
 * 
 */

let follow = function(path,btn) {
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
								userId: "1",
								id: id
							}),
							success : function(data) {
								
								if(typeof data === 'number') {
									btn.attr("data-followId",data)	
								}
							},
							error : function(request,status,error) {
//								alert("status : "+request.status + 
//										"\n error: "+ error)
								if(request.status === 403) {
									location.href="logininterceptor";
								}
							}
						})	
						
					}