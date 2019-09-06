<!--strackbar-->

window.onload = function () {
    var ctx = document.getElementById('interviewLevel');
    var data = {
        labels: [
            "쉬움",
            "",
            "보통",
            "",
            "어려움"
        ],
        datasets: [
            {
                label: "",
                data: [7, 5, 3, 1, 1],
                backgroundColor: [
                    "#36A2EB",//빨강
                    "#9ceb8a",//초록
                    "#FFCE56",//파랑
                    "#ebb67b",//주황
                    "#FF6384"//노랑
                ],
                hoverBackgroundColor: [
                    "#36A2EB",//빨강
                    "#9ceb8a",//초록
                    "#FFCE56",//파랑
                    "#eb9579",//주황
                    "#FF6384"//노랑
                ]
            }]
    };
    var stackedBar = new Chart(ctx, {
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

    <!--첫번째 도넛-->

    var data2 = {
        labels: [
            "부정적",
            "긍정적",
            "보통"
        ],
        datasets: [
            {
                data: [300, 50, 100],
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

    <!--두번째 도넛-->
    var data3 = {
        labels: [
            "불합격",
            "합격",
            "대기중"
        ],
        datasets: [
            {
                data: [20, 50, 30],
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

const ctx4 = document.getElementById("myChart").getContext("2d");

const myChart = new Chart(ctx4, {
    type: "bar",

    data: {
        datasets: [
            // 1번 데이터셋
            {
                label: "Bar1 Dataset",
                data: [10, 20, 30, 40],
                backgroundColor: "rgba(153, 102, 255, 0.2)",
                borderColor: "rgba(153, 102, 255, 0.2)",
            },
            // 2번 데이터셋
            {
                label: "Bar2 Dataset",
                data: [40, 30, 50, 20],
                backgroundColor: "rgba(255, 159, 64, 0.2)",
                borderColor: "rgba(255, 159, 64, 0.2)",
            },
            // 3번 데이터셋
            {
                label: "Line Dataset",
                data: [50, 50,80, 60],
                // 선 아래 채우는 걸 false로
                fill: false,
                backgroundColor : ["rgba(255, 99, 132, 0.5)"],
                borderColor: ["rgba(255, 99, 132, 0.5)"],

                // 바 형태였던 그래프를 라인으로
                type: "line"
            }
        ],

        // x축 이름들
        labels: ["January", "February", "March", "April"]
    },

    options: {
        scales: {
            //X,Y축 옵션
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true //Y축의 값이 0부터 시작
                    }
                }
            ]
        }
    }
});

    var ctx5 = document.getElementById('companyChart').getContext('2d');
    var chart5 = new Chart(ctx5, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: ['1점', '2점', '3점', '4점', '5점'],
            datasets: [{
                label: '평가 인원',
                backgroundColor: 'rgb(255,235,142)',
                borderColor: 'rgb(255,235,142)',
                data: [0, 10, 5, 2, 20]
            }]
        },

        // Configuration options go here
        options: {
            scales: {
                xAxes: [{
                    display: true,
                    ticks: {
                        autoSkip: false
                    }
                }],
                yAxes: [{
                    display: false,
                    ticks: {
                        suggestedMin: 0,
                    }
                }]
            },
            legend: {
                display: false
            }

        }
    });








};

