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
                    "#36A2EB",// 빨강
                    "#9ceb8a",// 초록
                    "#FFCE56",// 파랑
                    "#ebb67b",// 주황
                    "#FF6384"// 노랑
                ],
                hoverBackgroundColor: [
                    "#36A2EB",// 빨강
                    "#9ceb8a",// 초록
                    "#FFCE56",// 파랑
                    "#eb9579",// 주황
                    "#FF6384"// 노랑
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

    
// 월별 그래프
const pChart = document.getElementById("personChart").getContext("2d");

const personChart = new Chart(pChart, {
    type: "bar",

    data: {
        datasets: [
            // 1번 데이터셋-입사자
            {	
                label: "입사자",
                // 입사자 데이터
                data: [10, 20, 30, 40],
                backgroundColor: "rgba(153, 102, 255, 0.2)",
                borderColor: "rgba(153, 102, 255, 0.2)",
            },
            // 2번 데이터셋-퇴사자
            {
                label: "퇴사자",
                // 퇴사자 데이터
                data: [40, 30, 50, 20],
                backgroundColor: "rgba(255, 159, 64, 0.2)",
                borderColor: "rgba(255, 159, 64, 0.2)",
            },
            // 3번 데이터셋-총인원
            {	
                label: "총인원",
                // 총인원 데이터
                data: [50, 50,80, 60],
                // 선 아래 채우는 걸 false로
                fill: false,
                backgroundColor : ["rgba(255, 99, 132, 0.5)"],
                borderColor: ["rgba(255, 99, 132, 0.5)"],

                // 바 형태였던 그래프를 라인으로
                type: "line"
            }
        ],

        // 매달 숫자들 2019.07/2019.08 (제일 작은 날 ~ 제일 큰날)
        labels: ["201905", "201906", "201907", "201908"]
    },

    options: {
        elements: {
          line: {
            fill: false,
            tension: 0 // disables bezier curves
          }
        },

        scales: {
          // X,Y축 옵션
          yAxes: [
            {
              ticks: {
                beginAtZero: true // Y축의 값이 0부터 시작
              }
            }
          ]
        }
      }
});

const sChart = document.getElementById("salaryChart").getContext("2d");

const salaryChart = new Chart(sChart, {
  type: "line",

  data: {
    datasets: [
      // 데이터셋 - 연봉
      {
        label: "연봉",
        data: [200, 100, 300, 700],
        backgroundColor: "rgba(153, 102, 255, 0.2)",
        borderColor: "rgba(153, 102, 255, 0.2)"
      }
    ],
    // 매달 숫자들 2019.07/2019.08 (제일 작은 날 ~ 제일 큰날)
    labels: ["January", "February", "March", "April"]
  },

  options: {
    elements: {
      line: {
        fill: false,
        tension: 0 // disables bezier curves
      }
    },

    scales: {
      // X,Y축 옵션
      yAxes: [
        {
          ticks: {
            beginAtZero: true // Y축의 값이 0부터 시작
          }
        }
      ]
    }
  }
});

// 월별 버튼 관련
const person = document.getElementById("personBtn");
const salary = document.getElementById("salaryBtn");

const pDisplay = document.getElementsByClassName("pchart-container");
const sDisplay = document.getElementsByClassName("schart-container");

// 인원수 이벤트
person.onclick = () => {
  // 버튼 클릭 방지
  person.disabled = "disabled";
  salary.disabled = "";

  // 차트 보이고 안보이고
  pDisplay[0].style.display = "block";
  sDisplay[0].style.display = "none";
};

// 평균 급여 이벤트
salary.onclick = () => {
  person.disabled = "";
  salary.disabled = "disabled";

  pDisplay[0].style.display = "none";
  sDisplay[0].style.display = "block";
};

// 월별 그래프 끝

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

