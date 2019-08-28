<%@page import="com.gamestation.model.User"%>
<%@page import="com.gamestation.service.IGameService"%>
<%@page import="com.gamestation.service.GameServiceImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>

<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		User user = (User) session.getAttribute("currentSessionUser");
		
		String confirm = (String) request.getAttribute("confirmString");
		
		String confirmAddOrRem = (String) request.getAttribute("confirm");
		
		ArrayList<String> arrayList = new ArrayList<String>();
		IGameService iGameService = new GameServiceImpl();
		
		if(user == null){
			
			response.sendRedirect("login");
		}
	
	%>
	
	<% if(user !=null) { %>
	
	<title> <%=user.getUserName()%> | GameStation </title>
	
	<% } %>
	
	<style>

        
        
        
		
        
	</style>
	
</head>
<body>

	<div id="content" class="container gs-top">
		<div class="row">
			<!-- sidebar -->

			<div class="col-sm-12 col-md-4" id="profile-sidebar">
			
			<% if(user != null) { 
			
				arrayList = iGameService.getFav(user.getUserID());
			%>

				<div class="col-sm-12" id="profile-details">
					<div class="picture pt-2">
						<img src="images/default.png" width="150"/> <br/><br/>
						<h5><%= user.getUserName() %></h5> <hr> 
					</div>

					<table style="width: 100%">
						<tr>
							<td align="left"><b>Name </td>
							<td align="right"><b><%= user.getFirstName() + " " + user.getLastName() %></td>
						</tr>

						<tr>
							<td align="left"><b>From</td>
							<td align="right"><b><%= user.getCountry() %></td>
						</tr>

						<tr>
							<td align="left"><b>Platform</td>
							<td align="right"><b><%= user.getPlatform() %></td>
						</tr>

						<tr>
							<td align="left"></td>
							<td align="right">
									<a href="edit-profile">
										<button type="submit" class="btn btn-grey" style="margin-top: 5px; padding: 3px 5px 0 5px;">
											<i class="material-icons">&#xe3c9;</i>
										</button>
									</a>
						
							</td>
							
						</tr>
						<tr>
							<td colspan="2" align="center"> 
								<% if(confirm != null) { %>
        							<p style="color: green;" align="center"><br/><%= confirm %></p>
        						<%} %>
							</td>
						</tr>
					</table>

					
				</div>

				<div class="col-sm-12" id="profile-details">
					<span class="text-left"><b>About</b></span> <hr>
					<p style="text-align: left;">
						This paragraph contains a breif description about the user. Editable text.
					</p>
					<p style="text-align: right; margin: 0">
						<button class="btn btn-grey" style="margin-top: 5px; padding: 3px 5px 0 5px;"><i class="material-icons">&#xe3c9;</i></button>
					</p>
				</div>

				<div class="col-sm-12" id="profile-details">
					another section
				</div>
				
				<% } %>				

			</div>

			<!-- main content -->
			<div class="col-sm-12 col-md-8" id="profile-main">
			
				<div class="row">
					<div id="top-bar" class="col-sm-12 text-center">
						<h4>Favourites</h4>
					</div>
					
					<%if(confirmAddOrRem != null) {%>
						<div class="col-sm-12 text-center">
							<p align="center" style="color: green; text-align: center;"><%= confirmAddOrRem %></p>
						</div>
					<%} %>
					
					<% if(arrayList.size() != 0) { %>
					
						<%	
							for(String gameID : arrayList){
						%>

							<div class="col-sm-12 col-md-6 col-lg-4">
								<div class="card text-center pt-4">
									<a href="play-game?GameID=<%= gameID %>" style="color: black">
										<img src="images/<%= gameID %>.jpg" height="135" alt="<%= gameID %>" style="margin: auto;">
									</a>
									<div class="card-container">
										<h6><b><%= iGameService.loadGameName(gameID) %></b></h6>
										<p>Game Category</p>
										
										<div class="d-inline">
										<form class="d-inline" method="GET" action="play-game">
											<input class="form-control" type="hidden" name="GameID" value="<%= gameID %>">
											<button class="btn btn-gs-green w-45" type="submit">Play</button>
										</form>
										</div>
										<div class="d-inline">
										<form class="d-inline" method="GET" action="remove-fav">
											<input class="form-control" type="hidden" name="GameID" value="<%= gameID %>">
											<button class="btn btn-gs-red w-45" type="submit">Remove</button>
										</form>
										</div>

									</div>
								</div>
							</div>
						
						<% } %>
					
					<% } else {%>
					
							<div class="col text-center">
					
								<img class="img-responsive" src="images/error.png">
								<h4>Oops! Your list is empty. <br/> 
									But it doesn't have to be.
								</h4>
								<h5 class="text-secondary mb-4">Join our play area now and add games to your favourites. <br/>
									Keep Gaming!
								</h5>
								<a href="games">
									<button class="btn btn-gs-red">Play Now</button>
								</a>
						
						</div>
					
					<%} %>
					
				</div>

			</div>
		</div>
	</div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>