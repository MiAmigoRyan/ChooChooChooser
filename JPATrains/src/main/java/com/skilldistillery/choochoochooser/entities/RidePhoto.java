package com.skilldistillery.choochoochooser.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ride_photo")
public class RidePhoto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="train_ride_id")
	private TrainRide ride;

	private String photo;
	
	public RidePhoto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TrainRide getRide() {
		return ride;
	}

	public void setRide(TrainRide ride) {
		this.ride = ride;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RidePhoto [id=");
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
		RidePhoto other = (RidePhoto) obj;
		return id == other.id;
	}

}
