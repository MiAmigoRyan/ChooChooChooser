package com.skilldistillery.choochoochooser.entities;

import java.time.LocalDate;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "train_ride")
public class TrainRide {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

//	private double averageRating() {
//		if (train == null || train.getUser().getRides().isEmpty()) {
//			return 0.0;
//		}
//
//		int totalRatings = 0;
//		int numberRides = 0;
//		for (TrainRide trainRide : train.getUser().getRides()) {
//			totalRatings += trainRide.getRating();
//			numberRides++;
//		}
//		return (double) totalRatings / numberRides;
//	}
//
//	public double getAverageRating() {
//		return averageRating();
//	}

	private String title;
	private int rating;
	private String content;
	private boolean enabled;

	@Column(name = "ride_date")
	private LocalDate rideDate;

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@OneToOne
	@JoinColumn(name = "train_id")
	private Train train;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "ride")
	private List<RidePhoto> photos;

	public TrainRide() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public LocalDate getRideDate() {
		return rideDate;
	}

	public void setRideDate(LocalDate rideDate) {
		this.rideDate = rideDate;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
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

	public List<RidePhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(List<RidePhoto> photos) {
		this.photos = photos;
	}

	public void addRidePhoto(RidePhoto photo) {
		if (photos == null) {
			photos = new ArrayList<>();
		}
		if (!photos.contains(photo)) {
			photos.add(photo);
			if (photo.getRide() != null) {
				photo.getRide().removeRidePhoto(photo);
			}
			photo.setRide(this);
		}
	}

	public void removeRidePhoto(RidePhoto photo) {
		if (photos != null && photos.contains(photo)) {
			photos.remove(photo);
			photo.setRide(null);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TrainRide [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", rating=");
		builder.append(rating);
		builder.append(", content=");
		builder.append(content);
		builder.append(", rideDate=");
		builder.append(rideDate);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", lastUpdate=");
		builder.append(lastUpdate);
		builder.append(", train=");
		builder.append(train);
		builder.append(", user=");
		builder.append(user);
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
		TrainRide other = (TrainRide) obj;
		return id == other.id;
	}

}
