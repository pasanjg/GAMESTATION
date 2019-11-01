<%@page import="com.gamestation.model.Contact"%>
<%@page import="com.gamestation.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gamestation.service.IContactService"%>
<%@page import="com.gamestation.service.ContactServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	String deleteMsg = (String) request.getAttribute("deleteMsg");
	User user = (User) session.getAttribute("currentSessionUser");

	IContactService iContactService = new ContactServiceImpl();
	ArrayList<Contact> contactList = new ArrayList<Contact>();
	contactList = iContactService.getMessages();

	if (user == null || user.getType().equals("user")) {

		response.sendRedirect("index.jsp");
	}
%>

<title>Messages | GameStation</title>

<style>
</style>

</head>
<body>

	<div class="container gs-top">
		<div class="row">
			<div class="col-md-12 mx-2 my-5 p-0" id="profile-main"
				style="height: 500px">
				<div id="top-bar" class="text-center mb-4">
					<h4>
						You have <font color="red"><%=contactList.size()%></font> messages
						to respond
					</h4>
				</div>
				<div class="row ml-0 mr-0" style="max-height: 425px; overflow: auto">

					<%
						if (contactList.size() != 0) {
					%>

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">Ref. ID</th>
								<th scope="col">Name</th>
								<th scope="col">Email</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Contact showMessage : contactList) {
							%>
							<tr>
								<th scope="row"><%=showMessage.getMessageID()%></th>
								<td><%=showMessage.getName()%></td>
								<td><%=showMessage.getEmail()%></td>
								<td>
									<button class="btn btn-gs-red" data-toggle="modal"
										data-target="#<%=showMessage.getMessageID()%>">View</button> <%-- <form method="POST" action="delete-message">
										<input type="hidden" name="mid"
											value="<%=showMessage.getMessageID()%>"> <input
											type="submit" value="Delete" class="btn btn-gs-red" />
									</form> --%>
								</td>

								<div class="modal fade" id="<%=showMessage.getMessageID()%>"
									tabindex="-1" role="dialog" aria-labelledby=""
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="">
													<%=showMessage.getName()%>
												</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h6>
													Email:
													<%=showMessage.getEmail()%></h6>
												<h6>Date: 2019-10-20</h6>
												<p>
													<%=showMessage.getMessage()%>
												</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-gs-red"
													data-dismiss="modal">Close</button>
												<!-- <button type="button" class="btn btn-gs-green">Save
													changes</button> -->
											</div>
										</div>
									</div>
								</div>

							</tr>
							<%
								}
							%>
						</tbody>
					</table>

					<%
						} else {
					%>

					<div class="col text-center">
						<img class="img-responsive" src="images/error.png">
						<h4>Oops! No messages</h4>
						<h5 class="text-secondary mb-4">
							New messages from gamers appear here. <br> Make sure to
							respond immediately
						</h5>
					</div>

					<%
						}
					%>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="scrolltop.jsp" />

	<jsp:include page="footer.jsp" />

</body>
</html>