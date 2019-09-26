package com.bolbas.app.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bolbas.app.dao.MessageRepo;
import com.bolbas.app.model.Message;

@Controller
public class MainController {

	@Autowired
	private MessageRepo messageRepo;
	
	@PostMapping("/add")
	public String add(@RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
		if (text != null && !text.isEmpty() && tag != null && !tag.isEmpty()) {
			Message message = new Message(text, tag);
			messageRepo.save(message);
		}
		Iterable<Message> messages = messageRepo.findAll();
		model.put("messages", messages);
		
		return "main";
	}
	
	@GetMapping("/filter")
	public String getMessgesByTag(@RequestParam String text, Map<String, Object> model) {
		List<Message> messages = messageRepo.findByTag(text);
		
		model.put("messages", messages);
		
		return "main";
	}
	/*
	@GetMapping("/")
	public String getAllMessages() {
		return "main";
	}
	*/
}
