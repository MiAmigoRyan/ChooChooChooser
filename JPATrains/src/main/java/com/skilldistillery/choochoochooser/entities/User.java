package com.skilldistillery.choochoochooser.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {
	// ALL ABOARD!!!
	// (. ' )
	// . ')
	// . '
	// ____ ,
	// |DD|____U_
	// |_ |_____|<
	// @--@-@-oo\

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;
	private String password;
	private String description;
	private Boolean enabled;
	private String role;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "profile_photo")
	private String profilePhoto;

	@OneToMany(mappedBy = "user")
	private List<TrainRide> rides;

	@OneToMany(mappedBy = "user")
	private List<TrainComment> trainComments;

	@ManyToMany(mappedBy = "users")
	private List<Train> wishList;

	@OneToMany(mappedBy = "user")
	private List<Train> trains;

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public List<TrainRide> getRides() {
		return rides;
	}

	public void setRides(List<TrainRide> rides) {
		this.rides = rides;
	}

	public List<TrainComment> getTrainComments() {
		return trainComments;
	}

	public void setTrainComments(List<TrainComment> trainComments) {
		this.trainComments = trainComments;
	}

	public List<Train> getWishList() {
		return wishList;
	}

	public void setWishList(List<Train> wishList) {
		this.wishList = wishList;
	}

	public List<Train> getTrains() {
		return trains;
	}

	public void setTrains(List<Train> trains) {
		this.trains = trains;
	}

	public void addTrainRide(TrainRide ride) {
		if (rides == null) {
			rides = new ArrayList<>();
		}
		if (!rides.contains(ride)) {
			rides.add(ride);
			if (ride.getUser() != null) {
				ride.getUser().removeTrainRide(ride);
			}
			ride.setUser(null);
		}
	}

	public void removeTrainRide(TrainRide ride) {
		if (rides != null && rides.contains(ride)) {
			rides.remove(ride);
			ride.setUser(null);
		}
	}

	public void addTrainComment(TrainComment comment) {
		if (trainComments == null) {
			trainComments = new ArrayList<>();
		}
		if (!trainComments.contains(comment)) {
			trainComments.add(comment);
			if (comment.getUser() != null) {
				comment.getUser().removeTrainComment(comment);
			}
			comment.setUser(null);
		}
	}

	public void removeTrainComment(TrainComment comment) {
		if (trainComments != null && trainComments.contains(comment)) {
			trainComments.remove(comment);
			comment.setUser(null);
		}
	}

	public void addWishList(Train train) {
		if (wishList == null) {
			wishList = new ArrayList<>();
		}
		if (!wishList.contains(train)) {
			wishList.add(train);
			train.addUser(this);
		}
	}

	public void removeWishList(Train train) {
		if (wishList != null && wishList.contains(train)) {
			wishList.remove(train);
			train.removeUser(this);
		}
	}

	public void addTrain(Train train) {
		if (trains == null) {
			trains = new ArrayList<>();
		}
		if (!trains.contains(train)) {
			trains.add(train);
			if (train.getUser() != null) {
				train.getUser().removeTrain(train);
			}
			train.setUser(this);
		}
	}

	public void removeTrain(Train train) {
		if (trains != null && trains.contains(train)) {
			trains.remove(train);
			train.setUser(null);
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", description=");
		builder.append(description);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", role=");
		builder.append(role);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", profilePhoto=");
		builder.append(profilePhoto);
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
		User other = (User) obj;
		return id == other.id;
	}

}
