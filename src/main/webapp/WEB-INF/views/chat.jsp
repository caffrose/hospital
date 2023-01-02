<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" pageEncoding="UTF-8" %>
<html>
    <head>
        <title>Chat WebSocket</title>
        
        <script src="<c:url value="/resources/js/sockjs-0.3.4.js" />"></script>
        <script src="<c:url value="/resources/js/stomp.js" />"></script>
        <script type="text/javascript">
           var my_name = null;
            var stompClient = null;
             
            function setConnected(connected) {
                document.getElementById('connect').disabled = connected;
                /* if(connected==false){                
                   document.getElementById('connect').style.backgroundcolor="#2f62a7";
                   document.getElementById('connect').style.color="white";
                   document.getElementById('connect').style.bordercolor="white";
                }else{
                   document.getElementById('connect').style.backgroundcolor="";
                   document.getElementById('connect').style.color="";
                   document.getElementById('connect').style.bordercolor="";
                } */
                document.getElementById('disconnect').disabled = !connected;
                document.getElementById('conversationDiv').style.visibility 
                  = connected ? 'visible' : 'hidden';
                document.getElementById('response').innerHTML = '';
            }
             
            function connect() {
                var socket = new SockJS('/project3/chat');
                stompClient = Stomp.over(socket);  
                stompClient.connect({}, function(frame) {
                    setConnected(true);
                    console.log('Connected: ' + frame);
                    stompClient.subscribe('/topic/messages', function(messageOutput) {
                        //alert("messageOutput.body:"+JSON.parse(messageOutput.body));
                        //alert("messageOutput.body:"+messageOutput.body);
                        var str = '{"Name":"SooYoung","Age":"29"}';
                  var str2 = messageOutput.body;
                  //alert("str:" + JSON.parse(str).Age)
//                        alert("str2:"+ JSON.parse(messageOutput.body).message);   // undefined.
                        showMessageOutput(JSON.parse(messageOutput.body));
                    });
                });
            }
             
            function disconnect() {
                setConnected(false);
                if(stompClient != null) {
                    stompClient.disconnect();
                }
                console.log("Disconnected");
            }
             
            function sendMessage() {
                var from = document.getElementById('from').value;
                my_name = from;
                var text = document.getElementById('text').value;
                stompClient.send("/app/chat", {}, 
                  JSON.stringify({'from':from, 'text':text}));
            }
             
            function showMessageOutput(messageOutput) {
//                alert("messageOutput.text:" + messageOutput.text);
                var response = document.getElementById('response');
                var p = document.createElement('p');
                p.style.wordWrap = 'break-word';
                p.style.backgroundcolor = 'white';
                if(messageOutput.from == my_name) {
                   p.style.textAlign = "right";
                } else {
                    p.style.textAlign = "left";
               p.style.backgroundColor = "#ecec4f";
               p.style.overflow = "auto";
               p.style.width = "300px";
               p.style.borderRadius = "11px";
               p.style.boxShadow = "5px 2px 2px #7f7f7f";
               messageOutput.message = " " + messageOutput.message;
                }
                p.appendChild(document.createTextNode("  " + messageOutput.from + "\n " 
                  + messageOutput.message /* + " (" + messageOutput.time + ")" */));
                response.appendChild(p);
                response.style="white-space: pre;";
                document.getElementById('p').style.backgroundcolor="#2f62a7";
            }


        </script>
    <style>
       #div1{
          margin:10px auto;
          width:300px;
          height:300px;
          text-align:center;
          padding-top:20px;
       }
       #from{
          width:200px;
          height:30px;
          /* border-radius:5px;
          border-color:red; */
          border: 2px solid #2f62a7;
          border-radius:5px;
          outline:none;
       }

       #text{
          width:400px;
          height:40px;
          border-color:;
       }
       #sendMessage{
          width:70px;
          height:30px;
          border-color:#FFEB32;
          border-radius:5px;
          color:black;
          background-color:#FFEB32;
       }
       #div2{
          width:460px;
          height:500px;
          font:bold;
          margin-left:-80px;
          /* text-align:right; */
          overflow: auto;
          
         }
       #connect {
          width:80px;
          height:30px;
          border-radius:5px;
       }
       #disconnect{
          width:80px;
          height:30px;
          border-radius:5px;
       }
       #conversationDiv{
          width:500px;
          margin-left:-100px;
       }
       #container{
          width:500px;
          height:700px;
          margin:auto;
          border:2px solid #2f62a7;
          border-radius:10px;
          background-color:#B2C7DA;
          word-wrap:break-word;
       }
       #response{
       }
       
       
    </style>
    </head>
    <body onload="disconnect()">
    <div id="container">
        <div id="div1">
            <div>
                <input type="text" id="from" placeholder="이름을 입력해주세요"/>
            </div>
            <br />
            <div>
                <button id="connect" onclick="connect();">연결하기</button>
                <button id="disconnect" disabled="disabled" onclick="disconnect();">
                    연결끊기
                </button>
            </div>
            <br />
            <div id="div2"><p id="response"></p></div>
            <div id="conversationDiv">
                <input type="text" id="text" placeholder="메시지를 작성하세요"/>
                <input type="button" id="sendMessage" onclick="sendMessage();" value="보내기"/>
                
            </div>
        </div>
    </div>   
    </body>
</html>