package com.yg.project3;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.yg.vo.Message;
import com.yg.vo.OutputMessage;

@Controller
public class EchoController {
	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public OutputMessage send(Message message) throws Exception {
//		System.out.println("message:" + message.getText());
	    String time = new SimpleDateFormat("HH:mm").format(new Date());
	    return new OutputMessage(message.getFrom(), message.getText(), time);
	}
	

}
