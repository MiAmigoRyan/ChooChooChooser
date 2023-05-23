package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;

//	@RequestMapping(path = { "/", "home.do" })
//	private String home(Model model) {
//		return "home";
//	}
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

	// redirects an existing user to user page after login
	@GetMapping(path = "login.do")
	private String userAccountPage(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			return "UserPage";
		}
		return "redirect:home.do";
	}

	@PostMapping(path = "login.do")
	private String loginCheck(User user, HttpSession session) {
		User loggedInUser = userDAO.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (loggedInUser != null) {
			session.setAttribute("loggedInUser", loggedInUser);
			return "UserPage";
		}
		return "redirect:home.do";
	}

// LOGOUT USER	
	@GetMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}

	public void refreshUserInSession(HttpSession session) {
		User userInSession = (User) session.getAttribute("loggedInUser");
		User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
		session.setAttribute("loggedInUser", loggedInUser);

	}
	
	@PostMapping(path="addToWishlist.do")
	public String addTrainToWishlist(HttpSession session, User user, @RequestParam("id") int trainId) {
		User userInSession = (User) session.getAttribute("loggedInUser");
		if (userInSession != null) {
			User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
			userDAO.addToWishlist(loggedInUser.getId(), trainId);
			refreshUserInSession(session);
			return "UserPage";
		}
		return "UserPage";
	}
	
	@PostMapping(path="removeFromWishlist.do")
	public String removeTrainFromWishlist(HttpSession session, User user, @RequestParam("id") int trainId) {
		User userInSession = (User) session.getAttribute("loggedInUser");
		if (userInSession != null) {
			User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
			userDAO.removeFromWishlist(loggedInUser.getId(), trainId);
			refreshUserInSession(session);
			return "UserPage";
		}
		return "UserPage";
	}
}
