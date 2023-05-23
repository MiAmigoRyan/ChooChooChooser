package com.skilldistillery.choochoochooser.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.data.UserDAO;
import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.User;

@Controller
public class TrainController {
	
		@Autowired
		private TrainDAO trainDAO;
		@Autowired
		private UserDAO userDAO;
		
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

		@RequestMapping(path = {"addTrain.do"})
		public String addTrain(Train train,int[] amenitiesSelection,
				@RequestParam("engineSelection")int engineSelection,
				@RequestParam("railSelection")int railSelection,
				HttpSession session,
//				@RequestParam("createdById")int userId, 
				Model model) {
			User userInSession = (User) session.getAttribute("loggedInUser");
			model.addAttribute("train", trainDAO.addTrain(train, amenitiesSelection, engineSelection, railSelection, userInSession.getId()));
			return "detailsPage";
		}
		
		@RequestMapping("searchById.do")
		public String findTrainById(@RequestParam("id") int id, Model model) {
			model.addAttribute("train", trainDAO.findTrainById(id));
			return "detailsPage";
		}
			
		public void refreshUserInSession(HttpSession session) {
			User userInSession = (User) session.getAttribute("loggedInUser");
			User loggedInUser = userDAO.findByUsernameAndPassword(userInSession.getUsername(), userInSession.getPassword());
			session.setAttribute("loggedInUser", loggedInUser);
		}
		
		@RequestMapping(path="removeTrain.do")
		public String removeTrain(Model model, Train train) {
			trainDAO.removeTrain(train);
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "DisplayAllTrains";
			
		}
		
		@RequestMapping(path="updateTrain.do")
		public String updateTrain(HttpSession session ,Model model, Train train,
					@RequestParam("engineSelection")int engineSelection,
					@RequestParam("railSelection")int railSelection,
					int[] amenitiesSlection) {
			User userInSession = (User) session.getAttribute("loggedInUser");
			trainDAO.updateTrain(train, engineSelection, railSelection, userInSession.getId(), amenitiesSlection);
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "DisplayAllTrains";
		}
		
		@RequestMapping(path = { "displayAllTrains.do" })
		public String listAllTrains(Model model) {
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "DisplayAllTrains";	
		}

}
