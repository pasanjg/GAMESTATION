package com.gamestation.model;

import javax.servlet.http.Part;

public class User {

	private String userID;
	private String firstName;
	private String lastName;
	private String gender;
	private String country;
	private String platform;
	private String userName;
	private String password;
	private String email;
	private String type = null;
	private Part image;
	public boolean valid;

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserID() {
		return this.userID;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return this.gender;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountry() {
		return this.country;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getPlatform() {
		return this.platform;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}

	public Part getImage() {
		return image;
	}

	public void setImage(Part image) {
		this.image = image;
	}

	public boolean isValid() {
		return this.valid;
	}

	public void setValid(boolean newValid) {
		this.valid = newValid;
	}
}
