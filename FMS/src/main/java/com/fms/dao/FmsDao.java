package com.fms.dao;

import java.util.List;

import com.fms.model.User;

public interface FmsDao {

	List<User> loginCheck(User user);
	
}
