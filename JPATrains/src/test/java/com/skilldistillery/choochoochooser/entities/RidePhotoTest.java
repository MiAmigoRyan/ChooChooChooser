package com.skilldistillery.choochoochooser.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RidePhotoTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RidePhoto ridePhoto;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPATrains");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		ridePhoto = em.find(RidePhoto.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ridePhoto = null;
	}

	@Test
	void test_RidePhoto_mapping() {
		assertNotNull(ridePhoto);
	}

	@Test
	void test_RidePhoto_to_TrainRide_ManyToOne_mapping() {
		assertNotNull(ridePhoto);
		assertEquals(1,ridePhoto.getRide().getId());
		assertEquals(1,ridePhoto.getRide().getTrain().getId());
	}

}
