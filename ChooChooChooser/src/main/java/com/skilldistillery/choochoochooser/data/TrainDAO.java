package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface TrainDAO {

	List<Train> listAllTrains();
		
	List<Train> findTrainByKeyword(String keyword);

	List<Object[]> findUsersAndTrainsByKeyword(String keyword);
	

	

}
