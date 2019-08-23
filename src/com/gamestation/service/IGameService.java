package com.gamestation.service;

import java.util.ArrayList;

import com.gamestation.model.Game;

public interface IGameService {

	public String getcode(String GameID);

	public String loadGameName(String gameID);

	public void addToFav(String userID, String gameID);

	public ArrayList<String> getFav(String userID);

	public void removeFav(String userID, String gameID);

	public ArrayList<String> getGameIDs();

	public void addGame(Game game);

	public void updateGame(Game game);

	public void removeGame(Game game);

	public ArrayList<Game> searchGame(String search);

	public ArrayList<Game> listAllGames();

}
