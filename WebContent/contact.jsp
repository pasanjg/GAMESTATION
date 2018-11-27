<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    %>

	<title> Contact Us | GameStation </title>
	
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
            width: auto;
            height: 700px;
            margin-top: 70px;
        }
        
        .sideBar{
            width: 260px;
            height: 560px;
            margin-left: 30px;
            margin-right: 20px;
            margin-top: 50px;
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: left;
        }
        
        .content{
            min-width: 900px;
            height: 560px;
            margin-top: 50px;
            text-align: center;
            margin-bottom: 30px;
            margin-right: 30px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            float: right;
        }
        
        input[type="text"], input[type="email"]{
			width:600px;
			height:20px;
            font-size: 16px;
			margin-bottom: 20px;
			border:1px solid gray;
            border-radius: 5px;
			padding:10px;
		}
        
        textarea{
        	font-family: calibri;
        	font-size: 20px;
        	width: 600px;
			height: 150px;
            font-size: 16px;
			margin-bottom: 20px;
			border: 1px solid gray;
            border-radius: 5px;
			padding:10px;
        }
        
        input[type="submit"]{
			height: 50px;
			width: auto;
			padding: 5px;
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
	
</head>
<body>
    
    <div class="mainArea" align="center">
        <div class="sideBar" align="center">
        	<p><font size = "13"><b>CONTACT US</b></font></p>
        	<br>
			<p><img src = "images/call.png" width = "60" height = "60" align = "center" > <font size = "3" > 0114563256 / 0714563333 </font></p>
			<br>
	
			<p><img src = "images/address.png" width = "60" height = "60" align = "center"><font size = "3"> No.24, Galle Rd, Colombo </b></font></p>
			<br>
	
			<p><img src = "images/email.png" width = "60" height = "60" align = "center"> <font size = "3"> contact@gamestation.com </font></p>
        
        </div>
        <div class="content">
            
			<font size = "10" ><b>DROP US A LINE</b></font>

			<br><br><br>
			
			<form method="POST" action="contact">
				  <input type = "text" name = "name" placeholder = "Enter Your Full Name" required/><br><br>
				  <input type = "email" name = "email" placeholder = "Enter Your Email" required/><br><br>
				  <textarea rows="" cols="" name="message" placeholder="Enter your message" required></textarea><br><br>
				  <input type = "submit" value = "Send Message"/>
			</form>
            
            
            
        </div>
    </div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>