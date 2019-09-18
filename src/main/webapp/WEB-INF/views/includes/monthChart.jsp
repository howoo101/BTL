<%--
  Created by IntelliJ IDEA.
  User: h
  Date: 19. 8. 30.
  Time: 오후 6:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="section3" class="mt-3">
	<div class="container center-block">
		<div class="card border-primary">
			<div class="card-body">
				<%--월별 그래프 제목--%>
				<div class="text-primary font-weight-bold card-title">
					<h5>월별 그래프</h5>
				</div>

				<%-- 월별 차트 버튼 --%>
				<div class="button-container"
					style="text-align: center; width: 200px; margin: auto;">
					<button id="personBtn" class="btn btn-primary" disabled="disabled">
						인원수</button>
					<button id="salaryBtn" class="btn btn-success">평균 급여</button>
				</div>
				<!-- 인원수 차트 -->
				<div class="pchart-container"
					style="position: relative; width: 80%; margin: auto; display: block;">
					<canvas id="personChart" width="200" height="100"></canvas>
				</div>
				<!-- 급여 차트 -->
				<div class="schart-container"
					style="position: relative; width: 75%; margin: auto; display: none;">
					<canvas id="salaryChart" width="200" height="100"></canvas>
				</div>
			</div>
		</div>
	</div>
	<%--end section --%>
</div>

<script>
var tmp = '${ci_companyName}';
var cpMonthChart = new Array();
var cpTotalCntChart = new Array();
var cpInCntChart = new Array();
var cpOutCntChart = new Array();
var cpAvgPayChart = new Array();


$.ajax({
      url:"/findjob/graphajax?ci_companyName="+tmp,
      type:"GET",
      dataType:"JSON",

      success : function(data) {
   	   $.each(data, function(index, item){
   		   cpMonthChart.push(item.cp_month)
   		   cpTotalCntChart.push(item.cp_totalcnt)
   		   cpInCntChart.push(item.cp_incnt)
   		   cpOutCntChart.push(item.cp_outcnt);
   		   cpAvgPayChart.push(Math.floor(item.cp_avgpay/10000));
   	   });
   	   
		//월별 그래프
		const pChart = document.getElementById("personChart").getContext("2d");
		
		const personChart = new Chart(pChart, {
		type: "bar",
		
		data: {
		    datasets: [
		        // 1번 데이터셋-입사자
		        {	
		            label: "입사자",
		            // 입사자 데이터
		            data: [...cpInCntChart],
		            backgroundColor: "rgba(153, 102, 255, 0.2)",
		            borderColor: "rgba(153, 102, 255, 0.2)",
		        },
		        // 2번 데이터셋-퇴사자
		        {
		            label: "퇴사자",
		            // 퇴사자 데이터
		            data: [...cpOutCntChart],
		            backgroundColor: "rgba(255, 159, 64, 0.2)",
		            borderColor: "rgba(255, 159, 64, 0.2)",
		        },
		        // 3번 데이터셋-총인원
		        {	
		            label: "총인원",
		            // 총인원 데이터
		            data: [...cpTotalCntChart],
		            // 선 아래 채우는 걸 false로
		            fill: false,
		            backgroundColor : ["rgba(255, 99, 132, 0.5)"],
		            borderColor: ["rgba(255, 99, 132, 0.5)"],
		
		            // 바 형태였던 그래프를 라인으로
		            type: "line"
		        }
		    ],
		
		    // 매달 숫자들 2019.07/2019.08 (제일 작은 날 ~ 제일 큰날)
		    labels: [...cpMonthChart]
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
		    label: "연봉(만원)",
		    data: [...cpAvgPayChart],
		    backgroundColor: "rgba(153, 102, 255, 0.2)",
		    borderColor: "rgba(153, 102, 255, 0.2)"
		  }
		],
		// 매달 숫자들 2019.07/2019.08 (제일 작은 날 ~ 제일 큰날)
		labels: [...cpMonthChart]
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
		
		//월별 버튼 관련
		const person = document.getElementById("personBtn");
		const salary = document.getElementById("salaryBtn");
		
		const pDisplay = document.getElementsByClassName("pchart-container");
		const sDisplay = document.getElementsByClassName("schart-container");
		
		//인원수 이벤트
		person.onclick = () => {
		// 버튼 클릭 방지
		person.disabled = "disabled";
		salary.disabled = "";
		
		// 차트 보이고 안보이고
		pDisplay[0].style.display = "block";
		sDisplay[0].style.display = "none";
		};
		
		//평균 급여 이벤트
		salary.onclick = () => {
		person.disabled = "";
		salary.disabled = "disabled";
		
		pDisplay[0].style.display = "none";
		sDisplay[0].style.display = "block";
		};
		
		//월별 그래프 끝

      },
      error : function(xhr, status, error) {
           alert("에러발생");
      }
}); 
</script>
