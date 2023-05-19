package com.skilldistillery.choochoochooser.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="train_comment")
public class TrainComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="reply_comment_id")
	private TrainComment reply;

	@OneToMany(mappedBy="reply")
	private List<TrainComment> replies;

	
	@ManyToOne
	@JoinColumn(name="train_id")
	private Train train;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	public TrainComment() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TrainComment getReply() {
		return reply;
	}

	public void setReply(TrainComment reply) {
		this.reply = reply;
	}

	public List<TrainComment> getReplies() {
		return replies;
	}

	public void setReplies(List<TrainComment> replies) {
		this.replies = replies;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TrainComment [id=");
		builder.append(id);
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TrainComment other = (TrainComment) obj;
		return id == other.id;
	}



}
