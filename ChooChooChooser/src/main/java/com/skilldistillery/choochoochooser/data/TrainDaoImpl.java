package com.skilldistillery.choochoochooser.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;

@Service
@Transactional
public class TrainDaoImpl implements TrainDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Train> findTrainByKeyword(String keyword) {
		String jpql = "SELECT DISTINCT r.train FROM Route r "
				+ "WHERE LOWER (r.region.name) "
				+ 	"LIKE LOWER (:keyword) "
				+ "OR LOWER (r.train.name) "
				+ 	"LIKE LOWER (:keyword) "
				+ "OR LOWER (r.startStation.name) "
				+ 	"LIKE LOWER (:keyword) "
				+ "OR LOWER (r.endStation.name) "
				+ 	"LIKE LOWER (:keyword)";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return trains;
	}

	
	@Override
	public List<Train> listAllTrains() {
		String jpql = "SELECT t FROM Train t";
		List<Train> trains = em.createQuery(jpql, Train.class).getResultList();
		return trains;
	}


	@Override
	public Train removeTrain(Train train) {
		Train managedTrain = em.find(Train.class, train.getId());
		if (managedTrain != null) {
			em.remove(managedTrain);
		}
		return managedTrain;
	}
	
	@Override
	public Train addTrain(Train train) {
		em.persist(train);
		return train;
	}
	
	public Train updateTrain(Train train) {
		Train managedTrain = em.find(Train.class, train.getId());
		if (managedTrain != null) {
			managedTrain.setName(train.getName());
			managedTrain.setDescription(train.getDescription());
			managedTrain.setYearRound(train.getYearRound());
			managedTrain.setPhoto(train.getPhoto());
			managedTrain.setWebsite(train.getWebsite());
			managedTrain.setCreateDate(train.getCreateDate());
			managedTrain.setLastUpdate(train.getLastUpdate());
			managedTrain.setRailGauge(train.getRailGauge());
			managedTrain.setEngine(train.getEngine());
			managedTrain.setUser(train.getUser());
			managedTrain.setRoutes(train.getRoutes());
		}
		return managedTrain;
	}


	@Override
	public Train findTrainById(int id) {
		String jpql = "SELECT t FROM Train t WHERE t.id = :id";
		Train train = em.createQuery(jpql, Train.class)
				.setParameter("id", id)
				.getSingleResult();
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