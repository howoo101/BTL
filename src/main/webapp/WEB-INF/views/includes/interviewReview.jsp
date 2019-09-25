<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="section5" class="mt-3">
    <!--면접후기-->
    <div class="container center-block">
        <div class="card border-primary">
            <div class="card-body">
                <div class="text-primary font-weight-bold card-title"><h5 class="mt4">면접후기</h5></div>

                <div class="row">
                    <div class="col-md-4 py-1">
                        면접 난이도
                        <canvas id="interviewLevel"></canvas>
                        <div class="text-center">
                            <h4 class="difAve">0.0</h4>
                            <text class="small">평균 난이도</text>
                        </div>
                    </div>
                    <div class="col-md-4 py-1">
                        면점 경험
                        <canvas id="interviewExperience"></canvas>
                    </div>
                    <div class="col-md-4 py-1">
                        면접 결과
                        <canvas id="interviewResult"></canvas>
                    </div>
                </div>

                <div class="interviewChat">
                    <%-- 내용--%>
                </div>

                <!--페이지-->
                <div class="container-fluid">
                    <div class="row col col-lg-12">
                        <div class="col col-lg-2"></div>
                        <div class="col col-lg-8 interviewReviewFooter">
                            <ul class="pagination pagination-sm center ">
                            </ul>
                        </div>
                        <div class="col col-lg-2 text-right">
                            <button id="interviewReviewRegister" type="button" class="btn btn-outline-info">후기 작성
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!--모달창 -->
    <div class="modal interviewModal fade" tabindex="-1" role="dialog"
         aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">

                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 난이도</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <select class="form-control custom-select" name="ir_difficulty">
                                    <option>쉬움</option>
                                    <option>약간 쉬움</option>
                                    <option>보통</option>
                                    <option>약간 어려움</option>
                                    <option>어려움</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 날짜</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <input class="form-control" type="date" name='ir_interviewDate' value=''>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 경험</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <select class="form-control custom-select" name="ir_experience">
                                    <option>긍정적</option>
                                    <option>보통</option>
                                    <option>부정적</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>지원 경로</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <select class="form-control custom-select" name="ir_route">
                                    <option>공개 채용</option>
                                    <option>상시 채용</option>
                                    <option>취업 센터</option>
                                    <option>학교 취업 센터</option>
                                    <option>온라인 지원</option>
                                    <option>기타</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접, 채용 과정 등 요약</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <textarea class="form-control" name='ir_title' rows="4"
                                          placeholder="최대한 자세하게 작성해주세요. 최초 연락부터 인터뷰 횟수, 분위기, 면접관의 특징, 면접 팁 등"></textarea>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 질문</label>
                        </div>
                        <div class="col-sm-9">

                            <label>
                                <textarea class="form-control" name='ir_question' rows="4"></textarea>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 답변</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <textarea class="form-control" name='ir_answer' rows="4"></textarea>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>면접 결과</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <select class="form-control custom-select" name="ir_result">
                                    <option>대기중</option>
                                    <option>합격</option>
                                    <option>불합격</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <label>결과 발표</label>
                        </div>
                        <div class="col-sm-9">
                            <label>
                                <input class="form-control" type="date" name='ir_resultDate' value=''>
                                <input class="user_id" type="hidden" value="<%=user_id%>">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id='interviewRegisterBtn' type="button" class="btn btn-primary">Register</button>
                    <button id='interviewCloserBtn' type="button" class="btn btn-warning" data-dismiss="modal"
                            aria-hidden="true">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        const ci_idValue = '<c:out value="${companyList[0].ci_id}"/>';//homeController에 있는 모델 받아서 사용 0 넣지 안으면 에러

        const interviewReviewFooter = $(".interviewReviewFooter");
        var interviewReviewService = (function () {
            //리뷰 출력 param이라는 개체를 통해 파라미터를 전달받어 JSON목록을 호출하며 JSON 형태가 필요하므로 URL 호출 확장자를 .json으로 처
            function getList(param, callback, error) {

                var ci_id = param.ci_id;
                var page = param.page;

                $.getJSON("${path}/interviewReview/pages/" + ci_id + "/" + page + ".json", function (data) {
                    if (callback) {
                        // callback(data);
                        callback(data.interviewReviewCnt, data.interviewReviewDTOList);
                    }
                }).fail(function (xhr, status, err) {
                    if (error) {
                        error();
                    }
                });

            }

            function calTime(timeValue, resultValue) {

                return (new Date(resultValue) - new Date(timeValue)) / (24 * 3600 * 1000);
            }

            //시간 표시 XMl이나 JSON의 형태로 데이터를 받을때는 순수하게 숫자로 표현되는 시간ㅇ값이 나오게 되어 벼환해서 사용
            function displayTime(timeValue) {

                const dateObj = new Date(timeValue);

                const yy = dateObj.getFullYear();
                const mm = dateObj.getMonth() + 1;
                const dd = dateObj.getDate();

                return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
            }

            return {getList: getList, calTime: calTime, displayTime: displayTime}

        })();

        const interviewModal = $(".interviewModal");
        let difficultyModal = interviewModal.find("select[name='ir_difficulty']");
        let interviewDateModal = interviewModal.find("input[name='ir_interviewDate']");
        let interviewExperienceModal = interviewModal.find("select[name='ir_experience']");
        let interviewRouteModal = interviewModal.find("select[name='ir_route']");
        let interviewTitleModal = interviewModal.find("textarea[name='ir_title']");
        let interviewQuestionModal = interviewModal.find("textarea[name='ir_question']");
        let interviewAnswerModal = interviewModal.find("textarea[name='ir_answer']");
        let interviewResultModal = interviewModal.find("select[name='ir_result']");
        let interviewResultDateModal = interviewModal.find("input[name='ir_resultDate']");
        const user_id = interviewModal.find('input[class="user_id"]');


        $("#interviewReviewRegister").on("click", function (e) {
            $(".interviewModal").modal("show");
        });

        const interviewRegisterBtn = $("#interviewRegisterBtn");
        const interviewReviewUL = $(".interviewChat");

        interviewRegisterBtn.on("click", function (e) {

            const interviewReview = {
                ir_difficulty: difficultyModal.val(),
                ir_interviewDate: interviewDateModal.val(),
                ir_experience: interviewExperienceModal.val(),
                ir_route: interviewRouteModal.val(),
                user_id : user_id.val(),
                ir_title: interviewTitleModal.val(),
                ir_question: interviewQuestionModal.val(),
                ir_answer: interviewAnswerModal.val(),
                ir_result: interviewResultModal.val(),
                ir_resultDate: interviewResultDateModal.val(),
                ci_id: ci_idValue
            };

            add(interviewReview, function (result) {
                alert("등록에 성공하였습니다.");

                interviewModal.find("input").val("");
                interviewModal.modal("hide");

                // showList(1);
                location.reload();
            });
        });

        function add(interviewReview, callback, error) {
            $.ajax({
                type: 'post',
                url: '${path}/interviewReview/new',
                data: JSON.stringify(interviewReview),
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }//add

        showList(1);

        let pageNum = 1;
        const companyReviewFooter = $(".companyReview_pagination");

        //showList
        function showList(page) {

            interviewReviewService.getList({
                ci_id: ci_idValue,
                page: page || 1,
            }, function (interviewReviewCnt, interviewReviewDTOList) {
                if (page === -1) {
                    pageNum = Math.ceil(interviewReviewCnt / 2.0);
                    showList(pageNum);
                    return;
                }

                let str = "";

                //List가 비어있는 경우 "" 처리
                if (interviewReviewDTOList.length === 0) {

                    interviewReviewUL.html("");

                    return;
                }

                for (let i = 0, len = interviewReviewDTOList.length || 0; i < len; i++) {

                    str += "<div class='card border-info mb-3'>";
                    str += "    <div class='card-header small'>" + interviewReviewService.displayTime(interviewReviewDTOList[i].ir_interviewDate) + "</div>";
                    str += "         <div class='card-body'>";
                    str += "            <div class='row'>";
                    str += "                <div class='col-lg-3'>";
                    str += "                   <div class='container-fluid'>";
                    str += "                     <small class='font-weight-bold'>면접 난이도</small><br>";
                    str += "                       <small class='difficultyColor font-weight-bold'>" +interviewReviewDTOList[i].ir_difficulty + "</small><br><br>";
                    str += "                           <small class='font-weight-bold'>면접 일자</small><br>";
                    str += "                             <small>" + interviewReviewService.displayTime(interviewReviewDTOList[i].ir_interviewDate) + "</small> <br><br>";
                    str += "                               <small class='font-weight-bold'>면접 경로</small><br>";
                    str += "                                 <small>공개 채용</small></div>";
                    str += "                                </div>";
                    str += "                                    <div class = 'col-lg-9'>";
                    str += "                                        <text class = 'small'>" + interviewReviewDTOList[i].ir_title + "</text>";
                    str += "                                    <hr><text class ='small'>";
                    str += "                                        <text class = 'font-weight-bold'>면접 질문</text><br>" + interviewReviewDTOList[i].ir_question + "</text>";
                    str += "                                    <hr>";
                    str += "                                        <text class='small'>";
                    str += "                                        <text class='font-weight-bold'>질문에 대한 답변</text>";
                    str += "                                        <br>" + interviewReviewDTOList[i].ir_answer + "</text>";
                    str += "                                    <hr>";
                    str += "                                        <div class = 'row text-center'><div class = 'col-lg-4'><span class='font-weight-bold'> 발표시기</span><br>" + interviewReviewService.calTime(interviewReviewDTOList[i].ir_interviewDate, interviewReviewDTOList[i].ir_resultDate) + " 일 후 </div>";
                    str += "                                            <div class='col-lg-4' style='border-left: 2px solid #ddd'><span class='font-weight-bold'>면접 결과</span><br>" + interviewReviewDTOList[i].ir_result + "</div>"
                    str += "                                               <div class = 'col-lg-4' style = 'border-left: 2px solid #ddd'><span class='font-weight-bold'>면접 경험</span><br>" + interviewReviewDTOList[i].ir_experience + "</div>";
                    str += "</div></div></div></div></div>";
                }

                interviewReviewUL.html(str);

                showInterviewReviewPage(interviewReviewCnt);

                //면접 난이도에 따른 글씨 색 부여
                const difficultyColor = $(".difficultyColor");

                for (let i = 0; i < difficultyColor.length; i++) {

                    switch (difficultyColor[i].innerHTML) {
                        case "쉬움":
                            difficultyColor[i].style.color = "#36A2EB";
                            break;
                        case "약간 쉬움":
                            difficultyColor[i].style.color = "#9ceb8a";
                            break;
                        case "보통":
                            difficultyColor[i].style.color = "#ffaf27";
                            break;
                        case "약간 어려움":
                            difficultyColor[i].style.color = "#ebb67b";
                            break;
                        case "어려움":
                            difficultyColor[i].style.color = "#FF6384";
                            break;
                    }
                }

                //평균 계산하기 위해서
                const difficultyAve = {...${difficultyList}};
                let aveResult = 0.0;
                let difCtn = 0;
                const difAveUL = $(".difAve");

                for (let i = 0; i < 5; i++) {
                    aveResult += difficultyAve[i] * (i + 1);
                    difCtn += difficultyAve[i];
                }
                aveResult /= difCtn;
                if (aveResult !== 0) {
                    difAveUL.html(aveResult);
                }
            })
        }//end page

        //페이지처리
        function showInterviewReviewPage(interviewReviewCnt) {

            let endNum = Math.ceil(pageNum / 10.0) * 10;
            const startNum = endNum - 9;

            const prev = startNum !== 1;
            let next = false;

            if (endNum * 2 >= interviewReviewCnt) {
                endNum = Math.ceil(interviewReviewCnt / 2);
            }

            if (endNum * 2 < interviewReviewCnt) {
                next = true;
            }

            let str = "<ul class='pagination pagination-sm center'>";

            if (prev) {
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
            }

            for (var i = startNum; i <= endNum; i++) {

                var active = pageNum === i ? "active" : "";

                str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }

            if (next) {
                str += "<li class ='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a><li>";
            }


            str += "</ul></div>";

            interviewReviewFooter.html(str);
        }

        interviewReviewFooter.on("click", "li a", function (e) {

            e.preventDefault();

            pageNum = $(this).attr("href");

            showList(pageNum);

        });

    });
</script>
<script>
    // <!--strackbar-->
    window.onload = function () {
        var ctx = document.getElementById('interviewLevel');
        var data = {
            labels: [
                "쉬움",
                "약간 쉬움",
                "보통",
                "약간 어려움",
                "어려움"
            ],
            datasets: [
                {
                    label: "",
                    data: [...${difficultyList}],
                    backgroundColor: [
                        "#36A2EB",// 파랑
                        "#9ceb8a",// 초록
                        "#FFCE56",//노랑
                        "#ebb67b",// 주황
                        "#FF6384"// 뻘강
                    ],
                    hoverBackgroundColor: [
                        "#36A2EB",// 파랑
                        "#9ceb8a",// 초록
                        "#FFCE56",//노랑
                        "#ebb67b",// 주황
                        "#FF6384"// 빨강
                    ]
                }]
        };
        var stackedBarChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    xAxes: [{stacked: true}],
                    yAxes: [{stacked: true}]
                },
                legend: {
                    display: false
                }

            }
        });

        // 첫번째 도넛

        var data2 = {
            labels: [
                "부정적",
                "긍정적",
                "보통"
            ],
            datasets: [
                {
                    data: [...${expList}],
                    backgroundColor: [
                        "#FF6384",
                        "#36A2EB",
                        "#FFCE56"
                    ],
                    hoverBackgroundColor: [
                        "#FF6384",
                        "#36A2EB",
                        "#FFCE56"
                    ]
                }]
        };

        Chart.pluginService.register({
            beforeDraw: function (chart2) {
                var width2 = chart2.chart.width,
                    height2 = chart2.chart.height,
                    ctx2 = chart2.chart.ctx;

                ctx2.restore();
                var fontSize = (height2 / 170).toFixed(2);
                ctx2.font = fontSize + "em sans-serif";
                ctx2.textBaseline = "middle";
                ctx2.save();
            }
        });

        var chart2 = new Chart(document.getElementById('interviewExperience'), {
            type: 'doughnut',
            data: data2,
            options: {
                responsive: true,
                legend: {
                    display: true
                }
            }
        });

//     두번째 도넛
        var data3 = {
            labels: [
                "불합격",
                "합격",
                "대기중"
            ],
            datasets: [
                {
                    data: [...${resultList}],
                    backgroundColor: [
                        "#FF6384",
                        "#36A2EB",
                        "#FFCE56"
                    ],
                    hoverBackgroundColor: [
                        "#FF6384",
                        "#36A2EB",
                        "#FFCE56"
                    ]
                }]
        };

        Chart.pluginService.register({
            beforeDraw: function (chart3) {
                var width2 = chart3.chart.width,
                    height = chart3.chart.height,
                    ctx3 = chart3.chart.ctx;

                ctx3.restore();
                var fontSize3 = (height / 170).toFixed(2);
                ctx3.font = fontSize3 + "em sans-serif";
                ctx3.textBaseline = "middle";

                ctx3.save();
            }
        });

        var chart3 = new Chart(document.getElementById('interviewResult'), {
            type: 'doughnut',
            data: data3,
            options: {
                responsive: true,
                legend: {
                    display: true
                }
            }
        });

    };

</script>
