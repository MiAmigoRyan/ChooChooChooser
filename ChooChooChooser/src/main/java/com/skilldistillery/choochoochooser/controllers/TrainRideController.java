package com.skilldistillery.choochoochooser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.data.TrainRideDAO;
import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
@Controller
public class TrainRideController {
	
		@Autowired
		private TrainRideDAO trainRideDAO;
		private TrainDAO trainDAO;
		
		@RequestMapping(path="addToRides.do")
		public String addTrainRide(TrainRide ride, int id, Model model) {
			Train train = trainDAO.findTrainById(id);
			model.addAttribute("train", trainRideDAO.addRide(train));
			
			return "UserRides";
			
		}
		
		
}

