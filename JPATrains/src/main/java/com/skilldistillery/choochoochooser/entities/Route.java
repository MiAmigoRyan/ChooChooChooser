package com.skilldistillery.choochoochooser.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Route {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	//foreign key!!!*****************
//	@Column(name="region_id")
//	private int regionId;
	private String description;
	private String photo;
	
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Route [id=");
		builder.append(id);
		builder.append(", description=");
		builder.append(description);
		builder.append(", photo=");
		builder.append(photo);
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
