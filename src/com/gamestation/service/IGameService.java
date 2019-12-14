package com.gamestation.service;

import java.util.ArrayList;

import com.gamestation.model.Game;

public interface IGameService {

	public String getCode(String GameID);

	public Game loadGame(String gameCode);

	public void addToFav(String userID, String gameID);

	public ArrayList<Game> getFav(String userID);

	public void removeFav(String userID, String gameID);

	public ArrayList<String> getGameIDs();

	public void addGame(Game game);
	
	public Game getGame(String gameCode);

	public void updateGame(Game game);

	public void removeGame(Game game);

	public ArrayList<Game> searchGame(String search);

	public ArrayList<Game> listAllGames();
	
	public void uploadImage(Game game);

}
