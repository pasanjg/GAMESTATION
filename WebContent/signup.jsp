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
            width: 600px;
            height: auto;
            color: black;
            background-color: white;
            margin-top: 170px;
            margin-left:auto;
            margin-right: auto;
            margin-bottom: 100px;
            padding: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

		.container{
			width:600px;
			height:auto;
            text-align: center;
			margin-top:50px;
			margin-bottom: 100px;
			text-align: center;
		}
		
		.container img{
			width:100px;
			height:100px;
			margin-top:-60px;
			margin-bottom:30px;
		}
        
        .container td{
            text-align: left;
            vertical-align: baseline;
        }

		input[type="text"], input[type="password"], input[type="email"], input[list="platform"], input[list="question"], input[list="country"]{
			width:280px;
			height:20px;
            font-size: 16px;
			margin-bottom: 20px;
			border:1px solid gray;
            border-radius: 5px;
			padding:5px;
		}
        
        a{
            text-decoration: none;
            color: dodgerblue;
        }
        
        a:hover{
            color: #e74c3c;
        }

		input[type="submit"], input[type="reset"]{
			height: 40px;
			width: 80px;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 1px solid red;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
        
        input[type="submit"]:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
        
        input[type="reset"]:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
        
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
    
    <div class="content">
	<h1>Register</h1>
	<div class = "container">
		<img src = "images/signup.png" alt = "Avatar">
		
		<% if(delete_confirm != null) { %>
        	<p style="color: red;"><%= delete_confirm %></p>
        <%} %>
		
		<form method="POST" action="register" method="post" onsubmit="return checkPassword();">
			<table align="center">

				<tr>
					<td>First Name </td>
					<td>
						<input type="text" name="firstName" required>
					</td>
				</tr>
                
                <tr>
					<td>Last Name </td>
					<td>
						<input type="text" name="lastName" required>
					</td>
				</tr>

				<tr>
					<td>Gender </td>
					<td>
						<input type="radio" name="gender" value="Male" required>Male
						<input type="radio" name="gender" value="Female" required>Female<br/>&nbsp;
					</td>
				</tr>
				
				<tr>
					<td>Country </td>
					<td>
						<input list="country" name="country" placeholder="Select country" required>
						<datalist id="country">
							<option value="Sri Lanka">
							<option value="India">
                            <option value="China">
                            <option value="United States">
						</datalist>
                    </td>
				</tr>
                
                <tr>
					<td>Gaming Platform </td>
					<td>
						<input list="platform" name="platform" placeholder="Select one" required>
						<datalist id="platform">
							<option value="PC">
							<option value="PlayStation">
                            <option value="Xbox">
						</datalist>
					</td>
				</tr>
				
				<tr>
					<td>Username </td>
					<td>
						<input type="text" name="userName" required>
					</td>
				</tr>
				
				<tr>
					<td>Password </td>
					<td>
						<input type="password" name="password1" onKeyUp="checkPassword()" id= "pass1" required>
					</td>
				</tr>
				
				<tr>
					<td>Confirm Password &emsp;</td>
					<td>
						<input type="password" name="password2" onKeyUp="checkPassword()" id= "pass2" required>
					</td>
				</tr>

				<tr>
					<td>Email Address </td>
					<td>
						<input type="email" name="email" required>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<span id="status" style="color: red;"></span>
						<br> &nbsp;
					</td>
				</tr>
				
				<tr>
                    <td>
                    	
                    </td>
					<td>
						<input type="reset" name="reset" value="Reset">
						<input type="submit" name="register" value="Submit">					
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;"> 
						<br> <span>Already a member? <a href="login">Log in</a></span> 
					</td>
				</tr>

			</table>
		</form>
	</div>
    </div>
    <jsp:include page="WEB-INF/views/footer.jsp"/>
</body>
</html>