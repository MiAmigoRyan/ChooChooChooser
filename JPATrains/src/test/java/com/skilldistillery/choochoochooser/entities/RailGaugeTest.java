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

class RailGaugeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RailGauge railGauge;

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
		railGauge = em.find(RailGauge.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		railGauge = null;
	}

	@Test
	void test_RailGauge_basic_mappings() {
		assertNotNull(railGauge);
		assertEquals("Narrow Gauge", railGauge.getType());
	}

}
