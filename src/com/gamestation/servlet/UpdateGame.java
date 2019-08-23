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

/**
 * Servlet implementation class upgateGane
 */
@WebServlet("/update-game")
public class UpdateGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateGame() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updateGame.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Game game = new Game();

		game.setGameID(request.getParameter("gameID"));
		game.setgameName(request.getParameter("gameName"));
		game.setTag(request.getParameter("gametag"));
		game.setcategory(request.getParameter("gameCategory"));

		IGameService iGameService = new GameServiceImpl();
		iGameService.updateGame(game);

		String confirmString = "Game updated!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updateGame.jsp");
		dispatcher.forward(request, response);
	}

}
