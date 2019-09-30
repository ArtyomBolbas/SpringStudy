package com.bolbas.app.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bolbas.app.dao.UserRepo;

@Service
public class UserService  implements UserDetailsService{

	//@Autowired
	private final UserRepo userRepo;
	
	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userRepo.findByUsername(username);
	}

}
