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

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_basic_mappings() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
	}

	@Test
	void test_User_to_Train_OneToMany_mappings() {
		assertNotNull(user);
		assertTrue(user.getTrains().size() > 0);
	}
	@Test
	void test_User_to_Train_wishList_ManyToMany_mappings() {
		assertNotNull(user);
		assertTrue(user.getWishList().size() > 0);
	}
	@Test
	void test_User_to_Comment_OneToMany_Mapping() {
		assertNotNull(user);
		assertTrue(user.getTrainComments().size() > 0);
	}
	@Test
	void test_User_to_Ride_OneToMany_Mapping() {
		assertNotNull(user);
		assertTrue(user.getRides().size() > 0);
	}

}
