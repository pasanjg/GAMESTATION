<!DOCTYPE HTML>
<html>
<head>
        <style>
                   
        </style>
    </head>
    <body>
    
        <div class="container-fluid bg-dark text-white py-3">                
            <div class="container">
            	<div class="row">
            		<div class="col-sm-6 col col-md-3">
            			<strong class="text-secondary">CATEGORIES</strong>
            			<ul class="list-unstyled">
  							<li>Action</li>
  							<li>Racing</li>
  							<li>Sports</li>
  							<li>Puzzle</li>
						</ul>
            		</div> 
            		<div class="col-sm-6 col-md-3">
            			<strong class="text-secondary">ABOUT</strong>
            			<ul class="list-unstyled">
  							<li>Gaming</li>
  							<li>Press & News</li>
  							<li>Terms of Service</li>
  							<li>Privacy Policy</li>
						</ul>
            		</div>
            		<div class="col-sm-6 col-md-3">
            			<strong class="text-secondary">SUPPORT</strong>
            			<ul class="list-unstyled">
  							<li>Customer Support</li>
  							<li>Trust & Safety</li>
						</ul>
            		</div>
            		<div class="col-sm-6 col col-md-3">
            			<strong class="text-secondary">FOLLOW US</strong>
            			<ul class="list-unstyled">
  							<li>Google</li>
  							<li>Facebook</li>
  							<li>Instagram</li>
  							<li>Twitter</li>
						</ul>
            		</div>            
            	</div>
            </div>
            
            <footer style="color: dimgray; text-align: center;">
            	Last updated: <%= new java.util.Date() %><br/>
            	<!-- <span id="date"></span><br> -->
            	<span>Copyright &copy; GameStation | Online Gaming Site 2018. All Rights Reserved.</span>
            </footer>
            
        </div>
        <script>
        	var today = new Date();
        	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        	document.getElementById("date").innerHTML = date;
        </script>
    </body>
</html>