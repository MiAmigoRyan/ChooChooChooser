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

class TrainTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Train train;

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
		train = em.find(Train.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		train = null;
	}

	@Test
	void test_Train_basic_mappings() {
		assertNotNull(train);
		assertEquals("Georgetown Loop Railroad", train.getName());
	}
	
	@Test
	void test_Train_to_RailGauge_OneToOne_Mapping() {
		assertNotNull(train);
		assertEquals("Narrow Gauge", train.getRailGauge().getType());
	}
}
