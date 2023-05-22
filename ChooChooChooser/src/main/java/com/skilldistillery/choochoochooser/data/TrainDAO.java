package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface TrainDAO {

	List<Train> listAllTrains();
		
	List<Train> findTrainByKeyword(String keyword);

	Train removeTrain(Train train);
	Train addTrain(Train train, int[] amenitiesSelection);

	Train findTrainById(int id);
}
//          S T R E T C H  S E A R C H
//	List<Object[]> findUsersAndTrainsByKeyword(String keyword);