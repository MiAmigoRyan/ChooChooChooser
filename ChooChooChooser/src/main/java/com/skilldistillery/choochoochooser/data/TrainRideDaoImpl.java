package com.skilldistillery.choochoochooser.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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
		String jpql = "SELECT tr FROM TrainRide tr WHERE tr.enabled = true AND tr.user = :id";
		List<TrainRide> rides = em.createQuery(jpql, TrainRide.class)
				.setParameter("id", userId)
				.getResultList();
		return rides;
	}
	@Override
	public TrainRide findRideById(int trainRideId) {
		String jpql = "SELECT tr FROM TrainRide tr WHERE tr.id = :id";
		TrainRide ride = null;
		try {
			ride = em.createQuery(jpql, TrainRide.class)
					.setParameter("id", trainRideId)
					.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ride;
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

	@Override
	public boolean removeFromRiddenList(User user,int trainRideId, TrainRide trainRide) {
		TrainRide managedTrainRide =  em.find(TrainRide.class, trainRideId);
		if(managedTrainRide != null) {
			managedTrainRide.setEnabled(false);
			return true;
		}
		return false;
		
	}
}
