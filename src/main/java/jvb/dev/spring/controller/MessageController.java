package jvb.dev.spring.controller;

//import org.springframework.messaging.handler.annotation.DestinationVariable;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.handler.annotation.SendTo;
//
//import jvb.dev.spring.model.Message;
//import jvb.dev.spring.model.OutputMessage;
//
//public class MessageController {
//	@MessageMapping("/chat/{topic}")
//	@SendTo("/topic/messages")
//	public OutputMessage send(
//	        @DestinationVariable("topic") String topic, Message message)
//	        throws Exception {
//	    return new OutputMessage(message.getFrom(), message.getText(), topic, null);
//	}
//
//}
