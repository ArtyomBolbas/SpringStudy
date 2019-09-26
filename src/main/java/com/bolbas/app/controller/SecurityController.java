package com.bolbas.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {

	
	
	
	@GetMapping("/")
	public String getView() {
		return "security";
	}
	
}
