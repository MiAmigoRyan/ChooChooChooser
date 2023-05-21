package com.skilldistillery.choochoochooser.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Station {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String photo;
	private String features;
	private String street;
	private String city;
	private String state;
	@Column(name="zip_code")
	private String zipCode;
	
	@OneToMany (mappedBy="startStation")
	private List<Route> startRoutes;

	@OneToMany (mappedBy="endStation")
	private List<Route> endRoutes;
	
	public Station() {	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public List<Route> getStartRoutes() {
		return startRoutes;
	}

	public void setStartRoutes(List<Route> startRoutes) {
		this.startRoutes = startRoutes;
	}

	public List<Route> getEndRoutes() {
		return endRoutes;
	}

	public void setEndRoutes(List<Route> endRoutes) {
		this.endRoutes = endRoutes;
	}
	

	public void addStartRoute(Route startRoute) {
		if (startRoutes == null) {
			startRoutes = new ArrayList<>();
		}
		if (!startRoutes.contains(startRoute)) {
			startRoutes.add(startRoute);
			if (startRoute.getStartStation() != null) {
				startRoute.getStartStation().removeStartRoute(startRoute);
			}
			startRoute.setStartStation(this);
		}
	}
	
	public void removeStartRoute(Route startRoute) {
		if (startRoutes != null && startRoutes.contains(startRoute)) {
			startRoutes.remove(startRoute);
			startRoute.setStartStation(null);
		}
	}
	
	public void addEndRoute(Route endRoute) {
		if (endRoutes == null) {
			endRoutes = new ArrayList<>();
		}
		if (!endRoutes.contains(endRoute)) {
			endRoutes.add(endRoute);
			if (endRoute.getEndStation() != null) {
				endRoute.getEndStation().removeEndRoute(endRoute);
			}
			endRoute.setEndStation(this);
		}
	}
	
	public void removeEndRoute(Route endRoute) {
		if (endRoutes != null && startRoutes.contains(endRoute)) {
			endRoutes.remove(endRoute);
			endRoute.setEndStation(null);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Station [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", street=");
		builder.append(street);
		builder.append(", city=");
		builder.append(city);
		builder.append(", state=");
		builder.append(state);
		builder.append(", zipCCode=");
		builder.append(zipCode);
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
		Station other = (Station) obj;
		return id == other.id;
	}
	
}
