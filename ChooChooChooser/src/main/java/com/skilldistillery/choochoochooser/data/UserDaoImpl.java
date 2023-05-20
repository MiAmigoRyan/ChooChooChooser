package com.skilldistillery.choochoochooser.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findByUsernameAndPassword(String username, String password) {
		User user = null;
		String jpql = "Select u from User u where u.username = :un and u.password = :pw and u.enabled = true";
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username)
					.setParameter("pw", password).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid Login");
		}
		return user;
	}

	@Override
	public User createUser(User user) {	
		em.persist(user);
		if(em.contains(user)) {
			return user;
		}	
		return null ;
	}

	@Override
	public TrainRide addRide(TrainRide userRide) {
		em.persist(userRide);
		return userRide;
	}

	@Override
	public List<Train> viewWishlist(Train wishList) {
		String jpql = "SELECT t FROM Train t "
				+ "JOIN t.wishlist wt "
				+ "JOIN wt.user u "
				+ "WHERE u.id = userId";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.getResultList();	
		return trains;
	}
	
	
	
	

}
