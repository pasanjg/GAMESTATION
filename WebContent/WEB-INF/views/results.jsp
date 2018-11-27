<%@page import="com.gamestation.model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gamestation.service.IGameService"%>
<%@page import="com.gamestation.service.GameServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		String search = new String();
		search = (String) request.getAttribute("search").toString();
		
		IGameService iGameService = new GameServiceImpl();
		ArrayList<Game> gameList = new ArrayList<Game>();
		gameList = iGameService.searchGame(search);
				
    %>

	<title>Search - <%= search %> | GameStation </title>
	
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
        	width: 50%;
        	height: auto;
        	text-align: center;
        	padding: 10px;
        	vertical-align: baseline;
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
		<h2><%= gameList.size() %> results found matching <font color="red"><%= search %></font></h2>
	</div>
    
    <div class="mainArea">
      	<%if(gameList.size() != 0) { %>
        	<table align="center">
        	<% for(Game showGame : gameList) { %>
        		<tr>
        			<td colspan="2" style="width: 500px">
        				<!-- Add game image & details -->
        				<a href="play-game?GameID=<%= showGame.getGameID() %>" style="color: black">
        					<img src="images/<%= showGame.getGameID() %>.jpg" width="150" alt="<%= showGame.getgameName() %>">
        					<h2><%=showGame.getgameName() %></h2>
        					<h3>Category: <%=showGame.getcategory() %></h3>
        				</a>
        				
        			</td>
	
        			<td style="width: 50px">
        				<!-- Add buttons -->
        				<form method="GET" action="play-game">
							<input type="hidden" name="GameID" value="<%= showGame.getGameID() %>">
				 			<input type="submit" value= "Play Game"/>
				 		</form>
				 	</td>
				 	
				 	<td style="width: 100px">	
				 		<form method="GET" action="add-fav">
							<input type="hidden" name="favourite" value="<%= showGame.getGameID() %>">
				 			<input type="submit" value= "Add to Favourites"/>
				 		</form>
        			</td>
        		</tr>
        		
        		<tr>
        			<td colspan="3"><hr></td>
        		</tr>
        		
        	
        	<% } %>
        	</table>
		<%}else{ %>
		
			<img align="middle" src="images/error.png">
			
			<h1 align="center">Oops! No Result Found. <br/> 
				Make sure all words are spelled correctly or try a different keyword.
			</h1>
			
			<h2 style="color: dimgray;">To find the service you need, you can quickly contact our Customer Support Team. <br/>
				We are glad to help you out.
			</h2>
			
			<a href="contact"><button class="contact">Contact Now</button></a>
		
		<%} %>
        
    </div>
    
    <jsp:include page="scrolltop.jsp"/>
    
    <jsp:include page="footer.jsp"/>
    
</body>
</html>