package com.gamestation.service;

import com.gamestation.model.User;
import com.gamestation.conn.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserServiceImpl implements IUserService {

	public void addUser(User user) {

		String addUserQuery = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?)";
		String addUserAccountQuery = "INSERT INTO useraccount VALUES(?,?,?)";

		try {
			// add data to user table
			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(addUserQuery);

			ps.setString(1, user.getUserID());
			ps.setString(2, user.getFirstName());
			ps.setString(3, user.getLastName());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getCountry());
			ps.setString(6, user.getPlatform());
			ps.setString(7, user.getUserName());
			ps.setString(8, user.getEmail());
			ps.setString(9, user.getType());

			ps.executeUpdate();

			// add data to useraccount table
			ps = DBConnection.getDBconnection().prepareStatement(addUserAccountQuery);

			ps.setString(1, user.getUserID());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getPassword());

			ps.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}

	public User updateUser(User user) {

		String updateUserQuery = "UPDATE user "
				+ "SET firstName = ?, lastName = ?, gender = ?, country = ?, platform = ?, email = ? "
				+ "WHERE userID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(updateUserQuery);

			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getCountry());
			ps.setString(5, user.getPlatform());
			ps.setString(6, user.getEmail());
			ps.setString(7, user.getUserID());

			ps.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public User loginUser(User user) {

		ArrayList<User> arrayList = new ArrayList<>();
		String uID = null;

		String loginQuery1 = "SELECT * FROM useraccount WHERE userName = ? AND password = ?";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBconnection().prepareStatement(loginQuery1);

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

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;

	}

	public String getPassword(String userID) {

		String password = null;
		String getPasswordQuery = "SELECT * FROM useraccount WHERE userID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(getPasswordQuery);

			ps.setString(1, userID);

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {

				password = resultSet.getString(3);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return password;
	}

	public void updatePassword(String userID, String password) {

		String updateUserPasswordQuery = "UPDATE useraccount SET password = ? WHERE userID = ?";
		String updateUserRecoveryPasswordQuery = "UPDATE passwordrecovery SET password = ? WHERE userID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(updateUserPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

			ps = DBConnection.getDBconnection().prepareStatement(updateUserRecoveryPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// retrieve user from DB
	public ArrayList<User> getUser(String userID) {

		ArrayList<User> userList = new ArrayList<User>();

		String getUserQuery = "SELECT * FROM user WHERE userID = ?";

		try {

			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(getUserQuery);

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
				user.setEmail(resultSet.getString(8));
				user.setType(resultSet.getString(9));
				userList.add(user);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userList;
	}

	// get user IDs of users who are already registered
	public ArrayList<String> getUserIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String findIDQuery = "SELECT userID FROM user";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBconnection().prepareStatement(findIDQuery);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrayList;
	}

	public void deleteUser(String userID) {

		String deleteUserQuery = "DELETE FROM user WHERE userID = ?";
		String deleteUserAccountQuery = "DELETE FROM useraccount WHERE userID = ?";
		String deleteFavouriteQuery = "DELETE FROM favourite WHERE userID = ?";

		try {

			PreparedStatement ps = DBConnection.getDBconnection().prepareStatement(deleteUserQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

			ps = DBConnection.getDBconnection().prepareStatement(deleteUserAccountQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

			ps = DBConnection.getDBconnection().prepareStatement(deleteFavouriteQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
	}

}
