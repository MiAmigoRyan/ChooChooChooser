package com.skilldistillery.choochoochooser.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.choochoochooser.data.TrainDAO;
import com.skilldistillery.choochoochooser.entities.Train;

@Controller
public class TrainController {

	@Autowired
	private TrainDAO trainDAO;

	@RequestMapping(path = { "/", "home.do" })
	private String home(Model model) {
		model.addAttribute("trainList", trainDAO.listAllTrains());
		return "home";
	}

	@GetMapping(path = { "trainSearch.do" })
	public String trainsByKeyword(@RequestParam("keyword") String keyword, Model model) {
		List<Train> trains = trainDAO.findTrainByKeyword(keyword);
		model.addAttribute("trains", trains);		
		return "ShowTrains";

	}

}
