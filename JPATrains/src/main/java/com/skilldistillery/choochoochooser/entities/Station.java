package com.skilldistillery.choochoochooser.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
	
	@OneToMany (mappedBy="startStation")
	public List<Route> startRoutes;

	@OneToMany (mappedBy="endStation")
	public List<Route> endRoutes;

	private String name;
	
	public Station() {	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
