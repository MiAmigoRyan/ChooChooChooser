package com.skilldistillery.choochoochooser.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO{

	//NO transaction begin/commit
	//NO em.close()
	//emf and em are created already :)
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
