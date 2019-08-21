<%@page import="com.gamestation.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>

<head>

    <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> --%>

	<link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" href="assets/css/styles.css">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <%
			User user = (User) session.getAttribute("currentSessionUser");
			
			String type = (String)request.getAttribute("type");
			
		%>

    <style>
        /* body{
                font-family: calibri;
                margin: 0px;
                background-color: #F8F8F8;
            }
            
            a{
                text-decoration: none;
            }
        
            .mainHeader{
	            height: 50px;
	            width: 100%;
	            background-color: black;
	            padding-top: 10px;
	            padding-bottom: 10px;
	            position: fixed;
	            top: 0;
	            z-index: 100;
            }
            
            .logo{
				height: 50px;
				width: 200px;
				float: left;
            }
            
            .logo button{
				height: 50px;
				width: 200px;
                border: none;
                background-image: url(images/GameStation.png);
                background-size: cover;
				float: left;
            }
            
            .searchArea{
				height: 30px;
				width: 500px;
				padding: 10px;
				float: left;
            }
            
            #searchBar{
                height: 20px;
                width: 400px;
                font-size: 16px;
                color: white;
                background-color: #363636;
                border: 0px;
                border-radius: 5px;
                padding: 5px;
            }
            
            #searchButton{
                height: 30px;
				width: 70px;
				background-color: red;
				color: white;
                font-size: 16px;
                border: none;
				border-radius: 5px;
                float: right;
                transition: background-color 0.2s ease-in-out;
            }
            
            #searchButton:hover{
                background-color: #FF4D4D;
                color: white;
            }
            
            .topNav{
	            height: 30px;
	            width: auto;
	            margin-top: 4px;
	            margin-left: 15px;
	            color: white;
	            font-size: 18px;
	            float: left;
	            padding: 10px;
            }
            
            .topNav a{
                margin-right: 30px;
                text-decoration: none;
                color: white;
                transition: color 0.2s ease-in-out;
            }
            
            .topNav a:hover{
                color: red;
            }
            
            .userLog{
                height: 30px;
                width: 270px;
                float: right;
                padding: 10px;
            }
        
        	.userLog button {
				height: 30px;
				width: 60px;
				border: 0px;
				border-radius: 5px;
                margin-right: 10px;
                float: right;
                transition: background-color 0.2s ease-in-out;
			}
            
            .userLog .account{
				height: 40px;
				width: 40px;
                background-image: url(images/default.png);
                background-size: cover;
				border: 1.5px solid #00d32d;
				border-radius: 100px;
                margin-top: -5px;
                margin-right: 30px;
                transition: border 0.2s ease-in-out;
			}
            
            .userLog .account:hover{
				border: 1.5px solid red;
			}
            
            .userLog .logout {
            	background-color: red;
            	color: white;
				height: 30px;
				width: 60px;
				border: 0px;
				border-radius: 5px;
			}
            
            .userLog .logout:hover{
                background-color: #FF3333;
                border: none;
			}
            
            .userLog .loginButton:hover{
                color: red;
                border: 1px solid red;
                border-radius: 5px;
			}
			
			.userLog .signupButton{
				background-color: red;
				color: white;
			}
            
            .userLog .signupButton:hover{
                background-color: #FF4D4D;
			}
         	
         	button, input[type="submit"], input[type="reset"], input[type="button"]{
         		outline:none;
         	} */
    </style>
    <link rel="shortcut icon" href="favicon.ico" />


    <script type="text/javascript">

        function checkSearch() {

            var query = document.getElementById('navSearchBar').value;

            if ((query == null) || (query == "")) {
                return false;
            }

            else {
                return true;
            }
        }

    </script>


</head>

<body>

    <nav class="navbar navbar-expand-lg navbar fixed-top navbar-dark bg-black" style="background-color: black;">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/GameStation.png" height="45" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <form class="form-inline mx-3 my-lg-0" method="GET" action="search" onSubmit="return checkSearch();">
                    <input id="navSearchBar" name="q" class="form-control mr-sm-2" type="search"
                        placeholder="What are you looking for?" aria-label="Search">
                    <button id="searchBtn" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                
                <% if(user != null){ %>

                    <%if(user.getType().equals("admin")) { %>
                
                <ul id="navigation" class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="edit-game">EDIT GAMES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="messages">MESSAGE</a>
                    </li>

                </ul>

                    <%}else{ %>
                    
                    <ul id="navigation" class="navbar-nav mr-auto">

                    	<li class="nav-item">
                        	<a class="nav-link" href="games">PLAY</a>
                    	</li>
                    	<li class="nav-item">
                        	<a class="nav-link" href="news.jsp">NEWS</a>
                    	</li>
                    	<li class="nav-item">
                        	<a class="nav-link" href="contact">CONTACT</a>
                    	</li>

                		</ul>

                    <%} %>
                <ul class="nav justify-content-end">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="images/default.png" width="32" />
                        </a>
                        <div id="dropDown" class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="profile"><strong><%= user.getUserName() %></strong></a>
                            <a class="dropdown-item" href="edit-profile">Edit Profile</a>
                            <div class="dropdown-divider"></div>
                            <a href="login">
                    	        <button type="submit" class="btn btn-danger w-100 rounded-0">Logout</button>
                            </a>
                        </div>
                    </li>
                </ul>

                    <% } else {%>

                <ul id="navigation" class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="news.jsp">NEWS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact">CONTACT</a>
                    </li>
                </ul>

                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a href="login"><button class="btn btn-danger mr-2">Login</button></a>
                        <a href="register"><button class="btn btn-danger">Signup</button></a>
                    </li>
                </ul>

                <% } %>

            </div>
        </div>
    </nav>



</body>

</html>