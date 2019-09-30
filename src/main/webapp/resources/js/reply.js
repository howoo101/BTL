console.log("reply Module......");

var replyService = (function() {

	function add(reply_content, callback, error) {
		console.log("add reply.........");

		$.ajax({
			type : 'post',
			url : 'replies/new',
			data : JSON.stringify(reply_content),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
		error : function(request ,xhr, status, er) {
			    if (request.status === 403) {
			         location.href = "logininterceptor";
			     }
			     if (request.status === 404) {
			         location.href = "gradeceptor";
			     }
			}
		});
	}
	function getList(param, callback, error) {
		var board_id = param.board_id;
		var page = param.page || 1;
		$.getJSON("replies/pages/" + board_id + "/" + page + ".json",
				function(data) {
					if (callback) {
						callback(data.replyCnt, data.list);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	function remove(reply_id, callback, error) {
		$.ajax({
			type : 'delete',
			url : 'replies/' + reply_id,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},

			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}

			}
		});
	}
	function update(reply_content, callback, error) {
		console.log("reply_id :" + reply_content.reply_id);
		$.ajax({
			type : 'put',
			url : 'replies/' + reply_content.reply_id,
			data : JSON.stringify(reply_content),
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
	function get(reply_id, callback, error) {

		$.get("replies/" + reply_id + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function displayTime(timeValue) {
		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	;
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();