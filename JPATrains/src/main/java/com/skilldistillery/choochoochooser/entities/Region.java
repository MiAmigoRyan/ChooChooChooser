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
public class Region {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	
	@OneToMany(mappedBy= "region")	
	private List<Route> routes;

	public Region() {
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
	
	public List<Route> getRoutes() {
		return routes;
	}

	public void setRoute(List<Route> routes) {
		this.routes = routes;
	}
	
	public void addRoute(Route route) {
		if (routes == null) {
			routes = new ArrayList<>();
		}
		if (!routes.contains(route)) {
			routes.add(route);
			if (route.getRegion() != null) {
				route.getRegion().removeRoute(route);
			}
			route.setRegion(this);
		}
	}

	public void removeRoute(Route route) {
		if (routes != null && routes.contains(route)) {
			routes.remove(route);
			route.setRegion(null);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Region [id=");
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
		Region other = (Region) obj;
		return id == other.id;
	}
	
}
