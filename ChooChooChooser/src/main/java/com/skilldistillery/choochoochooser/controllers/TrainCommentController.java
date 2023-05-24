package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.choochoochooser.data.TrainCommentDAO;
import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.TrainComment;
import com.skilldistillery.choochoochooser.entities.User;

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
			RedirectAttributes redir) {
	User userInSession = (User) session.getAttribute("loggedInUser");
	System.out.println(session + "*************************");
	trainCommentDAO.addTrainComment(trainComment, userInSession.getId(), trainId);
	refreshUserInSession(session);
	System.out.println(trainId + "****************************************");
	redir.addFlashAttribute("train", trainDAO.findTrainById(trainId));
		return "redirect:detailsPage";
		
	}
	

}
