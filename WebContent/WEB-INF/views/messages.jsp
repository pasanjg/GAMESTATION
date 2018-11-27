<%@page import="com.gamestation.model.Contact"%>
<%@page import="com.gamestation.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gamestation.service.IContactService"%>
<%@page import="com.gamestation.service.ContactServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		String deleteMsg = (String) request.getAttribute("deleteMsg");
		
		User user = (User) session.getAttribute("currentSessionUser");
		
		IContactService iContactService = new ContactServiceImpl();
		ArrayList<Contact> contactList = new ArrayList<Contact>();
		contactList = iContactService.getMessages();
		
		if(user == null || user.getType().equals("user")){
			
			response.sendRedirect("index.jsp");
		}
				
    %>

	<title>Messages | GameStation </title>
	
	<style>
	
		img{
			margin-top: 40px;
		}

        h1{
			color:black;
			margin-top: 0px;
			text-align: center;
			font-size: 30px;
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
            min-height: 600px;
            text-align: center;
            margin-top: 50px;
            margin-bottom: 70px;
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
        	width: 40%;
        	height: auto;
        	text-align: center;
        	padding: 10px;
        }
        
        input[type="submit"], .contact{
			height: 40px;
			width: auto;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 1px solid red;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
        
        input[type="submit"]:hover, .contact:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
        

	</style>
	
</head>
<body>

	<div class="mainArea" style="min-height: auto; margin-bottom: 0px; margin-top: 120px; padding: 1px;">
		<h2>You have <font color="red"><%= contactList.size() %></font> messages to respond</h2>
		<% if(deleteMsg != null) { %>
        	<p style="color: green;" align="center"><br/><%= deleteMsg %></p>
        <%} %>
	</div>
    
    <div class="mainArea">
      	<%if(contactList.size() != 0) { %>
      	<div style="max-width: 900px; margin: auto;">
        	<table align="center">
        	<h4>Delete messages once you have taken actions!</h4>
        	
        	<% for(Contact showMessage : contactList) { %>
        		<tr>
        		
        			<td style="text-align: left;"><b>Message ID</b></td>
        			<td style="text-align: left;"><%= showMessage.getMessageID() %></td>
        			<td rowspan="4">	
				 		<form method="POST" action="delete-message">
							<input type="hidden" name="mid" value="<%= showMessage.getMessageID() %>">
				 			<input type="submit" value= "Delete"/>
				 		</form>
        			</td>
        			
        		</tr>

        		<tr>
        			
        			<td style="text-align: left;"><b>From</b></td>
        			<td style="text-align: left;"><%= showMessage.getName() %></td>
        		
        		</tr>
        		
        		<tr>
        			
        			<td style="text-align: left;"><b>Email</b></td>
        			<td style="text-align: left;"><%= showMessage.getEmail() %></td>
        		
        		</tr>
        		
        		<tr>
        		
        			<td colspan="3" style="text-align: center; overflow: auto;">
        				<b>Message</b><br/><br/>
        				<%= showMessage.getMessage() %>
        			</td>
        		
        		</tr>
        		
        		<tr>
        			<td colspan="3"><hr></td>
        		</tr>
        		
        	
        	<% } %>
        	</table>
        </div>
		<%}else{ %>
		
			<img align="middle" src="images/error.png">
			
			<h2 style="color: dimgray;">No Messages</h2>
		
		<%} %>
        
    </div>
    
    <jsp:include page="scrolltop.jsp"/>
    
    <jsp:include page="footer.jsp"/>
    
</body>
</html>