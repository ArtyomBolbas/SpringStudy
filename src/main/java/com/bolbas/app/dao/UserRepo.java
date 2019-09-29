package com.bolbas.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bolbas.app.model.User;

public interface UserRepo extends JpaRepository<User, Long> {

	User findByUsername(String username);

}
