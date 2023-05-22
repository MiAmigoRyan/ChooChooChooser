package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;

public interface TrainRideDAO {
	
	List<TrainRide> findRidesByUserId(int userId);

	TrainRide addRide(Train trainId);

}
