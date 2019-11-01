<%@page import="com.gamestation.model.User"%>
<%@page import="com.gamestation.service.IGameService"%>
<%@page import="com.gamestation.service.GameServiceImpl"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>

<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		User user = (User) session.getAttribute("currentSessionUser");
		
		String confirm = (String) request.getAttribute("confirmString");
		
		String confirmAddOrRem = (String) request.getAttribute("confirm");
		
		ArrayList<String> arrayList = new ArrayList<String>();
		IGameService iGameService = new GameServiceImpl();
		
		if(user == null){
			
			response.sendRedirect("login");
		}
	
	%>
	
	<% if(user !=null) { %>
	
	<title> <%=user.getUserName()%> | GameStation </title>
	
	<% } %>
	
	<style>

        h1{
			color:black;
			text-align: center;
			font-size: 30px;
            margin: 0px;
		}
        
		body{
			
			margin: 0px;
		}
        
        .mainArea{
            width: auto;
            min-height: 700px;
            margin-top: 100px;
        }
        
        .sideBar{
           width: 260px;
            height: 560px;
            margin-left: 30px;
            margin-right: 20px;
            margin-top: 10px;
            margin-bottom: 30px;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: left;
        }
        
        .content{
            min-width: 900px;
            height: 560px;
            margin-top: 10px;
            text-align: center;
            margin-bottom: 30px;
            margin-right: 30px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: right;
            overflow: auto;
          
        }
        
        input[type="button"], input[type="submit"], .play{
			height: 40px;
			width: auto;
			font-size: 16px;
			color: white;
			background-color: red;
			border: 1px solid red;
			border-radius: 5px;
			transition: background-color 0.2s ease-in-out;
		}
        
        input[type="button"]:hover, input[type="submit"]:hover, .play:hover{
			color: red;
			background-color: white;
			border: 1px solid red;
			border-radius: 5px;
		}
		
        
	</style>
	
</head>
<body>
    
    <div class="mainArea">
        <div class="sideBar">
        
			<!-- Add side bar content here -->
			
			<% if(user != null) { 
			
				arrayList = iGameService.getFav(user.getUserID());
			%>
			
			<form action="edit">
			<table align="center">
			
				<tr>
					<td colspan="2">
						<h2 align="center"><%= user.getFirstName() +" "+ user.getLastName()%><br> 
						<span><%= user.getUserName() %></span></h2>
					</td>
				</tr>
				
				<tr>
					<td><h4>ID&nbsp; &nbsp;</h4></td>
					<td align="right"><h4><%= user.getUserID() %></h4></td>
				</tr>
				
				<tr>
					<td><h4>Platform &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h4> </td>
					<td align="right"><h4><%= user.getPlatform() %></h4></td>			
				</tr>
				
				<tr>
					<td><h4>From&nbsp;</h4></td>
					<td align="right"><h4><%= user.getCountry() %></h4></td>
				</tr>
				
				<tr>
					<td><h4>Gender&nbsp;</h4></td>
					<td align="right"><h4><%= user.getGender() %></h4></td>
				</tr>
				
				<tr>
					<td><h4>Type&nbsp;</h4></td>
					<td align="right"><h4><%= user.getType() %></h4></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"> <a href="settings"><input type="button" value="Edit Profile"></a></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"> 
					
						<% if(confirm != null) { %>
        					<p style="color: green;" align="center"><br/><%= confirm %></p>
        				<%} %>
					
					</td>
				</tr>
			
			</table>
			</form>
			
			<% } %>
			
			
        </div>
        <div class="content">
            
			<!-- Add main content here -->
			
			<h1>Favourites</h1>
			<%if(confirmAddOrRem != null) {%>
				<p align="center" style="color: green; text-align: center;"><%= confirmAddOrRem %></p>
			<%} %>
			
		<%if(arrayList.size() != 0) { %>
			
			<table align="center">
			<%	
				for(String gameID : arrayList){
			%>
            
            	<tr>
        			<td colspan="2" style="width: 200px">
        				<!-- Add game image & details -->
        				<a href="play-game?GameID=<%= gameID %>" style="color: black">
        					<img src="images/<%= gameID %>.jpg" width="80" alt="<%= gameID %>">
        					<h3><%= iGameService.loadGameName(gameID) %></h3>
        				</a>
        				
        			</td>
	
        			<td style="width: 200px">
        				<!-- Add buttons -->
        				<form method="GET" action="play-game">
							<input type="hidden" name="GameID" value="<%= gameID %>">
				 			<input type="submit" value= "Play Game"/>
				 		</form>
				 	</td>
				 	
				 	<td style="width: 200px">	
				 		<form method="GET" action="remove-fav">
							<input type="hidden" name="GameID" value="<%= gameID %>">
				 			<input type="submit" value= "Remove"/>
				 		</form>
        			</td>
        		</tr>
        		
        		<tr>
        			<td colspan="3"><hr></td>
        		</tr>
            	
            <%} %>
            </table>
            
        <%} else {%>
        
        	<img align="middle" src="images/error.png">
			
			<h1 align="center">Oops! Your list is empty. <br/> 
				But it doesn't have to be.
			</h1>
			
			<h2 style="color: dimgray;">Join our play area now and add games to your favourites. <br/>
				Keep Gaming!
			</h2>
			
			<a href="games"><button class="play">Play Now</button></a>
		
		<%} %>
            
            
        </div>
    </div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>