<%@page import="com.gamestation.model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gamestation.service.IGameService"%>
<%@page import="com.gamestation.service.GameServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	IGameService iGameService = new GameServiceImpl();
	ArrayList<Game> gameList = new ArrayList<Game>();
	gameList = iGameService.listAllGames();
%>

<title>Games | GameStation</title>

<style>
</style>

</head>
<body>

	<div class="container gs-top">
		<div class="row">
			<div class="col-md-12 mx-2 my-5 p-0" id="profile-main">
				<div id="top-bar" class="text-center mb-4">
					<h3>All Games</h3>
				</div>
				<div class="row ml-0 mr-0">
					<%
						for (Game showGame : gameList) {
					%>
					<div class="col-sm-6 col-md-4 col-lg-3">
						<div class="card text-center mb-4 pt-4">
							<a href="play-game?GameID=<%=showGame.getGameID()%>"
								style="color: black"> <img
								src="images/<%=showGame.getGameID()%>.jpg" width="100"
								height="100" alt="<%=showGame.getgameName()%>">
							</a>
							<div class="card-container">
								<p>
									<strong><%=showGame.getgameName()%></strong><br> Category:
									<%=showGame.getcategory()%></p>

								<div class="mb-2">
									<form method="GET" action="play-game">
										<input type="hidden" name="GameID"
											value="<%=showGame.getGameID()%>"> <input
											class="btn btn-gs-red w-100" type="submit" value="Play Game" />
									</form>
								</div>
								<div class="my-2">
									<form method="GET" action="add-fav">
										<input type="hidden" name="favourite"
											value="<%=showGame.getGameID()%>"> <input
											class="btn btn-gs-red w-100" type="submit"
											value="Add to Favourites" />
									</form>
								</div>
							</div>
						</div>
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