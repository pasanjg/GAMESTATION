<%@page import="com.gamestation.model.User"%>
<%@page import="com.gamestation.service.IUserService"%>
<%@page import="com.gamestation.service.UserServiceImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		User user = (User) session.getAttribute("currentSessionUser");
	
		if(user == null){
			
			response.sendRedirect("login.jsp");
		}
	
	%>
	
	<% if(user !=null) { %>
	<title> Welcome <%=user.getUserName()%> | GameStation </title>
	<%} %>
	
	<style>

        h1{
			color:black;
			text-align: center;
			font-size: 50px;
            margin: 40px;
		}
		
		h2{
			color:black;
			text-align: center;
			font-size: 30px;
            margin: 20px;
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
        
        .user td{
        	height: 50px;
            text-align: left;
            font-size: 20px;
            vertical-align: baseline;
            margin: 10px;
        }
        
        a{
            text-decoration: none;
            color: dodgerblue;
        }
        
        a:hover{
            color: #e74c3c;
        }

		.profile{
			height: 50px;
			width: 120px;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 1px solid red;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
        
        .profile:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
        
	</style>
	
</head>
<body>

	

	<div class="content">
	<h1>Thank You <br/> for Registering at GameStation</h1>
	<h2>Welcome <%=user.getUserName()%></h2>
	<hr/>
	<div class = "container">
        
        <% if(user !=null) { %>
        
        <table align="center" class="user">
        <%
        	IUserService iUserService = new UserServiceImpl();
			ArrayList<User> arrayList = iUserService.getUser(user.getUserID());
			
			for(User player : arrayList){
		%>

				<tr>
					<td>First Name </td>
					<td>
						<%=player.getFirstName()%>
					</td>
				</tr>
                
                <tr>
					<td>Last Name </td>
					<td>
						<%=player.getLastName()%>
					</td>
				</tr>

				<tr>
					<td>Gender </td>
					<td>
						<%=player.getGender()%>
					</td>
				</tr>
				
				<tr>
					<td>Country </td>
					<td>
						<%=player.getCountry()%>
                    </td>
				</tr>
                
                <tr>
					<td>Gaming Platform &emsp;</td>
					<td>
						<%=player.getPlatform()%>
					</td>
				</tr>
				
				<tr>
					<td>Username </td>
					<td>
						<%=player.getUserName()%>
					</td>
				</tr>

				<tr>
					<td>Email Address </td>
					<td>
						<%=player.getEmail()%>
					</td>
				</tr>
				
				<tr>
					<td>User Type </td>
					<td>
						<%=player.getType()%>
					</td>
				</tr>
				
		<%} %>

		</table>
			
		<%	
			}
        %>
			
			<a href="profile"><button class="profile">View Profile</button></a>
        
    </div>
    </div>
    
<jsp:include page="footer.jsp"/>
    
</body>
</html>