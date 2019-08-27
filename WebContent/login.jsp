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

	</style>
	
</head>
<body>
    
    <div class="container gs-top px-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card my-5 p-4 text-center">
					<h3>Welcome back!</h3>
					<div class="col my-3">
						<img class="img-responsive" src="images/avatar.png" width="100" height="100" alt="Avatar">
					</div>
					
					<% if(error != null) { %>
						<p style="color: red;"><%= error %></p>
					<%} %>
					
					<div class="card-body">
						<form method="POST" action="login">
							<div class="form-group">
								<input type="text" class="form-control" name="userName" id="colFormLabel" placeholder="username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password" id="colFormLabel" placeholder="password">
							</div>
							<button class="btn btn-gs px-4" type="submit" name="login" value="Login">Login</button> <br/> <br/>
							<span>Not a member yet? <a href="register" style="color: red;">Join now</a></span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>