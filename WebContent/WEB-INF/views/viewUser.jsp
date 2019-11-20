<%@page import="com.gamestation.model.User"%>
<%@page import="com.gamestation.service.IUserService"%>
<%@page import="com.gamestation.service.UserServiceImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	User user = (User) session.getAttribute("currentSessionUser");

	if (user == null) {

		response.sendRedirect("login.jsp");
	}
%>

<%
	if (user != null) {
%>
<title>Welcome <%=user.getUserName()%> | GameStation
</title>
<%
	}
%>

<style>
</style>

</head>
<body>

	<div class="container gs-top">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card my-5 p-4 text-center">
					<h3>
						Thank You <br /> for Registering at GameStation
					</h3>
					<h4>
						<%=user.getUserName()%>
					</h4>
					<hr />

					<%
						if (user != null) {
					%>

					<table class="table table-sm table-borderless">

						<%
							IUserService iUserService = new UserServiceImpl();
								ArrayList<User> arrayList = iUserService.getUser(user.getUserID());

								for (User player : arrayList) {
						%>

						<tr>
							<td>
								<h6>First Name</h6>
							</td>
							<td>
								<h6><%=player.getFirstName()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Last Name</h6>
							</td>
							<td>
								<h6><%=player.getLastName()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Gender</h6>
							</td>
							<td>
								<h6><%=player.getGender()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Country</h6>
							</td>
							<td>
								<h6><%=player.getCountry()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Gaming Platform</h6>
							</td>
							<td>
								<h6><%=player.getPlatform()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Username</h6>
							</td>
							<td>
								<h6><%=player.getUserName()%></h6>
							</td>
						</tr>

						<tr>
							<td>
								<h6>Email Address</h6>
							</td>
							<td>
								<h6><%=player.getEmail()%></h6>
							</td>
						</tr>

						<%-- <tr>
								<td>
									<h6>User Type </h6></td>
								<td>
									<h6>user<%=player.getType()%></h6>
								</td>
							</tr> --%>

						<%
							}
						%>

					</table>

					<%
						}
					%>

					<a href="profile">
						<button class="btn btn-gs-red">View Profile</button>
					</a>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>