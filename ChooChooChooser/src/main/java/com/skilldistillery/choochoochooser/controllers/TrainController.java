package com.skilldistillery.choochoochooser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.choochoochooser.data.TrainDAO;
@Controller
public class TrainController {
	
		@Autowired
		private TrainDAO trainDAO;
		
		@RequestMapping(path = { "/", "home.do" })
		public String listAllTrainsOnHome(Model model) {
			model.addAttribute("trainList", trainDAO.listAllTrains());
			return "home";	
		}
		
		
//		private String home(Model model) {
//			return "home";
//		}
		
}
