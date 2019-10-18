/**
 *
 */

const follow = function (path, btn) {
    var id = ""
    var tagId = btn.attr("id")
    var url = ""
    var type = ""
    if (tagId == "unfollow") {
        btn.html("♥")
        btn.attr("id", "follow")
        id = btn.attr("data-ciId");
        url = path + "/follow/new"
        type = 'post'
    } else {
        btn.html("♡")
        btn.attr("id", "unfollow")
        id = btn.attr("data-followId")
        btn.removeAttr("data-followId");
        url = path + "/follow/" + id
        type = 'delete'
    }

    $.ajax({
        type: type,
        url: url,
        dataType: 'json',
        contentType: 'application/json;',
        data: JSON.stringify({
            id: id
        }),
        success: function (data) {
            if (typeof data === 'number') {
                btn.attr("data-followId", data)
            }
        },
        error: function (request, status, error) {
//								alert("status : "+request.status + 
//										"\n error: "+ error)

            if (request.status === 403) {
                   Swal.fire({
                   title: '로그인이 필요합니다.',
                   text:'로그인 하시겠습니까?',
                   cancelButtonText: '취소',
                   type: 'warning',
                   showCancelButton: true,
                   confirmButtonColor: '#3085d6',
                   cancelButtonColor: '#d33',
                   confirmButtonText: '로그인'
                   }).then((result) => {
                   if (result.value) {
                  $('#loginModal').modal('show');
                   }
                   else {
                   }
                   });       
            	}
            if (request.status === 404) {
            
            	Swal.fire({
                 type: 'warning',
                 html: '회원님은 계정 제한 상태입니다.<br> 관리자 메일로 문의해주십시오.'
                 })	
            	}
        }
    })

};
