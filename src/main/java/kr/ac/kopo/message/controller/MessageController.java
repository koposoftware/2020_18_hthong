package kr.ac.kopo.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.kopo.message.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	//메시지 전송
	
	@GetMapping("/sendMessage")
	public void sendMessage() {
		System.out.println("check in con");
		messageService.doAction();
	}
}
