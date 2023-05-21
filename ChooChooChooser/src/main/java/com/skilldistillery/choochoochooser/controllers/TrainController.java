package com.skilldistillery.choochoochooser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.choochoochooser.data.TrainDAO;
@Controller
public class TrainController {
	
		@Autowired
		private TrainDAO trainDAO;
		
		@GetMapping(path="allTrains.do")
		public String listAllTrains(Model model) {
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "ShowTrains";	
		}
		
}
