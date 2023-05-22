package com.skilldistillery.choochoochooser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		@RequestMapping(path = {"addTrain.do"})
		public String addTrain(Train train, Model model) {
			model.addAttribute("train", trainDAO.addTrain(train));
			return "detailsPage";
		}
		
		@RequestMapping("searchById.do")
		public String findTrainById(@RequestParam("id") int id, Model model) {
			model.addAttribute("train", trainDAO.findTrainById(id));
			return "detailsPage";
		}
		
		
}
