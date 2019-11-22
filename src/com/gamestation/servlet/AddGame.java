package com.gamestation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestation.model.Game;
import com.gamestation.service.IGameService;
import com.gamestation.util.CommonUtil;
import com.gamestation.service.GameServiceImpl;

@WebServlet("/add-game")
public class AddGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddGame() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addGame.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Game game = new Game();
		IGameService iGameService = new GameServiceImpl();
		String gameID = CommonUtil.generateGameIDs(iGameService.getGameIDs());

		game.setGameID(gameID);
		game.setgameName(request.getParameter("gameName"));
		game.setcategory(request.getParameter("category"));
		game.setTag(request.getParameter("tag"));
		game.setgamecode(request.getParameter("codeTag"));

		iGameService.addGame(game);

		String confirmString = "Game added!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
		dispatcher.forward(request, response);

	}

}
