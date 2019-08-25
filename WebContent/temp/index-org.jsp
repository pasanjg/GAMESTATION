<%@page import="com.gamestation.model.User"%>
<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE HTML>

<html>
    <head>
    
    <%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
    	User user = (User) session.getAttribute("currentSessionUser");
    %>
    
    <title>GameStation | Online Gaming Site</title>
        
    <style>
        
        .mainImage{
            width: auto;
            text-align: center;
            height: 500px;
            background-image: url(images/banner.jpg);
			background-size: cover;
    		background-repeat: no-repeat;
    		background-position: center center;
    		margin-top: 70px;
        }
        
        .gamers{
            width: auto;
            text-align: center;
            color: white;
            background-color: #e74c3c;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            height: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 40px;
        }
        
        .subContent{
        	background-size: contain;
        	background-repeat: no-repeat;
        	background-position: center center;
        	transition: transform 0.1s;
        }
        
        .subContent:hover{
			transform: scale(1.1);
        }
        
        .gamers a{
        	transition: color 0.2s;
        }
                
        .gamers a:hover{
        	color: #FFB900;
        }
        
        .about{
            width: auto;
            height: 300px;
            text-align: left;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 20px;
            padding-top: 10px;
        }
        
        .aboutContent{
            width: 800px;
            height: 200px;
            font-size: 20px;
            float: left;
        }
        
        .mainLogo{
            width: 200px;
            height: 200px;
            background-image: url(images/logo.png);
            background-size: cover;
    		background-repeat: no-repeat;
    		background-position: center center;
            float: right;
        }
        
        table #heading{
            font-size: 30px;
        }
        
        a{
        	text-decoration: none;
        	color: inherit;
        }
        
        
    </style>

        
    </head>
    <body>

	<!-- 
	<div class="mainImage">
        
    </div>
    -->
    
    <jsp:include page="WEB-INF/views/carousel.jsp"/>
    
    <div class="gamers">
        <h1>GAMERS ON ANY PLATFORM</h1>
        <table width="1200" align="center">
        <tr id="heading">
            <th width="300" height="50">PlayStation</th>
            <th width="300" height="50">PC</th>
            <th width="300" height="50">Xbox</th>
        </tr>
        <tr>
            <th class="subContent" width="300" height="300" style="background-image: url(images/ps4.png); background-size: cover;"></th>
            <th class="subContent" width="300" height="300" style="background-image: url(images/pc.png); background-size: cover;"></th>
            <th class="subContent" width="300" height="300" style="background-image: url(images/xboxone.png); background-size: cover;"></th>
        </tr>
        <tr id="heading">
        <%if(user == null){ %>
        	<th colspan="3"><a href="register">Register Now!</a></th>
        <%}else{ %>
        	<th colspan="4"><a href="games">Play Now!</a></th>
        <%} %>
        </tr>
        </table>
    </div>
    
    <div class="gamers" style="background-color: #717171;">
        <h1>GAMING CATEGORIES</h1>
        <table width="1200" align="center">
        <tr id="heading">
            <th width="300" height="50">Action</th>
            <th width="300" height="50">Racing</th>
            <th width="300" height="50">Sports</th>
            <th width="300" height="50">Puzzle</th>
        </tr>
        <tr>
            <th class="subContent" width="300" height="300" style="background-image: url(images/action.png);"></th>
            <th class="subContent" width="300" height="300" style="background-image: url(images/racing.png);"></th>
            <th class="subContent" width="300" height="300" style="background-image: url(images/sports.png);"></th>
            <th class="subContent" width="300" height="300" style="background-image: url(images/puzzle.png);"></th>
        </tr>
        <tr id="heading">
        <%if(user == null){ %>
        	<th colspan="4"><a href="register">Register Now!</a></th>
        <%}else{ %>
        	<th colspan="4"><a href="games">Play Now!</a></th>
        <%} %>
        </tr>
        </table>
    </div>
    
    <div class="gamers" style="background-color: white;">
        <h1 style="color: black;">PlayerUnknown's Battlegrounds Gameplay</h1>
        
        <iframe width="1200" height="540" src="https://www.youtube-nocookie.com/embed/dHuk72sMljE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        
    </div>
        
    <div class="about">
        <h1>About Us</h1>
        <div class="aboutContent">
            <p>
                Welcome to GameStation. This is the best platform to all your gaming related needs that also helps players to communicate with the most up-to-date technology.
                <br/>GameStation is a high-end enthusiast online gaming site offering the best in high performance gaming with a reliable and exceptional customer service.
            </p>
        </div>
        <div class="mainLogo"></div>
    </div>
    
    <jsp:include page="WEB-INF/views/scrolltop.jsp"/>
    
	<jsp:include page="WEB-INF/views/footer.jsp"/>
</body>
</html>