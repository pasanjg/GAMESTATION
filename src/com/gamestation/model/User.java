package com.gamestation.model;

import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.http.Part;

import com.mysql.jdbc.Blob;

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
	private String about;
	private String type = null;
	private Part imagePart;
	private String imgDataBase64 = null;
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

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}

	public Part getImage() {
		return imagePart;
	}

	public void setImage(Part imagePart) {
		this.imagePart = imagePart;
	}

	public String getImgDataBase64() {
		return imgDataBase64;
	}

	public void setImgDataBase64(String imgDataBase64) {
		this.imgDataBase64 = imgDataBase64;
	}

	public boolean isValid() {
		return this.valid;
	}

	public void setValid(boolean newValid) {
		this.valid = newValid;
	}

	public void loadImage(Blob image) throws SQLException {

		byte[] imgData = image.getBytes(1, (int) image.length());
		this.imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
	}
}
