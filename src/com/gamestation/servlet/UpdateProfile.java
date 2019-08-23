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
 * Servlet implementation class UpdateProfile
 */

@WebServlet("/update-profile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		IUserService iUserService = new UserServiceImpl();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");

		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setGender(request.getParameter("gender"));
		user.setCountry(request.getParameter("country"));
		user.setPlatform(request.getParameter("platform"));
		user.setEmail(request.getParameter("email"));

		user = iUserService.updateUser(user);

		session.setAttribute("currentSessionUser", user);

		String confirmString = "Profile updated!";
		request.setAttribute("confirmString", confirmString);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);

	}

}
