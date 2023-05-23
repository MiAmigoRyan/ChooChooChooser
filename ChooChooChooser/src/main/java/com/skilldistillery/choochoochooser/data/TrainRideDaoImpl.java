package com.skilldistillery.choochoochooser.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

@Service
@Transactional
public class TrainRideDaoImpl implements TrainRideDAO{

	@PersistenceContext
	private EntityManager em;

	
	@Override
	public List<TrainRide> findRidesByUserId(int userId) {
		String jpql = "SELECT tr FROM TrainRides tr WHERE tr.user = :id";
		List<TrainRide> rides = em.createQuery(jpql, TrainRide.class)
				.setParameter("id", userId)
				.getResultList();
		return rides;
	}
	
	@Override
	public void createTrainRide(User user, int trainId, TrainRide trainRide) {
		Train train = em.find(Train.class, trainId);
		trainRide.setTrain(train);
		trainRide.setUser(user);
		em.persist(trainRide);
		
	}
	
	@Override
	public void fromWishlistToRiddenList(User user, int trainId, TrainRide trainRide) {
		Train train = em.find(Train.class, trainId);
		trainRide.setTrain(train);
		trainRide.setUser(user);
		
		em.persist(trainRide);
		
		user.removeWishList(train);
		
		
	}
}