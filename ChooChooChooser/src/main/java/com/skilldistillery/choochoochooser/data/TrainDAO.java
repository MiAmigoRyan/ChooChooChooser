package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;

public interface TrainDAO {

	List<Train> listAllTrains();

	List<Train> findTrainByKeyword(String keyword);

	Train findTrainById(int id);

	
	Train removeTrain(Train train);

	Train addTrain(Train train, int[] amenitiesSelection, int engineSelection, int railSelection, int userId);

	Train updateTrain(Train train);

}
//          S T R E T C H  S E A R C H
//	List<Object[]> findUsersAndTrainsByKeyword(String keyword);