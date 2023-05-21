package com.skilldistillery.choochoochooser.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Route {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String description;
	private String photo;
	
	@ManyToOne
	@JoinColumn(name="start_station_id")
	private Station startStation;

	@ManyToOne
	@JoinColumn(name="end_station_id")
	private Station endStation;
	
	@ManyToOne
	@JoinColumn(name="train_id")
	private Train train;
	
	@ManyToOne
	@JoinColumn(name="region_id")
	private Region region;
	
	public Route() {
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Station getStartStation() {
		return startStation;
	}

	public void setStartStation(Station startStation) {
		this.startStation = startStation;
	}

	public Station getEndStation() {
		return endStation;
	}

	public void setEndStation(Station endStation) {
		this.endStation = endStation;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}
	
	public Region getRegion() {
		return region;
	}
	
	public void setRegion(Region region) {
		this.region = region;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Route [id=");
		builder.append(id);
		builder.append(", description=");
		builder.append(description);
		builder.append(", photo=");
		builder.append(photo);
		builder.append(", startStation=");
		builder.append(startStation);
		builder.append(", endStation=");
		builder.append(endStation);
		builder.append(", train=");
		builder.append(train);
		builder.append(", region=");
		builder.append(region);
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
		Route other = (Route) obj;
		return id == other.id;
	}
	
	
}
