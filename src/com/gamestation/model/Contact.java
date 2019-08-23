package com.gamestation.model;

public class Contact {

	private String messageID;
	private String name;
	private String email;
	private String message;

	public void setMessageID(String messageID) {
		this.messageID = messageID;
	}

	public String getMessageID() {
		return this.messageID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return this.message;
	}

}
