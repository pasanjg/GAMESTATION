package com.gamestation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestation.model.Game;
import com.gamestation.service.IGameService;
import com.gamestation.util.GenerateID;
import com.gamestation.service.GameServiceImpl;

@WebServlet("/add-game")
@MultipartConfig(maxFileSize = 16177215)
public class AddGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddGame() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Game game = new Game();
		IGameService iGameService = new GameServiceImpl();
		String gameID = GenerateID.generateGameIDs(iGameService.getGameIDs());

		game.setGameID(gameID);
		game.setGameName(request.getParameter("gameName"));
		game.setCategory(request.getParameter("category"));
		game.setTag(request.getParameter("tag"));
		game.setGameCode(request.getParameter("codeTag"));
		game.setImage(request.getPart("image"));

		iGameService.addGame(game);

		String confirmString = "Game added!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
		dispatcher.forward(request, response);

	}

}
