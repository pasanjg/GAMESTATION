<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.gamestation.model.Game"%>
<%@page import="com.gamestation.service.*"%>
<%@page import="com.gamestation.model.User"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<jsp:include page="header.jsp"/>

<html>
<head>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		User user = (User) session.getAttribute("currentSessionUser");
	
		IGameService ob1 = new GameServiceImpl();
	
		String GameID = (String) request.getAttribute("GameID");
		
		if(user == null){
			
			response.sendRedirect("login");
		}
	
	%>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Play game </title>
	
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
        
        .mainArea{
            width: 100%;
            height: 940px;
            margin-top: 70px;
        }
        
        .sideBar{
            width: 260px;
            height: 560px;
            margin-left: 30px;
            margin-right: 20px;
            margin-top: 10px;
            margin-bottom: 30px;
            background-color: black;
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: left;
        }
        
        .content{
            min-width: 900px;
            height: 560px;
            margin-top: 10px;
            margin-bottom: 30px;
            margin-right: 30px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: right;
          
        }
        
        .relatedGame {
            width: 1260px;
            height: 200px;
            margin-bottom: 30px;
            margin-right: 30px;
            margib-left :30px;
            padding: 30px;
            background-color: #d9dada;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: right;
        }
        
        .topic{
        	width: auto;
            height: 40px;
            margin-left: 30px;
            margin-right: 30px;
            margin-top : 90px ;
            background-color: white;
            pading :5px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: center;
        
        }

	</style>
	
</head>

       <script src="//static.miniclipcdn.com/js/game-embed.js"></script>

<body>
    
    <div class="mainArea" style="margin-bottom: 0px; margin-top: 10px; padding: 1px;">
      <div class = "topic" >
      <h2 style="color: #3090C7;"> 
			&nbsp;&nbsp; Playing : <%= ob1.loadGameName(GameID) %> 
 	   </h2>
      </div>
        <div class="sideBar">
			<!-- Add side bar content here -->
			<img src = "images/yourad.jpg" width = "260" height = "270" align = "center">
			<br/><br/>
			<img src = "images/yourad.jpg" width = "260" height = "270" align = "center">
        </div>
        
        
        
        <div class="content">
            <!-- Add main content here -->
            
			 <div class="miniclip-game-embed" data-game-name="<%= ob1.getcode(GameID) %>" data-theme="5" data-width="890" data-height="550" data-language="en" align="center"></div>
			 <p style="text-align:center;">
                           
        </div>
	</div>
    <div>
     <jsp:include page="footer.jsp"/>
    </div>
    
  
    
</body>
</html>
