package com.bolbas.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bolbas.app.dao.UserRepo;
import com.bolbas.app.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepo userRepo;

	@GetMapping
	public String userList(Model model) {
		model.addAttribute("users", userRepo.findAll());
		return "userList";
	}

	@GetMapping("{user}")
	public String userEditForm(@PathVariable Long id, Model model) {
		// в строчке выше (@PathVariable Long id) есть возможность указывать в аннотации
		// @PathVariable сразу @PathVariable User user, Spring будет сразу находить
		// пользователя по полученному id из базы данных
		model.addAttribute("user", userRepo.findById(id));
		return "userEdit";
	}

}
