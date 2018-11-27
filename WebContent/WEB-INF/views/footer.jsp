<!DOCTYPE HTML>
<html>
<head>
        <style>
            
            body{
                
                font-family: calibri;
                margin: 0px;
            }
        
            .mainFooter{
                
	            height: auto;
	            width: auto;
                margin-left:auto;
                margin-right: auto;
	            background-color: #363636;
	            padding: 30px;
            }
            
            .details th, .details td{
                color: white;
                text-align: left;
            }
            
            .details th{
                color: dimgray;
            }
            
            
            
        </style>
    </head>
    <body>
    
        <div class="mainFooter">    
            <div class="details">
                <table align="center">
                    <tr>
                    	<th style="width: 300px;">CATEGORIES</th>
                        <th style="width: 300px;">ABOUT</th>
                        <th style="width: 300px;">SUPPORT</th>
                        <th>FOLLOW US</th>
                    </tr>
                
                    <tr>
                    	<td>Action</td>
                        <td>Gaming</td>
                        <td>Customer Support</td>
                        <td>Google</td>
                    </tr>
                
                    <tr>
                    	<td>Racing</td>
                        <td>Press & News</td>
                        <td>Trust & Safety</td>
                        <td>Facebook</td>
                    </tr>
                
                    <tr>
                    	<td>Sport</td>
                        <td>Terms of Service</td>
                        <td></td>
                        <td>Instagram</td>

                    </tr>
                    
                    <tr>
                    	<td>Puzzle</td>
                        <td>Privacy Policy</td>
                        <td></td>
                        <td>Twitter</td>
                        
                    </tr>
                </table>
                <br/>
            </div>
            <footer style="color: dimgray; text-align: center;">
            	Last updated: <%= new java.util.Date() %><br/>
            	Copyright &copy; GameStation | Online Gaming Site 2018. All Rights Reserved.
            </footer>
        </div>
    </body>
</html>