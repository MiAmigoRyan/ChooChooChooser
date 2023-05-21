package com.skilldistillery.choochoochooser.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Amenity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String type;
	private String description;

	@ManyToMany(mappedBy = "amenities")
	private List<Train> trains;

	public Amenity() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Train> getTrains() {
		return trains;
	}

	public void setTrains(List<Train> trains) {
		this.trains = trains;
	}

	public void addTrain(Train train) {
		if (trains == null) {
			trains = new ArrayList<>();
		}
		if (!trains.contains(train)) {
			trains.add(train);
			train.addAmenity(this);
		}
	}

	public void removeTrain(Train train) {
		if (trains != null && trains.contains(train)) {
			trains.remove(train);
			train.removeAmenity(this);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Amenity [id=");
		builder.append(id);
		builder.append(", type=");
		builder.append(type);
		builder.append(", description=");
		builder.append(description);
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
		Amenity other = (Amenity) obj;
		return id == other.id;
	}

}
