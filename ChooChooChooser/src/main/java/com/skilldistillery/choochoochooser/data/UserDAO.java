package com.skilldistillery.choochoochooser.data;

import com.skilldistillery.choochoochooser.entities.User;

public interface UserDAO {

	User findByUsernameAndPassword(String username, String password);
	
}
