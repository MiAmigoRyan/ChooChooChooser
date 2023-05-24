package com.skilldistillery.choochoochooser.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Amenity;
import com.skilldistillery.choochoochooser.entities.Engine;
import com.skilldistillery.choochoochooser.entities.RailGauge;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.User;

@Service
@Transactional
public class TrainDaoImpl implements TrainDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Train> findTrainByKeyword(String keyword) {
		String jpql = "SELECT DISTINCT r.train FROM Route r "
				+ "WHERE r.train.enabled = true AND LOWER (r.region.name) " + "LIKE LOWER (:keyword) "
				+ "OR LOWER (r.train.name) " + "LIKE LOWER (:keyword) " + "OR LOWER (r.startStation.name) "
				+ "LIKE LOWER (:keyword) " + "OR LOWER (r.endStation.name) " + "LIKE LOWER (:keyword)";
		List<Train> trains = em.createQuery(jpql, Train.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return trains;
	}

	@Override
	public List<Train> listAllTrains() {
		String jpql = "SELECT t FROM Train t WHERE t.enabled = true";
		List<Train> trains = em.createQuery(jpql, Train.class).getResultList();
		return trains;
	}

	@Override
	public boolean removeTrain(int trainId) {
		Train managedTrain = em.find(Train.class, trainId);
		if (managedTrain != null) {
			managedTrain.setEnabled(false);
			return true;
		}
		return false;
	}

	@Override
	public Train addTrain(Train train, int[] amenitiesSelection, int[] engineSelection, int railSelection, int userId) {
		if (amenitiesSelection != null) {
			for (int amenityId : amenitiesSelection) {
				Amenity managedAmenity = em.find(Amenity.class, amenityId);
				train.addAmenity(managedAmenity);
			}
		}
		for (int engineId : engineSelection) {
			Engine managedEngine = em.find(Engine.class, engineId);
			train.addEngine(managedEngine);
		}
		train.setRailGauge(em.find(RailGauge.class, railSelection));
		train.setUser(em.find(User.class, userId));
		em.persist(train);
		return train;
	}

	@Override
	public Train updateTrain(Train train, int[] engineSelection, int railSelection, int userId,
			int[] amenitiesSelection) {
		Train managedTrain = em.find(Train.class, train.getId());
		if (managedTrain != null) {
			managedTrain.setName(train.getName());
			managedTrain.setDescription(train.getDescription());
			managedTrain.setYearRound(train.getYearRound());
			managedTrain.setPhoto(train.getPhoto());
			managedTrain.setWebsite(train.getWebsite());
			managedTrain.setCreateDate(train.getCreateDate());
			managedTrain.setLastUpdate(train.getLastUpdate());
			managedTrain.setRailGauge(em.find(RailGauge.class, railSelection));
			if (engineSelection != null) {
				for (int engineId : engineSelection) {
					Engine managedEngine = em.find(Engine.class, engineId);
					train.addEngine(managedEngine);
				}
			}
			managedTrain.setUser(em.find(User.class, userId));
			if (amenitiesSelection != null) {
				for (int amenityId : amenitiesSelection) {
					Amenity managedAmenity = em.find(Amenity.class, amenityId);
					train.addAmenity(managedAmenity);
				}
			}
			managedTrain.setRoutes(train.getRoutes());

		}
		return managedTrain;
	}

	@Override
	public Train findTrainById(int id) {
		String jpql = "SELECT t FROM Train t WHERE t.enabled = true AND t.id = :id";
		Train train = em.createQuery(jpql, Train.class).setParameter("id", id).getSingleResult();
		return train;
	}
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//               S T R E T C H   G O A L  S E A R C H	
//	@Override 
//	public List<Object[]> findUsersAndTrainsByKeyword(String keyword){
//		String jpql = "SELECT DISTINCT t, u "
//				+ "FROM Train t "
//				+ "JOIN t.user u "
//				+ "JOIN t.route r "
//				+ "WHERE LOWER (r.region.name) "
//				+ 	"LIKE LOWER (:keyword) "
//				+ "OR LOWER (r.train.name) "
//				+ 	"LIKE LOWER (:keyword) "
//				+ "OR LOWER (r.startStation.name) "
//				+ 	"LIKE LOWER (:keyword) "
//				+ "OR LOWER (r.endStation.name) "
//				+ 	"LIKE LOWER (:keyword)"
//				+ "OR LOWER(u.name) "
//				+ "	LIKE LOWER(:keyword)";
//		
//		List<Object[]> searchResult = em.createQuery(jpql, new Class<?>[]{User.class, Train.class})
//				.setParameter("keyword", "%" + keyword + "%")
//				.getResultList();
//		
//		return searchResult;
//
//	}