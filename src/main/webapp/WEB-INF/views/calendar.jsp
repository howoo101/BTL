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
    </div>

    <!-- 캘린더 생성 -->
    <div id='calendar'></div>
    <div style="clear:both"></div>
    
  </div>
    
<script>

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
        	id: 'calEvent',
            title: eventEl.innerText.trim(),
            color: '#d63031',
            textColor: '#ffffff',
          }
        },
      });

      // '자소서 마감' 이벤트
      new Draggable(containerEl, {
        itemSelector: '.report-end',
        eventData: function(eventEl) {
          return {
        	id: 'calEvent',
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
        	id: 'calEvent',
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
        	id: 'calEvent',
            title: eventEl.innerText.trim(),
            color: '#fd79a8',
            textColor: '#ffffff'
          }
        },
      });
  		
      // 캘린더 관련
      var calendarEl = document.getElementById('calendar');
      var calendar = new Calendar(calendarEl, {
        // 언어 병경
        locale: 'ko',
		// 이벤트 배열
        
        // 캘린터 플러그인
        plugins: [ 'interaction', 'dayGrid', 'timeGrid',],
        // 커스텀 버튼
        customButtons: {
          clearButton:{
        	  text:'불러오기',
        	  click:function(){
	        	  events = calendar.getEvents();
	        	  events.forEach(function(element){
	        		  element.remove();
	        	  })
        	  
	          
	          // 값 불러오기
      	      $.ajax({
				  type: "POST",
				  url: "calendar/jsonLoad",
				  data: "${user}",
				  dataType: "json",
				  contentType : "application/json; charset=utf-8",
				  
				  success: function(data){
					  var totalEvents = [];
					  // 이메일이 일치하는 애들을 불러와서 event에 등록시켜주기.
					  $.each(data, function(index, item){
						  var loadEvent = []; 
						  // 아이템들을 loadEvents에다가 push 하고,
						  loadEvent.title = item.title;
						  loadEvent.start = item.start;
						  loadEvent.end = item.end;
						  loadEvent.textColor = "#ffffff";
					  		
						  // 단 색을 바꾸는데 채용공고 색과  내가 등록한 이벤트들의 각자 색을 다르게 넣어주기
					      if(item.title == "중요"){
					    	  loadEvent.color = "#d63031";
					      } else if(item.title == "자소서 마감"){
					    	  loadEvent.color = "#0984e3";
					      } else if(item.title == "면접"){
					    	  loadEvent.color = "#00b894";
					      } else if(item.title == "채용 발표"){
					    	  loadEvent.color = "#fd79a8";
					      } else {
					    	  loadEvent.color = "#fdcb6e";
					      }
					      
						  // event에다가 loadevent를 put
						  totalEvents.push(loadEvent);
						  calendar.addEvent(loadEvent);
					  });
					  
				  },
				  error: function(e){
					  Swal.fire({
						  type: 'error',
						  text: '데이터 불러오기에 실패했습니다.',
					})
				  }
		    	}); // end of ajax
        	  
        	  }
        	  
          },
          saveButton:{
            text: '저장',      
            click: function() {
            	// 이벤트 저장할 배열
            	var saveArr = new Array();
            	// 이벤트들 배열로 불러오기
            	events = calendar.getEvents();
            	// 이벤트별 타이틀, start, end 값들을 json에다가 넣기.
            	events.forEach(function(element){
	            	var saveEvent = {};
	            	
            		saveEvent.title = element.title;
					
            		// 날짜 형식 맞춰주기 (start)
	            	var startMonth = '';
            		if (element.start.getMonth()+1 < 10){
            			startMonth = '0' + (element.start.getMonth()+1);
            		} else if (element.start.getMonth()+1 >= 10){
            			startMonth = (element.start.getMonth()+1);
            		}
	            	var startDate = '';
	            	if (element.start.getDate() < 10){
	            		startDate = '0' + element.start.getDate();
            		} else if (element.start.getDate() >= 10){
            			startDate = element.start.getDate();
            		}
            		saveEvent.start = element.start.getFullYear() + '-' + startMonth + '-' + startDate;
            		
            		// 날짜 형식 맞춰주기(end)
            		if(!element.end){
            			saveEvent.end = 0;       			
            		} else {
            			
            			var endMonth = '';
                		if (element.end.getMonth()+1 < 10){
                			endMonth = '0' + (element.end.getMonth()+1);
                		} else if (element.end.getMonth()+1 >= 10){
                			endMonth = (element.end.getMonth()+1);
                		}
    	            	var endDate = '';
    	            	if (element.end.getDate() < 10){
    	            		endDate = '0' + element.end.getDate();
                		} else if (element.end.getDate() >= 10){
                			endDate = element.end.getDate();
                		}
            			
	            		saveEvent.end = element.end.getFullYear()+'-'+endMonth+'-'+endDate;
            		}
            		// 현재 접속하고 있는 user 넣기
            		saveEvent.useremail = '${user}';
            		// 현재 회사를 넣기.
            		saveEvent.companyname = '${ci_companyName}';
            		saveArr.push(saveEvent);
            	})
            	
            	// ajax로 현재 이벤트 값을 보내주기.
            	$.ajax({
				  type: "POST",
				  url: "calendar/json",
				  data: JSON.stringify(saveArr),
				  contentType : "application/json; charset=utf-8",
				  
				  success: function(msg){
					  Swal.fire({
						  type: 'success',
						  text: '등록에 성공했습니다.',
						})
					  
				  },
                  error : function(request) {
                	  Swal.fire({
                		  type: 'error',
                		  text: '등록에 실패하였습니다.',
                		})
                    if (request.status === 403) {
                      location.href = "logininterceptor";
                    }
                    if (request.status === 404) {
                      location.href = "gradeceptor";
                    }
                  }
            	}); // end of ajax
            	
            } // end of click event
          }
        },
	
        // 달력의 tool bar
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'clearButton saveButton',
          },
        
        editable: true, // 수정 할수 있게끔
        droppable: true, // 드롭기능이 활성화 할수 있는 엘리먼트
        
        // 캘린터에서 클릭을 했을때 발생하는 핸들러 (callback)
        eventClick: function(info){
            // 클릭을 했을때 요소를 지우는 함수
            info.event.remove();
        },

        // 이벤트 보이는 제한 걸기
        eventLimit: true, // for all non-TimeGrid views
        
        // saraminAPI 요청 결과를 이벤트에다가 넣어주기
        events: [
        	<c:forEach items="${jdata}" var="cal" varStatus="status" >
			{
				id: 'calEvent',
        		title:'${cal.title}',
        		start:'${cal.start}',
        		end:'${cal.end}',
        		textColor: '#ffffff',
        		color: '#7ed6df',
        	},
    		</c:forEach>
        ]
        
      });
      // 달력을 렌더링
      calendar.render();

    });

</script>
  
  <%@ include file="includes/footer.jsp"%>
</body>
</html>
