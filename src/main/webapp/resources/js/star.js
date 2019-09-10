// Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;

(function ($, window) {
    var Starrr;

    Starrr = (function () {
        Starrr.prototype.defaults = {
            rating: void 0,
            numStars: 5,
            change: function (e, value) {
            }
        };

        function Starrr($el, options) {
            var i, _, _ref,
                _this = this;

            this.options = $.extend({}, this.defaults, options);
            this.$el = $el;
            _ref = this.defaults;
            for (i in _ref) {
                _ = _ref[i];
                if (this.$el.data(i) != null) {
                    this.options[i] = this.$el.data(i);
                }
            }
            this.createStars();
            this.syncRating();
            this.$el.on('mouseover.starrr', 'span', function (e) {
                return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('mouseout.starrr', function () {
                return _this.syncRating();
            });
            this.$el.on('click.starrr', 'span', function (e) {
                return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('starrr:change', this.options.change);
        }

        Starrr.prototype.createStars = function () {
            var _i, _ref, _results;

            _results = [];
            for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                _results.push(this.$el.append("<span class='fa .fa fa-star-o'></span>"));
            }
            return _results;
        };

        Starrr.prototype.setRating = function (rating) {
            if (this.options.rating === rating) {
                rating = void 0;
            }
            this.options.rating = rating;
            this.syncRating();
            return this.$el.trigger('starrr:change', rating);
        };

        Starrr.prototype.syncRating = function (rating) {
            var i, _i, _j, _ref;

            rating || (rating = this.options.rating);
            if (rating) {
                for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                    this.$el.find('span').eq(i).removeClass('fa fa-star-o').addClass('fa fa-star');
                }
            }
            if (rating && rating < 5) {
                for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                    this.$el.find('span').eq(i).removeClass('fa fa-star').addClass('fa fa-star-o');
                }
            }
            if (!rating) {
                return this.$el.find('span').removeClass('fa fa-star').addClass('fa fa-star-o');
            }
        };

        return Starrr;

    })();
    return $.fn.extend({
        starrr: function () {
            var args, option;

            option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
            return this.each(function () {
                var data;

                data = $(this).data('star-rating');
                if (!data) {
                    $(this).data('star-rating', (data = new Starrr($(this), option)));
                }
                if (typeof option === 'string') {
                    return data[option].apply(data, args);
                }
            });
        }
    });
})(window.jQuery, window);

$(function () {
    return $(".starrr").starrr();
});

$(document).ready(function () {

    $('.stars').on('starrr:change', function (e, value) {
        $('.count').html(value);
    });

    $('.stars-existing').on('starrr:change', function (e, value) {
        $('.count-existing').html(value);
    });


    var companyReviewService = (function () {

        function add(reply, callback, error) {

            $.ajax({
                type: "post",
                url: "/findjob/companyReview/new",
                data: JSON.stringify({
                    cr_comment: cr_comment,
                    cr_starRt: starRating,
                    cr_category: cr_category
                }),
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                        alert("리뷰가 등록되었습니다.")
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }


//리뷰 출력 param이라는 개체를 통해 파라미터를 전달받어 JSON목록을 호출하며 JSON 형태가 필요하므로 URL 호출 확장자를 .json으로 처
        function getList(param, callback, error) {

            var ci_id = param.ci_id;
            var page = param.page;

            $.getJSON("/findjob/companyReview/pages/" + ci_id + "/" + page + ".json", function (data) {
                if (callback) {
                    //리뷰의 목록만 가져오는경우
                    callback(data.companyReviewCtn);
                }
            }).fail(function (xhr, status, err) {
                if (error) {
                    error();
                }
            })

        }

//특정 리뷰 조회
        function get(cr_id, callback, error) {

            $.get("/findjob/companyReview/" + cr_id + ".json", function (result) {

                if (callback) {
                    callback(result);
                }

            }).fail(function (xhr, status, err) {
                if (error) {
                    error();
                }
            });
        }

//시간 표시 XMl이나 JSON의 형태로 데이터를 받을때는 순수하게 숫자로 표현되는 시간ㅇ값이 나오게 되어 벼환해서 사용
        function displayTime(timeValue) {
            var today = new Date();

            var gap = today.getTime() - timeValue;

            var dateObj = new Date(timeValue);
            var str = "";

            if (gap < (1000 * 60 * 60 * 24)) {

                var hh = dateObj.getHours();
                var mi = dateObj.getMinutes();
                var ss = dateObj.getSeconds();

                return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
            } else {
                var yy = dateObj.getFullYear();
                var mm = dateObj.getMonth();
                var dd = dateObj.getDate();

                return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
            }

        }

        return {add: add, get: get, getList: getList, displayTime: displayTime}

    });


});



