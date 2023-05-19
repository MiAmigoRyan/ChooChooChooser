package com.skilldistillery.choochoochooser.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="train_ride")
public class TrainRide {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy="ride")
	public List<RidePhoto> photos;
	
	@OneToOne
	@JoinColumn(name ="train_id")
	public Train train;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public User user;
	
	public TrainRide() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<RidePhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(List<RidePhoto> photos) {
		this.photos = photos;
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
