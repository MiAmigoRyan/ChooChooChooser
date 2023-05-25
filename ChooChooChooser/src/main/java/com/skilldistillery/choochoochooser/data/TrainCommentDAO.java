package com.skilldistillery.choochoochooser.data;

import com.skilldistillery.choochoochooser.entities.TrainComment;

public interface TrainCommentDAO {

	TrainComment addTrainComment(TrainComment trainComment, int userId, int trainId);
	

	TrainComment replyTrainComment(TrainComment replyComment, int trainCommentId, int userId);


}
