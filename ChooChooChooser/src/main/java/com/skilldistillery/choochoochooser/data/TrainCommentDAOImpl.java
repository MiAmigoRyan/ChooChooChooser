package com.skilldistillery.choochoochooser.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.choochoochooser.entities.Train;
import com.skilldistillery.choochoochooser.entities.TrainComment;
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

}
