<jsp:include page="WEB-INF/views/header.jsp" />
<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<title>News | GameStation</title>

<style>
</style>

</head>
<body>

	<div class="container gs-top">
		<div class="row">
			<div class="col-md-12 mx-2 my-5 p-0" id="profile-main">
				<div id="top-bar" class="text-center mb-4">
					<h3>Upcoming Games of 2020</h3>
				</div>
				<!-- ROW 1 -->
				<div class="row ml-0 mr-0">
					<div class="col-sm-12 col-md-6 p-4">
						<h2>Pillars of Eternity II: Deadfire</h2>
						<p class="text-justify">The sequel to 2015's well-regarded
							isometric RPG Pillars of Eternity, Deadfire returns to the world
							of Eora, continuing the story of the telepathically gifted
							Watcher. Comandeer a pirate ship and sail the open-world tropics
							of the Deadfire Archipelago in search of the god Eothas, who
							destroyed the keep you called home by the end of the original
							game. Major overhauls include companion A.I., class systems,
							combat speed, afflictions, and more.</p>
					</div>
					<div class="col-sm-12 col-md-6 p-4 text-center">
						<h2>Watch Trailer</h2>
						<iframe height="300" style="width: 100%"
							src="https://www.youtube.com/embed/ln_plWALAoI" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>

				<hr>

				<!-- ROW 2 -->
				<div class="row ml-0 mr-0">
					<div class="col-sm-12 col-md-6 p-4">
						<h2>Mount & Blade 2: Bannerlord</h2>
						<p class="text-justify">It's been a long wait for the sequel
							to Mount & Blade: Warband, and it may be a bit longer still, but
							previews have indicated a strongly expanded combat system to the
							cavalry battle simulator. Chief among those changes is a
							directional shield blocking system, chain attacks, and a command
							structure that allows you to focus on the task at hand while
							letting your A.I. commander dictate the overall flow of the
							fight.</p>
					</div>
					<div class="col-sm-12 col-md-6 p-4 text-center">
						<h2>Watch Trailer</h2>
						<iframe height="300" style="width: 100%"
							src="https://www.youtube.com/embed/LmX5DFgRBXk" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>

				<hr>

				<!-- ROW 3 -->
				<div class="row ml-0 mr-0">
					<div class="col-sm-12 col-md-6 p-4">
						<h2>Cyberpunk 2077</h2>
						<p class="text-justify">The studio behind The Witcher dives
							into the world of the Cyberpunk pen-and-paper RPG by Mike
							Pondsmith, and all signs point to an even bigger scale than the
							Witcher 3: Wild Hunt. CD Projekt Red has also confirmed the game
							will have some multiplayer elements as well.</p>
					</div>
					<div class="col-sm-12 col-md-6 p-4 text-center">
						<h2>Watch Trailer</h2>
						<iframe height="300" style="width: 100%"
							src="https://www.youtube.com/embed/P99qJGrPNLs" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>

				<hr>

				<!-- ROW 4 -->
				<div class="row ml-0 mr-0">
					<div class="col-sm-12 col-md-6 p-4">
						<h2>Greedfall</h2>
						<p class="text-justify">Spiders' RPGs are typically rough and
							derivative, but the studio is nothing if not prolific, and is
							back again with a new roleplaying outing. Greedfall takes aim at
							European colonialism, set on an island that's been invaded by
							colonists, adventurers and treasure hunters who are apparently
							getting on the nerves of the indigenous peoples and their
							supernatural protectors. Expect multiple factions, as well as
							decisions (big and small) that change the fate of the island and
							its inhabitants.</p>
					</div>
					<div class="col-sm-12 col-md-6 p-4 text-center">
						<h2>Watch Trailer</h2>
						<iframe height="300" style="width: 100%"
							src="https://www.youtube.com/embed/zCAUpxLfCbo" frameborder="0"
							allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="WEB-INF/views/scrolltop.jsp" />

	<jsp:include page="WEB-INF/views/footer.jsp" />
</body>
</html>