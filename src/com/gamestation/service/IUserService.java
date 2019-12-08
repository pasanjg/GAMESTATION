package com.gamestation.service;

import java.util.ArrayList;
import com.gamestation.model.User;

public interface IUserService {

	public void addUser(User user);

	public User updateUser(User user);

	public User loginUser(User user);

	public String getPassword(String userID);

	public void updatePassword(String userID, String password);

	public User getUser(String userID);

	public ArrayList<String> getUserIDs();

	public void deleteUser(String userID);

	public void uploadImage(User user);
}
