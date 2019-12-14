package com.gamestation.model;

import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.http.Part;

import com.mysql.jdbc.Blob;

public class Game {
	private String GameID;
	private String gameName;
	private String gamecode;
	private String category;
	private String tag;
	private Part imagePart;
	private String imgDataBase64 = null;

	public void setGameID(String GameID) {
		this.GameID = GameID;
	}

	public String getGameID() {
		return this.GameID;

	}

	public void setGameCode(String gamecode) {
		this.gamecode = gamecode;
	}

	public String getGameCode() {
		return this.gamecode;

	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public String getGameName() {
		return this.gameName;

	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory() {
		return this.category;

	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTag() {
		return this.tag;

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
	
	public void loadImage(Blob image) throws SQLException {

		byte[] imgData = image.getBytes(1, (int) image.length());
		this.imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
	}

}
