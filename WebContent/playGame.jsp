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
	IGameService ob1 = new GameServiceImpl();
	String GameID = (String) request.getAttribute("GameID");

	if (user == null) {

		response.sendRedirect("login");
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
					<h3>
						Playing:
						<%=ob1.loadGameName(GameID)%></h3>
				</div>
				<div class="row ml-0 mr-0 pb-4">
					<div class="miniclip-game-embed m-auto"
						data-game-name="<%=ob1.getcode(GameID)%>" data-theme="5"
						data-width="1024" data-height="600" data-language="en"
						align="center"></div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>
</html>
