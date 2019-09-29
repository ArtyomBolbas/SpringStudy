package com.bolbas.app.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bolbas.app.dao.UserRepo;
import com.bolbas.app.model.Role;
import com.bolbas.app.model.User;

@Controller
public class RegistrationController {

	@Autowired
	private UserRepo userRepo;

	@GetMapping("/registration")
	public String showRegistrationPage() {
		return "registration";
	}

	@PostMapping("/registration")
	public String addUser(User user, Map<String, Object> model) {
		if(user.getUsername().isEmpty()) {
			model.put("message", "Field 'user name' is empty!");
			return "registration";
		} else if(user.getPassword().isEmpty()) {
			model.put("message", "Field 'password' is empty!");
			return "registration";
		}
		User userFromDB = userRepo.findByUsername(user.getUsername());
		if (userFromDB != null) {
			model.put("message", "User exists");
			return "registration";
		} else {
			user.setActive(true);
			user.setRoles(Collections.singleton(Role.USER));
			userRepo.save(user);
			return "redirect:/login";
		}
	}

}
