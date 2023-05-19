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

class TrainRideTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TrainRide trainRide;

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
		trainRide = em.find(TrainRide.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trainRide = null;
	}

	@Test
	void test_TrainRide_mapping() {
		assertNotNull(trainRide);
	}

}
