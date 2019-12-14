package com.gamestation.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gamestation.conn.DBConnection;
import com.gamestation.model.Game;

public class GameServiceImpl implements IGameService {

	public String getCode(String GameID) {

		Game game1 = new Game();

		String ShowGameQuery = "SELECT code FROM games WHERE gameID = ? ";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(ShowGameQuery);

			ps.setString(1, GameID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				game1.setGameCode(resultSet.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return game1.getGameCode();

	}

	public Game loadGame(String gameCode) {

		Game game = new Game();

		String getUserQuery = "SELECT * FROM games WHERE code = ?";

		PreparedStatement ps;

		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getUserQuery);

			ps.setString(1, gameCode);

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {
				game.setGameID(resultSet.getString(1));
				game.setGameName(resultSet.getString(2));
				game.setCategory(resultSet.getString(3));
				game.setTag(resultSet.getString(4));
				game.setGameCode(resultSet.getString(5));

			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return game;
	}

	public void addGame(Game game) {

		String addGameQuery = "INSERT INTO games VALUES(?,?,?,?,?)";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(addGameQuery);

			ps.setString(1, game.getGameID());
			ps.setString(2, game.getGameName());
			ps.setString(3, game.getCategory());
			ps.setString(4, game.getTag());
			ps.setString(5, game.getGameCode());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Game getGame(String gameID) {

		Game game = new Game();

		String findIDQuery = "SELECT * FROM games WHERE gameID = ?";

		PreparedStatement ps;
		try {
			ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(findIDQuery);

			ps.setString(1, gameID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				game.setGameID(resultSet.getString(1));
				game.setGameName(resultSet.getString(2));
				game.setCategory(resultSet.getString(3));
				game.setTag(resultSet.getString(4));
				game.setGameCode(resultSet.getString(5));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return game;

	}

	public void updateGame(Game game) {

		String updateGameQuery = " UPDATE games SET gameName = ?, category = ?, tag = ? WHERE gameID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(updateGameQuery);

			ps.setString(1, game.getGameName());
			ps.setString(2, game.getCategory());
			ps.setString(3, game.getTag());
			ps.setString(4, game.getGameID());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void removeGame(Game game) {

		String removeGameQuery = "DELETE from games WHERE  gameID = ? and gameName = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection()
					.prepareStatement(removeGameQuery);

			ps.setString(1, game.getGameID());
			ps.setString(2, game.getGameName());

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
				game.setGameName(resultSet.getString(2));
				game.setCategory(resultSet.getString(3));
				game.setTag(resultSet.getString(4));
				game.setGameCode(resultSet.getString(5));

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
				game.setGameName(resultSet.getString(2));
				game.setCategory(resultSet.getString(3));
				game.setTag(resultSet.getString(4));
				game.setGameCode(resultSet.getString(5));

				arrayList.add(game);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;

	}

	public void addToFav(String userID, String gameID) {

		String addFavQuery = "INSERT INTO favourites VALUES(?,?)";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(addFavQuery);

			ps.setString(1, userID);
			ps.setString(2, gameID);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Game> getFav(String userID) {

		ArrayList<Game> arrayList = new ArrayList<Game>();

		String getFavQuery = "SELECT gameID FROM favourites WHERE userID = ?";

		try {
			PreparedStatement ps = DBConnection.getDBConnectionInstance().getConnection().prepareStatement(getFavQuery);

			ps.setString(1, userID);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				arrayList.add(getGame(resultSet.getString(1)));
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
