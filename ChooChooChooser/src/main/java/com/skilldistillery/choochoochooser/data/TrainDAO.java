package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;

public interface TrainDAO {

	List<Train> listAllTrains();

	List<Train> findTrainByKeyword(String keyword);

	Train findTrainById(int id);
	
	Train addTrain(Train train, int[] amenitiesSelection, int[] engineSelection, int railSelection, int userId);

	Train updateTrain(Train train, int[] engineSelection, int railSelection, int userId, int[] amenitiesSelection);

	boolean removeTrain(int trainId);
}
