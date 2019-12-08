package com.gamestation.service;

import com.gamestation.model.User;
import com.gamestation.conn.DBConnection;
import com.gamestation.util.PasswordHash;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserServiceImpl implements IUserService {

	public void addUser(User user) {
		
		user.setPassword(PasswordHash.hashPassword(user.getPassword()));

		String addUserQuery = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?,?)";

		try {
			// add data to user table
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(addUserQuery);

			ps.setString(1, user.getUserID());
			ps.setString(2, user.getFirstName());
			ps.setString(3, user.getLastName());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getCountry());
			ps.setString(6, user.getPlatform());
			ps.setString(7, user.getUserName());
			ps.setString(8, user.getPassword());
			ps.setString(9, user.getEmail());
			ps.setString(10, user.getType());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public User updateUser(User user) {

		String updateUserQuery = "UPDATE user "
				+ "SET firstname = ?, lastname = ?, gender = ?, country = ?, platform = ?, email = ? " + "WHERE id = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(updateUserQuery);

			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getCountry());
			ps.setString(5, user.getPlatform());
			ps.setString(6, user.getEmail());
			ps.setString(7, user.getUserID());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public User loginUser(User user) {

		ArrayList<User> arrayList = new ArrayList<>();
		String uID = null;
		
		user.setPassword(PasswordHash.hashPassword(user.getPassword()));

		String loginQuery1 = "SELECT * FROM user WHERE username = ? AND password = ?";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(loginQuery1);

			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {

				uID = resultSet.getString(1);

				user.setUserID(uID);
				arrayList = getUser(uID);

				for (User player : arrayList) {

					user.setUserName(player.getUserName());
					user.setFirstName(player.getFirstName());
					user.setLastName(player.getLastName());
					user.setGender(player.getGender());
					user.setCountry(player.getCountry());
					user.setPlatform(player.getPlatform());
					user.setEmail(player.getEmail());
					user.setType(player.getType());

					user.setValid(true);

				}

			}

			else {
				user.setValid(false);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;

	}

	public String getPassword(String userID) {

		String password = null;
		String getPasswordQuery = "SELECT * FROM user WHERE id = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getPasswordQuery);

			ps.setString(1, userID);

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {

				password = resultSet.getString(8);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return password;
	}

	public void updatePassword(String userID, String password) {

		String updateUserPasswordQuery = "UPDATE user SET password = ? WHERE id = ?";
		String updateUserRecoveryPasswordQuery = "UPDATE passwordrecovery SET password = ? WHERE id = ?";
		
		password = PasswordHash.hashPassword(password);

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(updateUserPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(updateUserRecoveryPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// retrieve user from DB
	public ArrayList<User> getUser(String userID) {

		ArrayList<User> userList = new ArrayList<User>();

		String getUserQuery = "SELECT * FROM user WHERE id = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getUserQuery);

			ps.setString(1, userID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				User user = new User();
				user.setUserID(resultSet.getString(1));
				user.setFirstName(resultSet.getString(2));
				user.setLastName(resultSet.getString(3));
				user.setGender(resultSet.getString(4));
				user.setCountry(resultSet.getString(5));
				user.setPlatform(resultSet.getString(6));
				user.setUserName(resultSet.getString(7));
				user.setPassword(resultSet.getString(8));
				user.setEmail(resultSet.getString(9));
				user.setType(resultSet.getString(10));
				userList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userList;
	}

	// get user IDs of users who are already registered
	public ArrayList<String> getUserIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String findIDQuery = "SELECT id FROM user";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(findIDQuery);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;
	}

	public void deleteUser(String userID) {

		String deleteUserQuery = "DELETE FROM user WHERE id = ?";
		String deleteFavouriteQuery = "DELETE FROM favourite WHERE userID = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(deleteUserQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(deleteFavouriteQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
