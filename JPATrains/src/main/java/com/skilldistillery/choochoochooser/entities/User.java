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
	//     (. '  )
	//       . ')
    //        . '
	// ____    ,
	// |DD|____U_
	// |_ |_____|<
	//  @--@-@-oo\
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToMany(mappedBy="users")
	private List<Train> wishList;
	
	@OneToMany(mappedBy="user")
	private List<Train> trains;
	
	private String username;
	
	private String password;
	
	private Boolean enabled;
	
	private String role;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String description;
	
	@Column(name="profile_photo")
	private String profilePhoto;

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", role=");
		builder.append(role);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", description=");
		builder.append(description);
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
