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

    </style>

        
    </head>
    <body>
    
    <div class="container-fluid px-0">
    
    <jsp:include page="WEB-INF/views/carousel.jsp"/>
    
    <div class="main col-md-12 text-center text-white my-5 py-5" style="background-color: #e74c3c;">
        <div class="container">
            <strong><h3 class="font-weight-bold">GAMERS ON ANY PLATFORM</h3></strong><br>
            <div class="row">
                <div class="col-md-4">
                    <h3>PlayStation</h3>
                    <img class="img-responsive sub-content" src="images/ps4.png"/>
                </div>
            
                <div class="col-md-4">
                    <h3>PC</h3>
                    <img class="img-responsive sub-content" src="images/pc.png"/>
                </div>
            
                <div class="col-md-4">
                    <h3>Xbox</h3>
                    <img class="img-responsive sub-content" src="images/xboxone.png"/>
                </div>
            </div>
            
            <%if(user == null){ %>
                <h2 colspan="3"><a href="register">Register Now!</a></h2>
            <%}else{ %>
                <h2 colspan="4"><a href="games">Play Now!</a></h2>
            <%} %>
        </div>
    </div>
    
    <div class="main col-md-12 text-center text-white my-5 py-5" style="background-color: #717171;">    
        <div class="container">
            <strong><h3 class="font-weight-bold">GAMING CATEGORIES</h3></strong><br>
            <div class="row">
                <div class="col-md-3">
                    <h3>Action</h3>
                    <img class="img-responsive sub-content" src="images/action.png"/>
                </div>
            
                <div class="col-md-3">
                    <h3>Racing</h3>
                    <img class="img-responsive sub-content" src="images/racing.png"/>
                </div>
            
                <div class="col-md-3">
                    <h3>Sports</h3>
                    <img class="img-responsive sub-content" src="images/sports.png"/>
                </div>
                
                <div class="col-md-3">
                    <h3>Puzzle</h3>
                    <img class="img-responsive sub-content" src="images/puzzle.png"/>
                </div>
            </div><br>
            
            <%if(user == null){ %>
                <h2 colspan="3"><a href="register">Register Now!</a></h2>
            <%}else{ %>
                <h2 colspan="4"><a href="games">Play Now!</a></h2>
            <%} %>
        </div>
    </div>
    
    <div class="main col-md-12 text-center my-5 py-5">
    	<div class="container">
    		<h1>PlayerUnknown's Battlegrounds Gameplay</h1><br>
        	<div class="embed-container">
        	<iframe src='https://www.youtube.com/embed/dHuk72sMljE' frameborder='0' allowfullscreen></iframe>
        	</div>
    	</div>
    </div>
        
    <div class="main col-md-12 my-5 py-5 text-center">
    	<div class="container">
    	<h1>About Us</h1><br>
    		<div class="row">
            	<div class="col-md-9 text-left justify-content">
                	<p>
                    	"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, 
                        totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta 
                        sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia 
                        consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem 
                        ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt 
                        ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem 
                        ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure 
                        reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem 
                        eum fugiat quo voluptas nulla pariatur?"
                	</p>
            	</div>
            	<div class="col-md-3 sub-content">
        	    	<img class="img-responsive" src="images/logo.png"/>
            	</div>            	
        	</div>
    	</div>
    </div>
    
    <jsp:include page="WEB-INF/views/scrolltop.jsp"/>
    
	<jsp:include page="WEB-INF/views/footer.jsp"/>
	
	</div>
</body>
</html>