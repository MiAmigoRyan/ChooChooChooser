package com.skilldistillery.choochoochooser.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Train {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="created_by_user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name="engine_id")
	private Engine engine;
	

	@OneToOne
	@JoinColumn(name="rail_gauge_id")
	private RailGauge railGauge;
	
	private String name;
	
	private String photo;
	
	@Column(name = "year_round")
	private Boolean yearRound;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private String description;
	
	private String website;

	public Train() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}

	public RailGauge getRailGauge() {
		return railGauge;
	}
	
	public void setRailGauge(RailGauge railGauge) {
		this.railGauge = railGauge;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Train [id=");
		builder.append(id);
		builder.append(", user=");
		builder.append(user);
		builder.append(", engine=");
		builder.append(engine);
		builder.append(", railGauge=");
		builder.append(railGauge);
		builder.append(", name=");
		builder.append(name);
		builder.append(", photo=");
		builder.append(photo);
		builder.append(", yearRound=");
		builder.append(yearRound);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", lastUpdate=");
		builder.append(lastUpdate);
		builder.append(", description=");
		builder.append(description);
		builder.append(", website=");
		builder.append(website);
		builder.append("]");
		return builder.toString();
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
