<%@page import="com.gamestation.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>

<head>

	<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="assets/css/styles.css" type="text/css">
	<link rel="stylesheet" href="assets/css/scrollbar.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script src="https://kit.fontawesome.com/64e4326dc2.js"></script>

	<script src="assets/js/scripts.js" type="text/javascript"></script>

	<%
	User user = (User) session.getAttribute("currentSessionUser");
	String type = (String) request.getAttribute("type");
%>

	<style>
	</style>

	<link rel="shortcut icon" href="favicon.ico" />

	<script>

	</script>

</head>

<body>

	<nav class="navbar navbar-expand-lg navbar fixed-top navbar-dark bg-black" style="background-color: black;">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <img src="images/GameStation.png" height="45" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline mx-3 my-lg-0" method="GET" action="search" onSubmit="return checkSearch();">
					<input id="navSearchBar" name="q" class="form-control mr-sm-2" type="search"
						placeholder="What are you looking for?" aria-label="Search">
					<button class="btn btn-gs-red my-2 my-sm-0" type="submit">Search</button>
				</form>

				<%
					if (user != null) {
				%>

				<%
					if (user.getType().equals("admin")) {
				%>

				<ul id="navigation" class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="games">GAMES</a>
					<li class="nav-item"><a class="nav-link" href="edit-game">EDIT
							GAMES</a></li>
					<li class="nav-item"><a class="nav-link" href="messages">MESSAGES</a>
					</li>
				</ul>

				<%
					} else {
				%>

				<ul id="navigation" class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="games">PLAY</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="news.jsp">NEWS</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact">CONTACT</a>
					</li>
				</ul>

				<%
					}
				%>
				<ul class="nav justify-content-end">
					<li class="nav-item dropdown text-white"><a class="nav-link dropdown-toggle" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">

							<%
							if (user.getImgDataBase64() != null) {
 							%>

							<img class="profile-img" src="data:image/PNG;base64,<%=user.getImgDataBase64()%>" width="32"
								style="height: 32px; width: 32px;" />

							<%
							} else {
							%>

							<img class="profile-img" src="images/default.png" width="32"
								style="height: 32px; width: 32px;" />

							<%
 							}
 							%>

						</a>
						<div id="dropDown" class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="profile"><strong><%=user.getUserName()%></strong></a>
							<a class="dropdown-item" href="settings">Settings</a>
							<div class="dropdown-divider"></div>
							<a href="login">
								<button type="submit" class="btn btn-red w-100 rounded-0">Logout</button>
							</a>
						</div>
					</li>
				</ul>

				<%
					} else {
				%>

				<ul id="navigation" class="navbar-nav mr-auto">

					<li class="nav-item"><a class="nav-link" href="index.jsp">HOME</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="news.jsp">NEWS</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact">CONTACT</a>
					</li>
				</ul>

				<ul class="nav justify-content-end">
					<li class="nav-item"><a href="login"><button class="btn btn-gs-red mr-2">Login</button></a> <a
							href="register"><button class="btn btn-gs-red">Signup</button></a></li>
				</ul>

				<%
					}
				%>

			</div>
		</div>
	</nav>

</body>

</html>