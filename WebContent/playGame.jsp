<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gamestation.model.Game"%>
<%@page import="com.gamestation.service.*"%>
<%@page import="com.gamestation.model.User"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<jsp:include page="WEB-INF/views/header.jsp" />

<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	User user = (User) session.getAttribute("currentSessionUser");
	IGameService iGameService = new GameServiceImpl();
	String gameCode = (String) request.getAttribute("gameCode");
	Game play = new Game();

	if (user == null) {
		response.sendRedirect("login");
	} else {
		play = iGameService.loadGame(gameCode);
	}
%>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Play game</title>

<style>
</style>

</head>

<script src="//static.miniclipcdn.com/js/game-embed.js"></script>

<body>

	<div class="container gs-top">
		<div class="row">
			<div class="col-md-12 mx-2 my-5 p-0" id="profile-main">
				<div id="top-bar" class="text-left px-3">
					<%
						if (play == null) {
					%>
					<h3>Game not found</h3>
					<%
						} else {
					%>
					<h3>
						Playing:
						<%=play.getGameName()%></h3>
					<%
						}
					%>
				</div>
				<div class="row ml-0 mr-0 pb-4">
					<%
						if (play == null) {
					%>
					<div class="col text-center pb-5">

						<img class="img-responsive" src="images/error.png">
						<h4>
							Oops! We couldn't find that game. <br />
						</h4>
						<h5 class="text-secondary mb-4">
							Join our play area now and add games to your favourites. <br />
							Keep Gaming!
						</h5>
						<a href="games">
							<button class="btn btn-gs-red">Play Now</button>
						</a>

					</div>
					<%
						} else {
					%>
					<div class="miniclip-game-embed m-auto"
						data-game-name="<%=play.getGameCode()%>" data-theme="5" data-width="1024"
						data-height="600" data-language="en" align="center"></div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>
</html>
