package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	private String home(Model model) {
		return "home";
	}

	// adds form from jsp modal register.do to createUser in DAO
	@RequestMapping(path = "register.do")
	private String register(User user, RedirectAttributes redir) {
		redir.addFlashAttribute("loggedInUser", userDAO.createUser(user));
		return "redirect:registered.do";
	}

	// after create account redirects back to home page with user logged in
	@GetMapping(path = "registered.do")
	private String registered() {
		return "UserPage";
	}

	// redirects an exsisting user to user page after login
	@RequestMapping(path = "login.do")
	private String userAccountPage(User user, Model model) {
		model.addAttribute("loggedInUser", 
				userDAO.findByUsernameAndPassword
				(user.getUsername(), user.getPassword()));
		return "UserPage";
	}

	//LOGOUT CURRENT USER
	@GetMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
}
