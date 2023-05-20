package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface UserDAO {

	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	
	TrainRide addRide (TrainRide userRide);
	
	List<Train> viewWishlist(Train wishList);
	
	//User removeuser (this is an admin method!)
	
	//findtrainbyregion
	//search comments by flags
	//remove coments
	//
}
