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

class TrainCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TrainComment trainComment;

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
		trainComment = em.find(TrainComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trainComment = null;
	}

	@Test
	void test_TrainComment_mapping() {
		assertNotNull(trainComment);
	}

}
