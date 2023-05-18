package com.skilldistillery.choochoochooser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.choochoochooser.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping (path = { "/,","home.do"})
	private String home(Model model) {
		return "home";
	}
}