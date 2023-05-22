package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.entities.Train;

@Controller
public class TrainController {
	
		@Autowired
		private TrainDAO trainDAO;
		
		@RequestMapping(path = { "/", "home.do" })
		public String listAllTrainsOnHome(Model model) {
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "home";	
		}
		
		@RequestMapping(path= {"trainSearch.do"})
		public String searchTrainByRegionAndName(String keyword, Model model) {
			model.addAttribute("trains", trainDAO.findTrainByKeyword(keyword));
			return "ShowTrains";
		}

		@RequestMapping(path= {"trainSearch.do"})
		public String showTrainDetails(Train trainId, Model model) {
			model.addAttribute("train", trainDAO.findTrainById(trainId));
			return "detailsPage";
		}
		
		@RequestMapping(path = {"addTrain.do"})
		public String addTrain(Train train,int[] amenitiesSelection, Model model) {
			model.addAttribute("train", trainDAO.addTrain(train, amenitiesSelection));
			return "detailsPage";
		}
		
		@RequestMapping(path = "searchById.do")
		public String findTrainById(int id, Model model) {
			model.addAttribute("train", trainDAO.findTrainById(id));
			return "detailsPage";
		}
		
		
		
//		public void refreshUserInSession(HttpSession session) {
//			User userInSession = (User) session.getAttribute("loggedInUser");
//			User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
//			session.setAttribute("loggedInUser", loggedInUser);
//		}
		
}
