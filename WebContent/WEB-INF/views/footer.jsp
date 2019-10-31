<!DOCTYPE HTML>
<html>
<head>
<style>
</style>
</head>
<body>

	<div class="container-fluid bg-dark text-white py-4">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-2">
					<strong class="text-secondary">CATEGORIES</strong>
					<ul class="list-unstyled">
						<li>Action</li>
						<li>Racing</li>
						<li>Sports</li>
						<li>Puzzle</li>
					</ul>
				</div>
				<div class="col-sm-6 col-md-2">
					<strong class="text-secondary">ABOUT</strong>
					<ul class="list-unstyled">
						<li>Gaming</li>
						<li>Press & News</li>
						<li>Terms of Service</li>
						<li>Privacy Policy</li>
					</ul>
				</div>
				<div class="col-sm-6 col-md-2">
					<strong class="text-secondary">SUPPORT</strong>
					<ul class="list-unstyled">
						<li>Customer Support</li>
						<li>Trust & Safety</li>
					</ul>
				</div>
				<div class="col-sm-6 col col-md-2">
					<strong class="text-secondary">FOLLOW US</strong>
					<ul class="list-unstyled">
						<li>Google</li>
						<li>Facebook</li>
						<li>Instagram</li>
						<li>Twitter</li>
					</ul>
				</div>
				<div class="col-sm-12 col-md-4 text-center">
					<img src="images/logo-white.png" width="250" alt="logo" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center my-4">
					<span style="font-size: 1.5rem;"> <a
						href="https://www.facebook.com" target="blank"> <i
							class="fab fa-facebook-f m-2"></i>
					</a>
					</span> <span style="font-size: 1.5rem;"> <a
						href="https://www.twitter.com" target="blank"> <i
							class="fab fa-twitter m-2"></i></a> </a>
					</span> <span style="font-size: 1.5rem;"> <a
						href="https://www.instagram.com" target="blank"> <i
							class="fab fa-instagram m-2"></i></a> </a>
					</span> <span style="font-size: 1.5rem;"> <a
						href="https://www.youtube.com" target="blank"> <i
							class="fab fa-youtube m-2"></i></a> </a>
					</span>
				</div>
			</div>
		</div>

		<footer class="text-muted text-center">
			<span>Last updated: <%=new java.util.Date()%></span>
			<!-- <span id="date"></span><br> -->
			<p>Copyright &copy; GameStation | Online Gaming Site 2019. All
				Rights Reserved.</p>
		</footer>

	</div>
	<script>
		var today = new Date();
		var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
				+ today.getDate();
		document.getElementById("date").innerHTML = date;
	</script>
</body>
</html>