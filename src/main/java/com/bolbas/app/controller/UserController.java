package com.bolbas.app.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bolbas.app.dao.UserRepo;
import com.bolbas.app.model.Role;
import com.bolbas.app.model.User;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

	@Autowired
	private UserRepo userRepo;

	@GetMapping
	public String userList(Model model) {
		model.addAttribute("users", userRepo.findAll());
		return "userList";
	}

	@GetMapping("{user}")
	public String userEditForm(@PathVariable User user, Model model) {
		// в строчке выше (@PathVariable Long id) есть возможность указывать в аннотации
		// @PathVariable сразу @PathVariable User user, Spring будет сразу находить
		// пользователя по полученному id из базы данных
		model.addAttribute("user", user);
		model.addAttribute("roles", Role.values());
		model.addAttribute("userRoles", user.getRoles());
		return "userEdit";
	}
	
	@PostMapping
	public String userSave(
			@RequestParam String userName,
			@RequestParam Map<String, String> form,
			@RequestParam("userId") User user) {
		user.setUsername(userName);
		
		Set<String> roles = Arrays.stream(Role.values())
				.map(Role::name)
				.collect(Collectors.toSet());
		
		user.getRoles().clear();
		
		for(String key: form.keySet()) {
			if(roles.contains(key)) {
				user.getRoles().add(Role.valueOf(key));
			}
		}
		
		userRepo.save(user);
		
		return "redirect:/user";
	}

}
