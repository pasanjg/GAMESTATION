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

	public void setgamecode(String gamecode) {
		this.gamecode = gamecode;
	}

	public String getgamecode() {
		return this.gamecode;

	}

	public void setgameName(String gameName) {
		this.gameName = gameName;
	}

	public String getgameName() {
		return this.gameName;

	}

	public void setcategory(String category) {
		this.category = category;
	}

	public String getcategory() {
		return this.category;

	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTag() {
		return this.tag;

	}

}
