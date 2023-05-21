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

class RegionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Region region;

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
		region = em.find(Region.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		region = null;
	}
	
	@Test
	void test_Region_entity_mapping() {
		assertNotNull(region);
		assertEquals("Rocky Mountains", region.getName());
	}
	
	@Test
	void test_Region_Route_OneToMany_mapping() {
		assertNotNull(region);
		assertTrue(region.getRoutes().size()>0);
	}

}
