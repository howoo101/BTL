<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
  <link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  <link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />

  <script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
  <script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>


<style>

  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #wrap {
    width: 1100px;
    margin: 0 auto;
  }

  #external-events{
    float: left;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #e6e6e6;
    text-align: left;
    margin-top: 60px;
    display: inline;
  }

  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }

  #external-events .fc-event{
    margin: 10px 0;
    cursor: pointer;
  }

  #calendar {
    float: right;
    width: 900px;
  }

  #external-events .important { 
    background-color: #d63031;
    border-color: #d63031;
    color: #ffffff;
  }

  #external-events .report-end { 
    background-color: #0984e3;
    border-color: #0984e3;
    color: #ffffff;
  }

  #external-events .interview { 
    background-color: #00b894;
    border-color: #00b894;
    color: #ffffff;
  }

  #external-events .announcement { 
    background-color: #fd79a8;
    border-color: #fd79a8;
    color: #ffffff;
  }

  .hire {
    background-color: #4a69bd;
    border-color: #4a69bd;
    color: #ffffff;
  }

  /* 토요일 */
  .fc-sat { 
    color:#0000FF; 
    background-color: rgba(0,0,255,0.05);
  }
  /* 일요일 */     
  .fc-sun { 
    color:#FF0000;
    background-color: rgba(255,0,0,0.05) 
  }    

</style>
</head>

<body>
  <%@ include file="includes/header.jsp"%>
  <br/>
  <br/>
  
  <!-- id='wrap'-->
  <div id='wrap'>
    <!-- 마커 이벤트 요소.-->
    <div id='external-events'>
      <h4>마커</h4>

      <div id='external-events-list'>
        <div class='fc-event important'>중요</div>
        <div class='fc-event report-end'>자소서 마감</div>
        <div class='fc-event interview'>면접</div>
        <div class='fc-event announcement'>채용 발표</div>
      </div>

      <h4>채용공고</h4>
      <div id='external-events-list2'>
          <div class='fc-event hire'>채용공고</div>
      </div>  
    </div>

    <!-- 캘린더 생성 -->
    <div id='calendar'></div>
    <div style="clear:both"></div>
    
  </div>
    
<script>
//사람인 데이터 받아오기
var data = ${saraminData};
var currentDate = new Date();

// 사람인 배열
var saramArr = new Array();

// 검색된 회사만큼 반복
for(var i = 0; i < data['jobs']['count']; i++){
	// 접수 시작일
	//1569200400 이거라면 채용시까지.
	var openingTime = data['jobs']['job'][i]['opening-timestamp']
	var hiDate = new Date(openingTime*1000);
	
	var hireDate = "";
	if (openingTime == 1569200400){
		hireDate = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate();
	} else {
		hireDate = (hiDate.getFullYear())+"-"+(hiDate.getMonth()+1) + "-" + hiDate.getDate();
	}
	
	// 접수 마감일 (연-월-일)
	//1988118000000 이거라면 채용시까지
	var exprieationTime = data['jobs']['job'][i]['expiration-timestamp'];
	var exDate = new Date(exprieationTime*1000);
	
	var expireDate = "";
	if (exprieationTime == 1988118000){
		expireDate = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate();
	} else {
		expireDate = (exDate.getFullYear())+"-"+(exDate.getMonth()+1) + "-" + exDate.getDate();
	}
	
	// 회사 이름
	var companyName = data['jobs']['job'][i]['company']['detail']['name'];
	
	// 직무
	var positionTitle = data['jobs']['job'][i]['position']['title'];
	var positionTitleUrl = data['jobs']['job'][i]['url'];
	
	// 사람인 객체
    var saramObj = {};
	
	saramObj.title = companyName;
	saramObj.start = hireDate;
	saramObj.end = expireDate;
	
	saramArr.push(saramObj);
	
} // end of for
	
	// 달력 시작
	document.addEventListener('DOMContentLoaded', function() {
      var Calendar = FullCalendar.Calendar;
      var Draggable = FullCalendarInteraction.Draggable
  
      /* initialize the external events
      -----------------------------------------------------------------*/
      var containerEl = document.getElementById('external-events-list');
      var containerEl2 = document.getElementById('external-events-list2');
  
      // '중요' 이벤트
      new Draggable(containerEl, {
        itemSelector: '.important',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: '#d63031',
            textColor: '#ffffff'
          }
        },
      });

      // '자소서 마감' 이벤트
      new Draggable(containerEl, {
        itemSelector: '.report-end',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: '#0984e3',
            textColor: '#ffffff'
          }
        },
      });

      // '면접' 이벤트
      new Draggable(containerEl, {
        itemSelector: '.interview',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: '#00b894',
            textColor: '#ffffff'
          }
        },
      });
  
      // '채용 발표' 이벤트
      new Draggable(containerEl, {
        itemSelector: '.announcement',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: '#fd79a8',
            textColor: '#ffffff'
          }
        },
      });
      
      // '채용공고' 이벤트
      new Draggable(containerEl2, {
        itemSelector: '.hire',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: '#4a69bd',
            textColor: '#ffffff'
          }
        },
      });
  		
	      console.log(saramArr);
      // 캘린더 관련
      var calendarEl = document.getElementById('calendar');
      var calendar = new Calendar(calendarEl, {
        // 언어 병경
        locale: 'ko',
        // 캘린터 플러그인
        plugins: [ 'interaction', 'dayGrid', 'timeGrid',],
        
        // 커스텀 버튼
        customButtons: {
          saveButton:{
            text: '저장',
            click: function() {
              alert('save click');
            }
          }
        },

        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'saveButton',
          },
        
        editable: true, // 수정 할수 있게끔
        droppable: true, // 드롭기능이 활성화 할수 있는 엘리먼트
        
        // drop 함수
        drop: function(arg) {
        },

        // 캘린터에서 클릭을 했을때 발생하는 핸들러 (callback)
        eventClick: function(info){
            // 클릭을 했을때 요소를 지우는 함수
            info.event.remove();
        },

        // 날짜를 클릭할때 걸리는 핸들러
        dateClick: function(date){
        },

        // 이벤트 보이는 제한 걸기
        eventLimit: true, // for all non-TimeGrid views
        
        events: [
        	{
        		title:'hiih',
        		start:'2019-09-09'
        	}
        	
        ]
        
      });
      // 달력을 렌더링
      calendar.render();

    });

</script>
  
  <%@ include file="includes/footer.jsp"%>
</body>
</html>
