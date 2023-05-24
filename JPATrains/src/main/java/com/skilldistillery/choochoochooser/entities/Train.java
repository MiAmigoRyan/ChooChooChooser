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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Train {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private String description;
	private String photo;
	private String website;
	private boolean enabled;

	@Column(name = "year_round")
	private Boolean yearRound;
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@OneToOne
	@JoinColumn(name = "rail_gauge_id")
	private RailGauge railGauge;

	@ManyToMany
	@JoinTable(name = "train_engine", 
	joinColumns = @JoinColumn(name = "train_id"),
	inverseJoinColumns = @JoinColumn(name = "engine_id"))
	private List<Engine> engines;

	@ManyToOne
	@JoinColumn(name = "created_by_user_id")
	private User user;

	@OneToMany(mappedBy = "train")
	private List<Route> routes;

	@OneToMany(mappedBy = "train")
	private List<TrainComment> trainComments;

	@ManyToMany
	@JoinTable(name = "wishlist_train", joinColumns = @JoinColumn(name = "train_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

	@ManyToMany
	@JoinTable(name = "train_has_amenities", joinColumns = @JoinColumn(name = "train_id"), inverseJoinColumns = @JoinColumn(name = "amenities_id"))
	private List<Amenity> amenities;

	public Train() {
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

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getYearRound() {
		return yearRound;
	}

	public void setYearRound(Boolean yearRound) {
		this.yearRound = yearRound;
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

	public RailGauge getRailGauge() {
		return railGauge;
	}

	public void setRailGauge(RailGauge railGauge) {
		this.railGauge = railGauge;
	}

	public List<Engine> getEngines() {
		return engines;
	}

	public void setEngines(List<Engine> engines) {
		this.engines = engines;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Route> getRoutes() {
		return routes;
	}

	public void setRoutes(List<Route> routes) {
		this.routes = routes;
	}

	public List<TrainComment> getTrainComments() {
		return trainComments;
	}

	public void setTrainComments(List<TrainComment> trainComments) {
		this.trainComments = trainComments;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Amenity> getAmenities() {
		return amenities;
	}

	public void setAmenities(List<Amenity> amenities) {
		this.amenities = amenities;
	}

	public void addRoute(Route route) {
		if (routes == null) {
			routes = new ArrayList<>();
		}
		if (!routes.contains(route)) {
			routes.add(route);
			if (route.getTrain() != null) {
				route.getTrain().removeRoute(route);
			}
			route.setTrain(this);
		}
	}

	public void removeRoute(Route route) {
		if (routes != null && routes.contains(route)) {
			routes.remove(route);
			route.setTrain(null);
		}
	}

	public void addTrainComment(TrainComment comment) {
		if (trainComments == null) {
			trainComments = new ArrayList<>();
		}
		if (!trainComments.contains(comment)) {
			trainComments.add(comment);
			if (comment.getTrain() != null) {
				comment.getTrain().removeTrainComment(comment);
			}
			comment.setTrain(this);
		}
	}

	public void removeTrainComment(TrainComment comment) {
		if (trainComments != null && trainComments.contains(comment)) {
			trainComments.remove(comment);
			comment.setTrain(null);
		}
	}

	public void addUser(User user) {
		if (users == null) {
			users = new ArrayList<>();
		}
		if (!users.contains(user)) {
			users.add(user);
			user.addWishList(this);
		}
	}

	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.removeWishList(this);
		}
	}
	
	public void addEngine(Engine engine) {
		if (engines == null) {
			engines = new ArrayList<>();
		}
		if (!users.contains(engine)) {
			engines.add(engine);
			engine.addTrain(this);
		}
	}
	
	public void removeEngine(Engine engine) {
		if (engines != null && engines.contains(engine)) {
			engines.remove(engine);
			engine.removeTrain(this);
		}
	}

	public void addAmenity(Amenity amenity) {
		if (amenities == null) {
			amenities = new ArrayList<>();
		}
		if (!amenities.contains(amenity)) {
			amenities.add(amenity);
			amenity.addTrain(this);
		}
	}

	public void removeAmenity(Amenity amenity) {
		if (amenities != null && amenities.contains(amenity)) {
			amenities.remove(amenity);
			amenity.removeTrain(this);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Train [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", description=");
		builder.append(description);
		builder.append(", website=");
		builder.append(website);
		builder.append(", yearRound=");
		builder.append(yearRound);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", lastUpdate=");
		builder.append(lastUpdate);
		builder.append(", railGauge=");
		builder.append(railGauge);
		builder.append(", engine=");
		builder.append(engines);
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
		Train other = (Train) obj;
		return id == other.id;
	}

}
