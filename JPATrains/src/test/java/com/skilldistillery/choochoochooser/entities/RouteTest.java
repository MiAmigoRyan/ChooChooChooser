package com.skilldistillery.choochoochooser.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RouteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Route route;

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
		route = em.find(Route.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		route = null;
	}
	
	@Test
	void test_Route_entity_mapping() {
		assertNotNull(route);
		assertEquals("Georgetown Loop", route.getDescription());
	}

	@Test
	void test_Route_to_Train_ManyToOne_mapping() {
		assertNotNull(route);
		assertEquals(1, route.getTrain().getId());
		assertEquals("Georgetown Loop Railroad", route.getTrain().getName());
	}
	@Test
	void test_Route_to_StartStation_ManyToOne_mapping() {
		assertNotNull(route);
		assertEquals(1, route.getStartStation().getId());
		assertEquals("Georgetown Devil's Gate Station", route.getStartStation().getName());
	}
	
	@Test
	void test_Route_to_EndStation_ManyToOne_mapping() {
		assertNotNull(route);
		assertEquals(1, route.getEndStation().getId());
		assertEquals("Georgetown Devil's Gate Station", route.getEndStation().getName());
	}
	
	

}
