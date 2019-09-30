package com.bolbas.app.controller;

import java.util.List;

import java.util.Map;

import javax.swing.text.StyledEditorKit.ItalicAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bolbas.app.dao.MessageRepo;
import com.bolbas.app.model.Message;
import com.bolbas.app.model.User;

@Controller
public class MainController {

	@Autowired
	private MessageRepo messageRepo;

	@GetMapping("/main")
	public String main(Map<String, Object> model) {
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

	@PostMapping("/main")
	public String add(
			@AuthenticationPrincipal User user,
			@RequestParam String text, 
			@RequestParam String tag, 
			Map<String, Object> model) {
		if (text != null && !text.isEmpty() && tag != null && !tag.isEmpty()) {
			Message message = new Message(text, tag, user);
			messageRepo.save(message);
		}
		Iterable<Message> messages = messageRepo.findAll();
		model.put("messages", messages);

		return "main";
	}

}
