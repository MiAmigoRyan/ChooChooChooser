package com.skilldistillery.choochoochooser.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.RidePhoto;
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
		String jpql = "SELECT u FROM User u "
				+ "WHERE u.username = :un "
				+ 	"AND u.password = :pw and u.enabled = true";
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
				+ "JOIN FETCH t.users "
				+ "WHERE u.id = :userId";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.getResultList();	
		return trains;
	}

	@Override
	public void addToWishlist(int userId, int trainid) {
		User user = em.find(User.class, userId);
		Train train = em.find(Train.class, trainid);
		user.addWishList(train);
		em.persist(user);
	}

	@Override
	public void removeFromWishlist(int userId, int trainid) {
		User user = em.find(User.class, userId);
		Train train = em.find(Train.class, trainid);
		user.removeWishList(train);
		em.persist(user);
	}

	@Override
	public void removeRide(TrainRide userRide) {
		em.remove(userRide);
	}

	@Override
	public RidePhoto removePhoto(RidePhoto photo) {
		em.remove(photo);
		return null;
	}

	@Override
	public RidePhoto addPhoto(RidePhoto photo) {
		em.persist(photo);
		return null;
	}

	
	
	
	

}
