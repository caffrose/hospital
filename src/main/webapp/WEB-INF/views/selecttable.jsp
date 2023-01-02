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
     /*  navLinkDayClick: function(day) {
    	  alert("눌림!");
    	    
      }, */
      selectable: true,
      selectMirror: true,
      allDaySlot:false,
      locale:"ko",
      slotMinTime: '09:00:00',
      slotMaxTime: '18:00:00',
      validRange: function(currentDate) {
    	  var startDate = new Date(currentDate.valueOf()-1000 * 60 * 60 * 24);
    	    return {
    	      start: startDate
    	    };    
      },
      select: function(arg) {
    	var start = moment(arg.start).format('YYYY/MM/DD HH:mm:ss');
    	var end = moment(arg.end).format('YYYY/MM/DD HH:mm:ss');
    	location.href="./showdoctorandtime?start="+encodeURI(arg.start)+"&end="+encodeURI(arg.end)+"&startFormat="+start+"&endFormat="+end;
        calendar.unselect()
      },      
      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      unselectAuto:true,
      events: 
          
          
          [
              <%ArrayList<countCalendarVo> events = (ArrayList<countCalendarVo>)(request.getAttribute("events"));
             for(countCalendarVo vo : events) {
                if(vo.getCount()<vo.getDoctorcount())
                   continue;
                else {%>
                 {
                    title:'예약 불가능', 
                    start: '<%=vo.getStartDate()%>',
                    end:'<%=vo.getEndDate()%>'
                  },
                <%}%>
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
<div id="divMain" style="min-height:700px;">
	<%@include file="../include/banner.jsp" %>
 	<div id='calendar'></div>
</div>
<%@ include file="../include/footer.jsp" %>	
</body>
</html>
