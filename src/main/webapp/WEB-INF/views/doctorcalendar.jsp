<%@page import="com.yg.vo.calendarVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.vo.countCalendarVo"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/lib/main.css' rel='stylesheet' />
<script src='resources/lib/main.js'></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
       
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      allDaySlot:false,
      locale:"ko",
      slotMinTime: '09:00:00',
      slotMaxTime: '18:00:00',
      select: function(arg) {
         var start = moment(arg.start).format('YYYY-MM-DD HH:mm:ss');
          var end = moment(arg.end).format('YYYY-MM-DD HH:mm:ss');
          if (confirm('일정을 추가하시겠습니까?')) {
              $(document).ready(function(){
                  ajax_delete();   
               });
              function ajax_delete(){
                 var data1={
                           doctorNum: ${doctorNum},
                        title: '의사일정',
                        start: start,
                        end: end,
                       }
                  $.ajax({
                     url:'http://192.168.6.88:8080/project3/rest/blockdoctortime',
                     type:'post',
                     data:JSON.stringify(data1),
                     dataType: 'json',
                   contentType: 'application/json',
                     success: function(response){
                         
                         //location.href="./showdoctorcalendar";
                         location.reload();
                     },
                     error: function(){
                        alert("에러!");
                  
                     }
                  });
               }
            }
           
        calendar.unselect();
        //$("#calendar").fullCalendar( ‘renderEvent’, event [, true ] );
        //$("#calendar").fullCalendar( ‘rerenderEvents’ );
        },
      eventClick: function(arg) {
           var start = moment(arg.event.start).format('YYYY-MM-DD HH:mm:ss');
             var end = moment(arg.event.end).format('YYYY-MM-DD HH:mm:ss');
             var title=arg.event.title;
             if(title!='의사일정') {
           location.href="./showpatientinfotodoctor?&startFormat="+start+"&endFormat="+end+"&doctorNum2="+${doctorNum};
             }
      },  
      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: 
          
          
          [
              <%ArrayList<calendarVo> events = (ArrayList<calendarVo>)(request.getAttribute("events"));
             for(calendarVo vo : events) {
                %>
                 {
                    title:'<%=vo.getTitle()%>', 
                    start: '<%=vo.getStartDate()%>',
                    end:'<%=vo.getEndDate()%>',
       				<%if(vo.getTitle().equals("의사일정")){
       					%>
       					backgroundColor:'#9c2a08'
       				<%}%>
                  },
                   
                <%}%>
         ]

    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>