<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gamestation.model.Contact"%>
<%@page import="com.gamestation.service.IContactService"%>
<%@page import="com.gamestation.service.ContactServiceImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%
	Contact contact = (Contact) request.getAttribute("currentMessage");

	if (contact == null) {

		response.sendRedirect("contact.jsp");
	}
%>

<style>
</style>

<%
	if (contact != null) {
%>
<title><%=contact.getName() + " - " + contact.getMessageID()%>
	|GameStation</title>
<%
	}
%>
</head>
<body>

	<div class="container gs-top">
		<div class="row justify-content-center">
			<div class="col-md-6 col-sm-12">
				<div class="card px-2 my-5">
					<div class="card-body">
						<h2>Message Sent Successfully</h2>
						<h4>We'll Send Our Feedback Soon</h4>

						<hr />

						<%
							if (contact != null) {
						%>

						<table class="table table-hover table-borderless text-justify">

							<tr>
								<th style="width: 50%">Message ID</th>
								<td><%=contact.getMessageID()%></td>
							</tr>

							<tr>
								<th>Name</th>
								<td><%=contact.getName()%></td>
							</tr>


							<tr>
								<th>Email</th>
								<td><%=contact.getEmail()%></td>
							</tr>

							<tr>
								<th>Message</th>
								<td><%=contact.getMessage()%></td>
							</tr>

						</table>
						<%
							}
						%>

						<a href="index.jsp">
							<button class="btn btn-gs-red" align="center">Okay</button>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>