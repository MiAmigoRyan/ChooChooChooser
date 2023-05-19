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

class EngineTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Engine engine;

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
		engine = em.find(Engine.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		engine = null;
	}

	@Test
	void test_Engine_mapping() {
		assertNotNull(engine);
		assertEquals("Steam Locomotive", engine.getType());
	}

	@Test
	void test_Engine_to_Train_OneToMany_mapping() {
		assertNotNull(engine);
		assertTrue(engine.getTrains().size() > 0);
	}

}
