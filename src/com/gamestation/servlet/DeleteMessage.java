package com.gamestation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamestation.service.ContactServiceImpl;
import com.gamestation.service.IContactService;

/**
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/delete-message")
public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteMessage() {
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

		String messageID = request.getParameter("mid");

		IContactService iContactService = new ContactServiceImpl();
		iContactService.deleteMessage(messageID);

		String deleteMsg = "Message deleted!";
		request.setAttribute("deleteMsg", deleteMsg);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/messages.jsp");
		dispatcher.forward(request, response);

	}

}
