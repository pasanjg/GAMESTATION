package com.gamestation.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gamestation.conn.DBConnection;
import com.gamestation.model.Game;

public class GameServiceImpl implements IGameService {

	public String getcode(String GameID) {

		Game game1 = new Game();

		String ShowGameQuery = "SELECT code FROM gameurl WHERE GameID = ? ";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(ShowGameQuery);

			ps.setString(1, GameID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				game1.setgamecode(resultSet.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return game1.getgamecode();

	}

	public String loadGameName(String gameID) {

		Game game1 = new Game();

		String getUserQuery = "SELECT gameName FROM games WHERE GameID = ?";

		PreparedStatement ps;

		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getUserQuery);

			ps.setString(1, gameID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				game1.setgameName(resultSet.getString(1));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return game1.getgameName();
	}

	public void addGame(Game game) {

		String addGameQuery = "INSERT INTO game VALUES(?,?,?,?)";
		String addGameURLQuery = "INSERT INTO gameurl VALUES(?,?)";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(addGameQuery);

			ps.setString(1, game.getGameID());
			ps.setString(2, game.getgameName());
			ps.setString(3, game.getcategory());
			ps.setString(4, game.getTag());

			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(addGameURLQuery);

			ps.setString(1, game.getGameID());
			ps.setString(2, game.getgamecode());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void updateGame(Game game) {

		String updateGameQuery = " UPDATE game SET gameName = ?, category = ?, tag = ? WHERE gameID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(updateGameQuery);

			// Assign values to quary
			ps.setString(1, game.getgameName());
			ps.setString(2, game.getcategory());
			ps.setString(3, game.getTag());
			ps.setString(4, game.getGameID());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void removeGame(Game game) {

		String removeGameQuery = "DELETE from games WHERE  gameID = ? and gameName = ?";
		String removeGameURLQuery = "DELETE from gameurl WHERE  gameID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(removeGameQuery);

			ps.setString(1, game.getGameID());
			ps.setString(2, game.getgameName());

			ps.executeUpdate();

			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(removeGameURLQuery);

			ps.setString(1, game.getGameID());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> getGameIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();

		String findIDQuery = "SELECT gameID FROM games";

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

	public ArrayList<Game> searchGame(String search) {

		ArrayList<Game> arrayList = new ArrayList<Game>();

		String searchQuery = "SELECT * FROM games WHERE category LIKE ? OR gameName LIKE ? OR tag LIKE ? GROUP BY gameName";

		PreparedStatement ps;

		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(searchQuery);

			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				Game game = new Game();
				game.setGameID(resultSet.getString(1));
				game.setgameName(resultSet.getString(2));
				game.setcategory(resultSet.getString(3));
				game.setTag(resultSet.getString(4));

				arrayList.add(game);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;
	}

	public ArrayList<Game> listAllGames() {

		ArrayList<Game> arrayList = new ArrayList<Game>();

		String listQuery = "SELECT * FROM games";

		PreparedStatement ps;

		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(listQuery);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				Game game = new Game();
				game.setGameID(resultSet.getString(1));
				game.setgameName(resultSet.getString(2));
				game.setcategory(resultSet.getString(3));

				arrayList.add(game);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;

	}

	public void addToFav(String userID, String gameID) {

		String addFavQuery = "INSERT INTO favourite VALUES(?,?)";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(addFavQuery);

			ps.setString(1, userID);
			ps.setString(2, gameID);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<String> getFav(String userID) {

		ArrayList<String> arrayList = new ArrayList<String>();

		String getFavQuery = "SELECT gameID FROM favourites WHERE userID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getFavQuery);

			ps.setString(1, userID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				arrayList.add(resultSet.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;
	}

	public void removeFav(String userID, String gameID) {

		String removeFavQuery = "DELETE FROM favourites WHERE userID = ? AND gameID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(removeFavQuery);

			ps.setString(1, userID);
			ps.setString(2, gameID);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
