<%@page import="com.gamestation.model.User"%>
<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		User user = (User) session.getAttribute("currentSessionUser");
		
		String error = (String) request.getAttribute("errorString");
		
		String delete_error = (String) request.getAttribute("delete_error");
	
		if(user == null){
			
			response.sendRedirect("login.jsp");
		}
	
	%>

	<title> Edit | GameStation </title>
	
	<style>

        h1{
			color:black;
			text-align: center;
            margin: 40px;
            transition: color 0.15s;
		}
		
		h1:hover{
			color: red;
		}
        
		body{
			
			margin: 0px;
		}
        
        .mainArea{
            width: auto;
            height: auto;
            text-align: center;
            margin-top: 50px;
            margin-bottom: 50px;
            margin-left: 20px;
            margin-right: 20px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
        }
        
        .mainArea p{
        	font-size: 20px;
        }
        
        .sideBar{
            width: 500px;
            height: 560px;
            margin-top: auto;
            padding: 20px;
            float: left;
        }
        
        .content{
            width: auto;
            height: 560px;
            margin-top: auto;
            padding: 20px;
            float: left;
        }
        
        .mainArea table td{
        	height: auto;
        	text-align: left;
        	padding: 10px;
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
		
		input[type="submit"]{
			height: 40px;
			width: auto;
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
		
		
		function checkProceed(){
			if(confirm("You are trying to delete your account. It cannot be recovered again.")){
		    	return true;
		    }
		    else{
		    	return false;
		    }
		}

	</script>
	
</head>
<body>

	<div class="mainArea" style="margin-bottom: 0px; margin-top: 120px; padding: 1px;">
		<h1>Edit Profile</h1>
		<% if(error != null) { %>
        	<p style="color: red;">Action Failed! <%= error %></p>
        <%} %>
        
        <% if(delete_error != null) { %>
        	<p style="color: red;">Action Failed! <%= delete_error %></p>
        <%} %>
	</div>
    
    <div class="mainArea" style="padding-top: 40px;">

        <% if(user !=null) { %>
        
        <form action="update-profile" method="POST">
        <table align="center">
        
        	<tr>
        		<td colspan="4" style="text-align: center;">
        			<b>Change the respective fields you want to update</b> <br> &nbsp;
        		</td>
        	</tr>
        
        	<tr>
        		<td>First Name </td>
				<td>
					<input type="text" name="firstName" value="<%= user.getFirstName() %>" required>
				</td>
				<td>Last Name </td>
				<td>
					<input type="text" name="lastName" value="<%= user.getLastName() %>" required>
				</td>
        	</tr>
        	
        	<tr>
				<td>Gender </td>
				<%if(user.getGender().equals("Male")) { %>
				<td>
					<input type="radio" name="gender" value="Male" checked="checked">Male
					<input type="radio" name="gender" value="Female">Female<br/>&nbsp;
				</td>
				<%}else{ %>
				<td>
					<input type="radio" name="gender" value="Male">Male
					<input type="radio" name="gender" value="Female" checked="checked">Female<br/>&nbsp;
				</td>
				<%} %>
				
				<td>Country </td>
				<td>
					<input list="country" name="country" placeholder="Select country" value="<%= user.getCountry() %>" required>
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
					<input list="platform" name="platform" placeholder="Select one" value="<%= user.getPlatform() %>" required>
					<datalist id="platform">
						<option value="PC">
						<option value="PlayStation">
                        <option value="Xbox">
					</datalist>
				</td>
				
				<td>Email Address </td>
				<td>
					<input type="email" name="email" value="<%= user.getEmail() %>" required>
				</td>
			</tr>
			
			<tr>
				<td colspan="4" style="text-align: center;">
					<input type="submit" name="update" value="Update Profile"> <br/>&emsp;
				</td>
			</tr>

        </table>
        </form>
        
        <%} %>
        
    </div>
    
    <div class="mainArea" style="margin-bottom: 0px; padding: 1px;">
		<h1>Change Password</h1>
	</div>
	
	<div class="mainArea" style="padding-top: 40px;">
		
		<form onsubmit="return checkPassword();" method="POST" action="update-password">
		<table align="center">
		
			<tr>
				<td colspan="2" style="text-align: center;"><b>Validate your old password and confirm new password</b></td>
			</tr>
			
			<tr>
				<td>Current Password </td>
				<td>
					<input type="password" name="currentPassword" placeholder="Type your current password" required>
				</td>
			</tr>
			
			<tr>
				<td>New Password </td>
				<td>
					<input id="pass1" type="password" name="password1" placeholder="Type your new password" onKeyUp="checkPassword()" required>
				</td>
			</tr>
			
			<tr>
				<td>Confirm Password </td>
				<td>
					<input id="pass2"  type="password" name="password2" placeholder="Retype password" onKeyUp="checkPassword()" required>
				</td>
			</tr>
			
			<tr>
					<td colspan="2" style="text-align: center;">
					
						<span id="status" style="color: red;"></span>
						
						
					</td>
				</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="Update Password"> <br/>&emsp;
				</td>
			</tr>
			
		</table>
		</form>
		
	</div>
	
	<div class="mainArea" style="margin-bottom: 0px; padding: 1px;">
		<h1>Delete Account</h1>
	</div>
	
	<div class="mainArea" style="padding-top: 40px;">
	
		<form onSubmit="return checkProceed()" method="POST" action="delete-profile">
		
		<table align="center">
		
			<tr>
				<td colspan="2" style="text-align: center;">
				
					<b>Type your password to delete account</b><br/><br/>&nbsp;
					<font color="red"><b>Note: You cannot recover your account once deleted!</b></font>
				
				</td>
			</tr>
			
			<tr>
				<td>Password </td>
				<td>
					<input type="password" name="password" placeholder="Type your current password" required>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					
					<span id="status-delete" style="color: red;"></span>
						
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="Delete Account"> <br/>&emsp;
				</td>
			</tr>
			
		</table>
		
		</form>
	
	</div>
    
    <jsp:include page="WEB-INF/views/scrolltop.jsp"/>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>