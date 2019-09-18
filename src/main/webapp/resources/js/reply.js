console.log("reply Module......");

var replyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply.........");

		$.ajax({
			type : 'post',
			url : 'replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	function getList(param, callback, error) {
		var board_id = param.board_id;
		var page = param.page || 1;
		$.getJSON("replies/pages/" + board_id + "/" + page + ".json", function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	function remove(reply_id, callback, error) {
		$.ajax({
			type : 'delete',
			url : 'replies/'+ reply_id,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
		
			}
		});
	}
		
	return {
		add : add,
		getList : getList,
		remove : remove
	};

})();