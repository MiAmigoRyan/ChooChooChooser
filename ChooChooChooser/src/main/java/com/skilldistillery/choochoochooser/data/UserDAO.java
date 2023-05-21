package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.RidePhoto;
import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

public interface UserDAO {

	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	
	TrainRide addRide (TrainRide userRide);
	
	void removeRide(TrainRide userRide);
	
	List<Train> viewWishlist(Train wishList);
	
	RidePhoto removePhoto(RidePhoto photo);
	RidePhoto addPhoto(RidePhoto photo);
	
	//User removeuser (this is an admin method!)
	//search comments by flags
	//remove coments
	
}
