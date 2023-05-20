package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface UserDAO {

	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	
	
	List<Train> findTrainByName(String name);
	
	List<Train> findTrainByKeyword(String keyword);
	
	TrainRide addRide (TrainRide userRide);
	
	//User addRideToWishList
	//USER viewWishlist
	//User removeRide
	//User removeRide (this is an admin method!)
	
}
