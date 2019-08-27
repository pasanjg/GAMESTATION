<html>
<head>

	<%
		response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setDateHeader ("Expires", 0);
		//prevents caching at the proxy server
	%>

    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="carousel.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="carousel.js"></script>
  	
  	<style>
  	
  	</style>

</head>

<body>

<div class="mainCarousel gs-top">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1" ></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/1.jpg" alt="...">
      <div class="carousel-caption">
        <!-- Caption Goes Here -->
      </div>
    </div>
    <div class="item">
      <img src="images/2.jpg" alt="...">
      <div class="carousel-caption">
        <!-- Caption Goes Here -->
      </div>
    </div>
    <div class="item">
      <img src="images/3.jpg" alt="...">
      <div class="carousel-caption">
        <!-- Caption Goes Here -->
      </div>
    </div>
    <div class="item">
      <img src="images/4.jpg" alt="...">
      <div class="carousel-caption">
        <!-- Caption Goes Here -->
      </div>
    </div>
    <div class="item">
      <img src="images/5.jpg" alt="...">
      <div class="carousel-caption">
        <!-- Caption Goes Here -->
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"> &#8249; </span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"> &#8250; </span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>

</body>

</html>