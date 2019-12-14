package com.gamestation.model;

public class Game {
	private String GameID;
	private String gameName;
	private String gamecode;
	private String category;
	private String tag;

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

}
