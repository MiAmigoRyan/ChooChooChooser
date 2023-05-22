package com.skilldistillery.choochoochooser.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Amenity;
import com.skilldistillery.choochoochooser.entities.Train;

@Service
@Transactional
public class AmenityDaoImpl implements AmenityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Amenity> listAllAmenities() {
		String jpql = "SELECT a FROM Amenity a";
		return em.createQuery(jpql, Amenity.class).getResultList();
	}

	@Override
	public List<Amenity> findAmenity(String keyword) {
		String jpql = "SELECT a FROM Amenity a "
					+ "WHERE LOWER(a.type) "
					+ "LIKE LOWER(:keyword)";
		return em.createQuery(jpql, Amenity.class)
				.setParameter("keyword", "%" + keyword + "%")
				.getResultList();
	}

	@Override
	public Amenity addAmenity(Amenity amenity) {
		em.persist(amenity);
		return amenity;
	}

	@Override
	public Amenity removeAmenity(Amenity amenity) {
		Amenity managedAmenity = em.find(Amenity.class, amenity.getId());
		if (managedAmenity != null) {
			em.remove(managedAmenity);
		}
		return managedAmenity;
	}

	@Override
	public Amenity updateAmenity(Amenity amenity) {
		Amenity managedAmenity = em.find(Amenity.class, amenity.getId());
		if (managedAmenity != null) {
			managedAmenity.setType(amenity.getType());
			managedAmenity.setDescription(amenity.getDescription());
		}
		return managedAmenity;
	}

	
}