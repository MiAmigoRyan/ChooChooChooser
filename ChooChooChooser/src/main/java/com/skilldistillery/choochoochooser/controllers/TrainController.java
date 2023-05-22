package com.skilldistillery.choochoochooser.controllers;

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
		
}
