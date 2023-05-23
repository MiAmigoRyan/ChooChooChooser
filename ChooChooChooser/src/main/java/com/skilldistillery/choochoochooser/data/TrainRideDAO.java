package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface TrainRideDAO {
	
	List<TrainRide> findRidesByUserId(int userId);

	void createTrainRide(User user, int trainId, TrainRide trainRide);

	void fromWishlistToRiddenList(User user, int trainId, TrainRide trainRide);

}
