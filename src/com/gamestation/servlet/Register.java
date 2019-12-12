package com.gamestation.servlet;

import com.gamestation.model.User;
import com.gamestation.service.IUserService;
import com.gamestation.service.UserServiceImpl;
import com.gamestation.util.GenerateID;
//import com.gamestation.util.DBQuery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Register() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");

		if (request.getAttribute("delete_confirm") != null) {

			session.invalidate();

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatcher.forward(request, response);

		}

		if (user != null) {

			response.sendRedirect("index.jsp");

		}

		else {

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatcher.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = new User();
		IUserService iUserService = new UserServiceImpl();
		String userID = GenerateID.generateUserIDs(iUserService.getUserIDs());

		user.setUserID(userID);
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setGender(request.getParameter("gender"));
		user.setCountry(request.getParameter("country"));
		user.setPlatform(request.getParameter("platform"));
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password1"));
		user.setEmail(request.getParameter("email"));
		user.setType("user");

		iUserService.addUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("currentSessionUser", user);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewUser.jsp");
		dispatcher.forward(request, response);

	}

}
