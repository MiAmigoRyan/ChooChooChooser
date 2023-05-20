package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface TrainDAO {

	
	
	List<Train> findTrainByName(String name);
	
	List<Train> findTrainByKeyword(String keyword);
	
	//findtrainbyregion

}
