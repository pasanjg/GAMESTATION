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
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/update-password")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePassword() {
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

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");

		IUserService iuserService = new UserServiceImpl();

		String userID = user.getUserID();
		String currentPassword = request.getParameter("currentPassword");
		String getPassword = iuserService.getPassword(userID);
		String newPassword = request.getParameter("password1");

		if (getPassword.equals(currentPassword)) {

			iuserService.updatePassword(userID, newPassword);

			String confirmString = "Password changed!";
			request.setAttribute("confirmString", confirmString);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
			dispatcher.forward(request, response);

		}

		else {

			String errorString = "Current password did not match!";
			request.setAttribute("errorString", errorString);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/settings.jsp");
			dispatcher.forward(request, response);

		}

	}

}
