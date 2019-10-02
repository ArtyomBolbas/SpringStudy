package com.bolbas.app.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bolbas.app.dao.MessageRepo;
import com.bolbas.app.model.Message;
import com.bolbas.app.model.User;

@Controller
public class MainController {

	@Autowired
	private MessageRepo messageRepo;
	
	@Value("${upload.path}")
	private String uploadPath;

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
			@RequestParam("file") MultipartFile file,
			Map<String, Object> model) throws IllegalStateException, IOException {
		if (text != null && !text.isEmpty() && tag != null && !tag.isEmpty()) {
			Message message = new Message(text, tag, user);

			if (file != null && !file.getOriginalFilename().isEmpty()) {

				String uuidFile = UUID.randomUUID().toString();
				String resultFileName = uuidFile + "." + file.getOriginalFilename();

				file.transferTo(new File(uploadPath + "/" + resultFileName));

				message.setFilename(resultFileName);
			}

			messageRepo.save(message);
		}
		
		Iterable<Message> messages = messageRepo.findAll();
		model.put("messages", messages);

		return "main";
	}

}



/* File f = new File("program.txt"); 
String absolute = f.getAbsolutePath(); 
File uploadDir = new File(uploadPath);

String path = uploadDir.getAbsolutePath();

if(!uploadDir.exists()) {
	uploadDir.mkdir();
}*/
