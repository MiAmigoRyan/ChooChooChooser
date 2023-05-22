package com.skilldistillery.choochoochooser.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;

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
	public TrainRide addRide(Train train) {
		TrainRide newRide = new TrainRide();
		newRide.setTrain(train);
		em.persist(newRide);
		return newRide;
	}


}
