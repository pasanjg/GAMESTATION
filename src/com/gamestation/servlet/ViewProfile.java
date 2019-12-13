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
import com.gamestation.service.IUserService;
import com.gamestation.service.UserServiceImpl;

/**
 * Servlet implementation class ViewProfile
 */

@WebServlet("/profile")
public class ViewProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewProfile() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		IUserService iUserService = new UserServiceImpl();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");

		user.setAbout(request.getParameter("about"));

		user = iUserService.addUserAbout(user);

		session.setAttribute("currentSessionUser", user);

		String confirmString = "Profile about updated!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);

	}

}
