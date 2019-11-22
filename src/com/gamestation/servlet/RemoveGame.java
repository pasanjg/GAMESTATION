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
import com.gamestation.service.GameServiceImpl;

@WebServlet("/remove-game")
public class RemoveGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveGame() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/removeGame.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Game game = new Game();

		game.setgameName(request.getParameter("gameName"));
		game.setGameID(request.getParameter("gameID"));

		IGameService iGameService = new GameServiceImpl();
		iGameService.removeGame(game);

		String confirmString = "Game removed!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
		dispatcher.forward(request, response);

	}

}
