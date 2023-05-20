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
		String jpql = "SELECT t FROM Train t WHERE t.name LIKE :keyword";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.setParameter("keyword", keyword)
				.getResultList();
		return trains;
	}

	@Override
	public List<Train> findTrainByName(String name) {
		String jpql = "SELECT t FROM Train t WHERE t.name = :name";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.setParameter("name", name)
				.getResultList();
		return trains;
	}

	@Override
	public List<Train> findTrainByRegion(String region) {
		String jpql = "SELECT t FROM Train t WHERE t.region = :region";
		List<Train> trains = em.createQuery(jpql, Train.class)
				.setParameter("name", region)
				.getResultList();
		return trains;
	}
}
