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
 * Servlet implementation class DeleteProfile
 */
@WebServlet("/delete-profile")
public class DeleteProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");

		IUserService iuserService = new UserServiceImpl();

		String userID = user.getUserID();
		String currentPassword = request.getParameter("password");
		String getPassword = iuserService.getPassword(userID);

		if (getPassword.equals(currentPassword)) {

			iuserService.deleteUser(userID);

			session.invalidate();

			String delete_confirm = "You account has been deleted!";
			request.setAttribute("delete_confirm", delete_confirm);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatcher.forward(request, response);

		}

		else {

			String delete_error = "Current password did not match!";
			request.setAttribute("delete_error", delete_error);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/getProfile.jsp");
			dispatcher.forward(request, response);

		}

	}

}
