<%@page import="com.gamestation.model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
		User user = (User) session.getAttribute("currentSessionUser");
		String delete_confirm = (String) request.getAttribute("delete_confirm");
	
		if(user != null){
			
			response.sendRedirect("index.jsp");
		}
	
	%>


	<title>Register | GameStation</title>
	
	<style>

	</style>
	
	<script type="text/javascript">
		function checkPassword() {
			var password1 = document.getElementById('pass1').value;
			var password2 = document.getElementById('pass2').value;
		
			if ((password1 == null && password2 == null) || (password1 == "" && password2 == "")){
				document.getElementById('status').innerHTML = "Password cannot be empty!";
				return false;
			}
			else if (password1==password2) {
				document.getElementById('status').innerHTML = "Passwords Match!";
				return true;
			}
			else {
				document.getElementById('status').innerHTML = "Passwords Do Not Match!";
				return false;
			}
		}
	</script>
	
</head>
<body>

    <div class="container gs-top px-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card my-5 p-4 text-center">
					<h3>Register Now!</h3>
					<div class="col my-3">
						<img class="img-responsive" src="images/signup.png" width="100" height="100" alt="Avatar">
					</div>
					
					<% if(delete_confirm != null) { %>
        				<p style="color: red;"><%= delete_confirm %></p>
        			<%} %>
					
					<div class="card-body">
						<form method="POST" action="register" method="post" onsubmit="return checkPassword();" autocomplete="off">
							<div class="form-group">
								<input type="text" class="form-control" name="firstName" id="colFormLabel" placeholder="First Name" required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="lastName" id="colFormLabel" placeholder="Last Name" required>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="email" id="colFormLabel" placeholder="Email" required>
							</div>
							<div class="form-group">
								<div class="custom-control custom-radio custom-control-inline">
  									<input type="radio" id="male" name="gender" value="Male" class="custom-control-input" required>
 								 	<label class="custom-control-label" for="male">Male</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
  									<input type="radio" id="female" name="gender" value="Female" class="custom-control-input" required>
  									<label class="custom-control-label" for="female">Female</label>
								</div>
							</div>
							<div class="form-group">
								<select class="custom-select" name="country" placeholder="Select your country" required>
									<option value="" disabled selected>Select your country</option>
									<option value="Sri Lanka">Sri Lanka</option>
									<option value="India">India</option>
									<option value="China">China</option>
									<option value="United States">United States</option>
								</select>
							</div>
							<div class="form-group">
								<select class="custom-select" name="platform" required>
									<option value="" disabled selected>Select your platform</option>
									<option value="PC">PC</option>
									<option value="Playstation">PlayStation</option>
									<option value="Xbox">Xbox</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="userName" id="colFormLabel" placeholder="username" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password1" onKeyUp="checkPassword()" id= "pass1" placeholder="Password" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password2" onKeyUp="checkPassword()" id= "pass2" placeholder="Confirm password" required>
							</div>

							<div class="form-group">
								<span id="status" style="color: red;"></span>
							</div>
							
							<button class="btn btn-gs-red px-4" type="reset" name="login" value="Login">Reset</button>
							<button class="btn btn-gs-red px-4" type="submit" name="login" value="Login">Submit</button> <br/> <br/>
							<span>Already a member? <a href="login" style="color: red;">Log in</a></span> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>