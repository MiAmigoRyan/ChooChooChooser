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
public class TrainDaoImpl implements TrainDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Train> findTrainByKeyword(String keyword) {
		String jpql = "SELECT t FROM Train t "
				+ "JOIN t.route r "
				+ "JOIN r.region reg"
				+ "WHERE LOWER (t.name) "
				+ 	"LIKE LOWER (:keyword) "
				+ "OR LOWER (reg.name) "
				+ 	"LIKE LOWER (:keyword)";

		
		
		
		List<Train> trains = em.createQuery(jpql, Train.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return trains;
	}

	@Override
	public List<Train> listAllTrains() {
		String jpql = "SELECT t FROM Train t";
		List<Train> trains = em.createQuery(jpql, Train.class).getResultList();
		return trains;
	}
}
