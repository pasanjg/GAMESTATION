<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    %>

	<title> News | GameStation </title>
	
	<style>

        h1{
			color:black;
			text-align: center;
			font-size:60px;
            margin: 80px;
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
            height: auto;
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
        	text-align: left;
        	padding: 10px;
        	vertical-align: baseline;
        }
        

	</style>
	
</head>
<body>

	<div class="mainArea" style="margin-bottom: 0px; margin-top: 120px; padding: 1px;">
		<h1>Upcoming Games of 2018</h1>
	</div>
    
    <div class="mainArea">
        
        <table>
        	<tr>
        		<td>
        			<p>
        				<h2>Pillars of Eternity II: Deadfire</h2>
        				The sequel to 2015's well-regarded isometric RPG Pillars of Eternity, Deadfire returns to the world of Eora, 
        				continuing the story of the telepathically gifted Watcher. Comandeer a pirate ship and sail the open-world 
        				tropics of the Deadfire Archipelago in search of the god Eothas, who destroyed the keep you called home by 
        				the end of the original game. Major overhauls include companion A.I., class systems, combat speed, afflictions, 
        				and more.
        				
        			</p>
        		</td>
        		
        		<td>
        			<p>
        				<h2>Watch Trailer</h2>
        				<iframe width="560" height="315" src="https://www.youtube.com/embed/ln_plWALAoI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        			</p>
        		</td>
        	</tr>
        	
        	<tr>
        		<td>
        			<p>
        				<h2>Mount & Blade 2: Bannerlord</h2> 
        				It's been a long wait for the sequel to Mount & Blade: Warband, and it may be a bit longer still, but 
        				previews have indicated a strongly expanded combat system to the cavalry battle simulator. Chief among 
        				those changes is a directional shield blocking system, chain attacks, and a command structure that allows 
        				you to focus on the task at hand while letting your A.I. commander dictate the overall flow of the fight.
        				
        			</p>
        		</td>
        		
        		<td>
        			<p>
        				<h2>Watch Trailer</h2>
        				<iframe width="560" height="315" src="https://www.youtube.com/embed/LmX5DFgRBXk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        			</p>
        		</td>
        	</tr>
        	
        	<tr>
        		<td>
        			<p>
        				<h2>Cyberpunk 2077</h2> 
        				The studio behind The Witcher dives into the world of the Cyberpunk pen-and-paper RPG by Mike Pondsmith, 
        				and all signs point to an even bigger scale than the Witcher 3: Wild Hunt. CD Projekt Red has also 
        				confirmed the game will have some multiplayer elements as well.
        				
        			</p>
        		</td>
        		
        		<td>
        			<p>
        				<h2>Watch Trailer</h2>
        				<iframe width="560" height="315" src="https://www.youtube.com/embed/P99qJGrPNLs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        			</p>
        		</td>
        	</tr>
        	
        	<tr>
        		<td>
        			<p>
        				<h2>Greedfall</h2> 
        				Spiders' RPGs are typically rough and derivative, but the studio is nothing if not prolific, and is back 
        				again with a new roleplaying outing. Greedfall takes aim at European colonialism, set on an island that's 
        				been invaded by colonists, adventurers and treasure hunters who are apparently getting on the nerves of 
        				the indigenous peoples and their supernatural protectors. Expect multiple factions, as well as decisions 
        				(big and small) that change the fate of the island and its inhabitants.
        				
        			</p>
        		</td>
        		
        		<td>
        			<p>
        				<h2>Watch Trailer</h2>
        				<iframe width="560" height="315" src="https://www.youtube.com/embed/zCAUpxLfCbo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        			</p>
        		</td>
        	</tr>
        </table>
        
    </div>
    
    <jsp:include page="WEB-INF/views/scrolltop.jsp"/>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>