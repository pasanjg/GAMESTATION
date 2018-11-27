<%@page import="com.gamestation.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
		User user = (User) session.getAttribute("currentSessionUser");
	
		String error = (String) request.getAttribute("errorString");
	
		if(user != null){
			
			response.sendRedirect("index.jsp");
		}
	
	%>

	<title>Login | GameStation</title>
	
	<style>

        h1{
			color:black;
			text-align: center;
			font-size:60px;
            margin: 80px;
		}
        
		body{
			
			margin: 0px;
		}
        
        .content{
            width: 500px;
            height: auto;
            background-color: white;
            margin-top: 170px;
            margin-left:auto;
            margin-right: auto;
            margin-bottom: 100px;
            padding: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

		.container{
			width:500px;
			height:auto;
			margin-top:50px;
			margin-bottom: 50px;
			text-align:center;
		}

		.container img{
			width:100px;
			height:100px;
			margin-top:-60px;
			margin-bottom:30px;
		}

		input[type="text"], input[type="password"]{
			width:280px;
			height:20px;
            font-size: 16px;
			margin-bottom: 20px;
			border:1px solid gray;
            border-radius: 5px;
			padding:10px;
		}

		input[type="submit"]{
			height: 50px;
			width: 100px;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 0px;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
		
		input[type="submit"]:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
        
        span a{
            text-decoration: none;
            color: red;
        }

	</style>
	
</head>
<body>
    
    <div class="content">
	<h1>Login</h1>
	<div class = "container">
	    <img src = "images/avatar.png" alt = "Avatar">
	    <% if(error != null) { %>
        <p style="color: red;"><%= error %></p>
        <%} %>
		<form method="POST" action="login">
			<div>
				<input type="text" name="userName" placeholder="Username" required><br/>
				<input type="password" name="password" placeholder="Password" required><br/>
                
				<input type="submit" name="login" value="Login"><br/><br/>
                <span>Not a member yet? <a href="register">Join now</a></span> <br/> <br/>
            </div>
		</form>
	</div>
    </div>
    <jsp:include page="WEB-INF/views/footer.jsp"/>
</body>
</html>