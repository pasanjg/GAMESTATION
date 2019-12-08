package com.gamestation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamestation.model.User;
import com.gamestation.service.IUserService;
import com.gamestation.service.UserServiceImpl;

/**
 * Servlet implementation class ImageUpload
 */
@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215)
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImage() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");
		IUserService iUserService = new UserServiceImpl();
		
		user.setImage(request.getPart("image"));
		
		iUserService.uploadImage(user);
		user = iUserService.getUser(user.getUserID());
		
		session.setAttribute("currentSessionUser", user);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request, response);
		
	}

}
