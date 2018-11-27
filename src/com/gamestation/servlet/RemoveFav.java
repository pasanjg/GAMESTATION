package com.gamestation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamestation.model.User;
import com.gamestation.service.GameServiceImpl;
import com.gamestation.service.IGameService;

/**
 * Servlet implementation class RemoveFav
 */
@WebServlet("/remove-fav")
public class RemoveFav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFav() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String gameID = request.getParameter("GameID");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");
		
		IGameService iGameService = new GameServiceImpl();
		iGameService.removeFav(user.getUserID(), gameID);
		
		String confirm = "Game removed from Favourites!";
		request.setAttribute("confirm", confirm);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
