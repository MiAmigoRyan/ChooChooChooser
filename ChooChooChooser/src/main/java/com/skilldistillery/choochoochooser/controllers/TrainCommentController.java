package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.choochoochooser.data.TrainCommentDAO;
import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.TrainComment;
import com.skilldistillery.choochoochooser.entities.User;

@Controller
public class TrainCommentController {
	
	@Autowired
	TrainCommentDAO trainCommentDAO;
	@Autowired
	TrainDAO trainDAO;
	@Autowired
	UserDAO userDAO;
	
	public void refreshUserInSession(HttpSession session) {
		User userInSession = (User) session.getAttribute("loggedInUser");
		User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
		session.setAttribute("loggedInUser", loggedInUser);
	}
	
	@RequestMapping(path="addComment.do")
	public String addComment(HttpSession session, 
			TrainComment trainComment, 
			@RequestParam("trainId")int trainId, 
			Model model) {
		
	User userInSession = (User) session.getAttribute("loggedInUser");
	
	System.out.println(session + "*************************");
	
	trainCommentDAO.addTrainComment(trainComment, userInSession.getId(), trainId);
	refreshUserInSession(session);
	
	System.out.println(trainId + "****************************************");
	
	model.addAttribute("train", trainDAO.findTrainById(trainId));
		return "detailsPage";
		
	}
	

}
