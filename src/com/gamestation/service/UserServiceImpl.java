package com.gamestation.service;

import com.gamestation.model.User;
import com.gamestation.conn.DBConnection;
import com.gamestation.util.PasswordHash;
import com.mysql.jdbc.Blob;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserServiceImpl implements IUserService {

	public void addUser(User user) {

		user.setPassword(PasswordHash.hashPassword(user.getPassword()));

		String addUserQuery = "INSERT INTO users VALUES(?,?,?,?,?,?,?,?,?,?,?)";

		try {

			// add data to user table
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(addUserQuery);

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
			ps.setString(11, null);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public User updateUser(User user) {

		String updateUserQuery = "UPDATE users "
				+ "SET firstname = ?, lastname = ?, gender = ?, country = ?, platform = ?, email = ? " + "WHERE id = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(updateUserQuery);

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

		user.setPassword(PasswordHash.hashPassword(user.getPassword()));

		String loginQuery1 = "SELECT * FROM users WHERE username = ? AND password = ?";

		PreparedStatement ps;

		try {

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(loginQuery1);

			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {

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
				user.setValid(true);

				Blob image = (Blob) resultSet.getBlob(11);

				if (image != null) {
					user.loadImage(image);
				}

				user.setAbout(resultSet.getString(12));

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
		String getPasswordQuery = "SELECT * FROM users WHERE id = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(getPasswordQuery);

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

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(updateUserPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(updateUserRecoveryPasswordQuery);

			ps.setString(1, password);
			ps.setString(2, userID);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// retrieve user from DB
	public User getUser(String userparam) {

		User user = new User();

		String getUserQuery = "SELECT * FROM users WHERE id = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(getUserQuery);

			ps.setString(1, userparam);
			// ps.setString(2, userparam);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				User player = new User();
				player.setUserID(resultSet.getString(1));
				player.setFirstName(resultSet.getString(2));
				player.setLastName(resultSet.getString(3));
				player.setGender(resultSet.getString(4));
				player.setCountry(resultSet.getString(5));
				player.setPlatform(resultSet.getString(6));
				player.setUserName(resultSet.getString(7));
				player.setPassword(resultSet.getString(8));
				player.setEmail(resultSet.getString(9));
				player.setType(resultSet.getString(10));

				Blob image = (Blob) resultSet.getBlob(11);

				if (image != null) {
					player.loadImage(image);
				}

				user = player;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	// get user IDs of users who are already registered
	public ArrayList<String> getUserIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String findIDQuery = "SELECT id FROM users";

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

		String deleteUserQuery = "DELETE FROM users WHERE id = ?";
		String deleteFavouriteQuery = "DELETE FROM favourite WHERE userID = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(deleteUserQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(deleteFavouriteQuery);
			ps.setString(1, userID);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void uploadImage(User user) {

		InputStream inputStream = null; // input stream of the upload file

		String uploadImageQuery = "UPDATE users SET image = ? WHERE id = ?";

		if (user.getImage() != null) {

			// obtains input stream of the upload file
			try {
				inputStream = user.getImage().getInputStream();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(uploadImageQuery);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				ps.setBlob(1, inputStream);
				ps.setString(2, user.getUserID());

				ps.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public User addUserAbout(User user) {

		String addUserAboutQuery = "UPDATE users SET about = ? WHERE id = ?";

		try {

			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(addUserAboutQuery);

			ps.setString(1, user.getAbout());
			ps.setString(2, user.getUserID());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

}
