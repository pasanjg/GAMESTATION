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
	
		if(user == null || user.getType().equals("user")){
			
			response.sendRedirect("index.jsp");
		}
	
	%>

	<title> Edit | GameStation </title>
	
	<style>

        h1{
			color:black;
			text-align: center;
            margin: 80px;
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
		
		table button{
			height: 40px;
			width: auto;
			margin-top: 50px;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 1px solid red;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
		
		table button:hover{
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
			if(confirm("Do you want to Proceed?")){
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
		<h1>Edit Games</h1>
	</div>
    
    <div class="mainArea" style="padding-top: 40px; height: 300px;">

        <% if(user !=null) { %>
        
        <table align="center">
        	<tr>
        		<td colspan="4" style="text-align: center;">
        			<b>Select the action you want to perform</b> <br> &nbsp;
        		</td>
        	</tr>
        
        	<tr>
        		<td>
					<a href="add-game"><button>Add Games</button></a>&emsp;
				</td>
				
				<td>
					<a href="remove-game"><button>Remove Games</button></a>&emsp;
				</td>
				
				<td>
					<a href="update-game"><button>Update Games</button></a>&emsp;
				</td>
				
				<td>
					<a href="games"><button>Show Games</button></a>&emsp;
				</td>
        	</tr>

        </table>
        
        <%} %>
        
    </div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>