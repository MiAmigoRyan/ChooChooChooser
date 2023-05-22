package com.skilldistillery.choochoochooser.data;

import java.util.List;

import com.skilldistillery.choochoochooser.entities.Amenity;

public interface AmenityDAO {

	List<Amenity> listAllAmenities();
	List<Amenity> findAmenity(String keyword);
 	Amenity addAmenity(Amenity amenity);
	Amenity removeAmenity(Amenity amenity);
	Amenity updateAmenity(Amenity amenity);

}
