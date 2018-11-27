package com.gamestation.servlet;

import com.gamestation.model.Contact;
import com.gamestation.service.IContactService;
import com.gamestation.service.ContactServiceImpl;
import com.gamestation.util.CommonUtil;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/contact")
public class ContactInfo extends HttpServlet {
private static final long serialVersionUID = 1L;
       
	
    public ContactInfo() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact.jsp");
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Contact contact = new Contact();
		IContactService iContactService = new ContactServiceImpl();
		String messageID = CommonUtil.generateMessageIDs(iContactService.getMessageIDs());
		
		contact.setMessageID(messageID);
		contact.setName(request.getParameter("name"));
		contact.setEmail(request.getParameter("email"));
		contact.setMessage(request.getParameter("message"));
		
		iContactService.addContact(contact);
		
		request.setAttribute("currentMessage", contact);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/viewMessage.jsp");
		dispatcher.forward(request, response);
		
	}

}



