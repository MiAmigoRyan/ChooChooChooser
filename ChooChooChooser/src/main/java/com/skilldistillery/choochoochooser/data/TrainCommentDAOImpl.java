package com.skilldistillery.choochoochooser.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainComment;
import com.skilldistillery.choochoochooser.entities.TrainRide;
import com.skilldistillery.choochoochooser.entities.User;

@Service
@Transactional
public class TrainCommentDAOImpl implements TrainCommentDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public TrainComment addTrainComment(TrainComment trainComment, int userId, int trainId) {
		User managedUser = em.find(User.class, userId);
		Train managedTrain = em.find(Train.class, trainId);
		trainComment.setTrain(managedTrain);
		trainComment.setUser(managedUser);
		em.persist(trainComment);
		return trainComment;
	}

	@Override
	public TrainComment replyTrainComment(TrainComment replyComment, int trainCommentId, int userId) {
		TrainComment managedTrainComment = em.find(TrainComment.class, trainCommentId);
		User managedReplyingUser = em.find(User.class, userId);
		replyComment.setUser(managedReplyingUser);
		replyComment.setTrain(managedTrainComment.getTrain());
		replyComment.setReply(managedTrainComment);
		managedTrainComment.addReply(replyComment);
		em.persist(replyComment);
		return replyComment;
	}

	@Override
	public boolean removeTrainComment(int trainCommentId) {
		TrainComment managedTrainComment = em.find(TrainComment.class, trainCommentId);
		if (managedTrainComment != null) {
			managedTrainComment.setEnabled(false);
			return true;
		}
		return false;
	}

	@Override
	public TrainComment findTrainCommentById(int id) {
		String jpql = "SELECT tc FROM TrainComment tc WHERE tc.enabled = true AND tc.id = :id";
		TrainComment managedTrainComment = null;
		try {
			managedTrainComment = em.createQuery(jpql, TrainComment.class).setParameter("id", id)
					.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return managedTrainComment;
	}

}
