package com.bolbas.app.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bolbas.app.model.Message;

public interface MessageRepo extends CrudRepository<Message, Long> {

	List<Message> findByTag(String tag);
	
}
