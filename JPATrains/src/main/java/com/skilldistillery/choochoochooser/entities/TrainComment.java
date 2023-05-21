package com.skilldistillery.choochoochooser.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "train_comment")
public class TrainComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String comment;

	@Column(name = "comment_date")
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "train_id")
	private Train train;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "reply_comment_id")
	private TrainComment reply;

	@OneToMany(mappedBy = "reply")
	private List<TrainComment> replies;

	public TrainComment() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public void addReply(TrainComment reply) {
		if (replies == null)
			replies = new ArrayList<>();
		if (!replies.contains(reply)) {
			replies.add(reply);
			if (reply.getReply() != null) {
				reply.getReply().removeReply(reply);
			}
			reply.setReply(this);
		}
	}

	public void removeReply(TrainComment reply) {
		if (replies != null && replies.contains(reply)) {
			replies.remove(reply);
			reply.setReply(null);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TrainComment [id=");
		builder.append(id);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", commentDate=");
		builder.append(commentDate);
		builder.append(", train=");
		builder.append(train);
		builder.append(", user=");
		builder.append(user);
		builder.append(", reply=");
		builder.append(reply);
		builder.append("]");
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
