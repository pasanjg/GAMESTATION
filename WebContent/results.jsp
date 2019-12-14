<%@page import="com.gamestation.model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gamestation.service.IGameService"%>
<%@page import="com.gamestation.service.GameServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="WEB-INF/views/header.jsp" />
<!DOCTYPE html>
<html>

<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	String search = new String();
	search = (String) request.getAttribute("search").toString();

	IGameService iGameService = new GameServiceImpl();
	ArrayList<Game> gameList = new ArrayList<Game>();
	gameList = iGameService.searchGame(search);
%>

<title>Search - <%=search%> | GameStation
</title>

<style>
</style>

</head>

<body>

	<div class="container gs-top">
		<div class="row">
			<div class="col-md-12 mx-2 my-5 p-0" id="profile-main">
				<div id="top-bar" class="text-center mb-4">
					<h3><%=gameList.size()%>
						results found matching <font color="red"><%=search%></font>
					</h3>
				</div>
				<div class="row ml-0 mr-0">
					<%
						if (gameList.size() != 0) {
					%>
					<%
						for (Game showGame : gameList) {
					%>
					<div class="col-sm-6 col-md-4 col-lg-3">
						<div class="card text-center mb-4 pt-4">

							<%
							if (showGame.getImgDataBase64() != null && !showGame.getImgDataBase64().isEmpty()) {
							%>
							<a href="play-game?game-data=<%=showGame.getGameID()%>"
								style="color: black"> <img
								src="data:image/PNG;base64,<%=showGame.getImgDataBase64()%>"
								alt="<%=showGame.getGameName()%>"
								style="width: 100%; height: 150px; object-fit: cover;">
							</a>
							<%
								} else {
							%>
							<a href="play-game?game-data=<%=showGame.getGameID()%>"
								style="color: black"> <img src="images/game-default.png"
								alt="<%=showGame.getGameName()%>"
								style="width: 100%; height: 150px; object-fit: cover;">
							</a>
							<%
								}
							%>

							<div class="card-container">
								<p>
									<strong><%=showGame.getGameName()%></strong><br> Category:
									<%=showGame.getCategory()%></p>

								<div class="mb-2">
									<form method="GET" action="play">
										<input type="hidden" name="game"
											value="<%=showGame.getGameCode()%>"> <input
											class="btn btn-gs-green w-100" type="submit"
											value="Play Game" />
									</form>
								</div>
								<div class="my-2">
									<form method="POST" action="add-fav">
										<input type="hidden" name="gameID"
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
					<%
						} else {
					%>

					<div class="col text-center pb-5">

						<img class="img-responsive" src="images/error.png">
						<h4>
							Oops! No Result Found. <br /> Make sure all words are spelled
							correctly or try a different keyword.
						</h4>
						<br>
						<h6 class="text-secondary mb-4">
							To find the service you need, you can quickly contact our
							Customer Support Team. <br /> We are glad to help you out.
						</h6>
						<a href="contact">
							<button class="btn btn-gs-red">Contact Now</button>
						</a>

					</div>

					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="WEB-INF/views/scrolltop.jsp" />

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>

</html>