package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.choochoochooser.data.TrainCommentDAO;
import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.Train;
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
	trainCommentDAO.addTrainComment(trainComment, userInSession.getId(), trainId);
	refreshUserInSession(session);
	model.addAttribute("train", trainDAO.findTrainById(trainId));
		return "detailsPage";
		
	}
	@RequestMapping(path="replyComment.do")
	public String replyComment(HttpSession session, 
			TrainComment trainComment, 
			@RequestParam("trainCommentId")int trainCommentId, 
			Model model) {
		User userInSession = (User) session.getAttribute("loggedInUser");
		trainCommentDAO.replyTrainComment(trainComment, trainCommentId, userInSession.getId());
		refreshUserInSession(session);
		model.addAttribute("train", trainDAO.findTrainById(trainComment.getTrain().getId()));
		return "detailsPage";
		
	}
	
	@RequestMapping(path="removeComment.do")
	public String removeComment(HttpSession session, int trainCommentId, Model model) {
		TrainComment managedTrainComment = trainCommentDAO.findTrainCommentById(trainCommentId);
		User userInSession = (User) session.getAttribute("loggedInUser");
		trainCommentDAO.removeTrainComment(trainCommentId);
		refreshUserInSession(session);
		model.addAttribute("train", trainDAO.findTrainById(managedTrainComment.getTrain().getId()));
		return "detailsPage";

	}
	
	
	

}
