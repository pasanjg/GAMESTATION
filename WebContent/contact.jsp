<jsp:include page="WEB-INF/views/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

	<%
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    %>

	<title> Contact Us | GameStation </title>
	
	<style>
     
	</style>
	
</head>
<body>
    
    <div class="container gs-top">
       
        <div class="row">
        	<div class="col-12 mt-1"></div>
        </div>
        
        <div class="row justify-content-center my-5">
        
        	<div class="col-md-4 mb-5">
        		<div class="row">
					<div class="col">
						<div class="card px-2 mb-2 text-sm-center text-md-left">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-sm-4">
										<div class="row">
											<div class="col-md-3 text-center">
												<span style="font-size: 1.5rem;">
													<i class="fas fa-tty"></i>
												</span>
											</div>
											<div class="col-md-9 my-2">
												<strong>0114563256</strong>
												<strong>0714563333</strong>
											</div>
										</div>
									</div>
									<div class="col-md-12 col-sm-4">
										<div class="row">
											<div class="col-md-3 my-2 text-center">
												<span style="font-size: 1.5rem;">
													<i class="fas fa-map-marker-alt"></i>
												</span>
											</div>
											<div class="col-md-9 my-2">
												<strong>34/2, New Kandy Rd, Malabe</strong>
											</div>
										</div>
									</div>
									<div class="col-md-12 col-sm-4">
										<div class="row">
											<div class="col-md-3 my-2 text-center">
												<span style="font-size: 1.5rem;">
													<i class="fas fa-at"></i>
												</span>
											</div>
											<div class="col-md-9 my-2">
												<strong>help@gamestation.lk</strong>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="col d-none d-md-block">
						<div class="card p-0 text-sm-center text-md-left overflow-auto">
							<div class="card-body">
								<small>
									We're very approachable and would love to speak to you. Feel free to call, send us an email, 
									meet us or simply complete the inquiry form.
								</small>
							</div>
						</div>
					</div> -->
				</div>
        	</div>
        	
            <div class="col-md-6">
				<div class="card p-4 text-center">
					<h1><b>Need Help?</b></h1>
					<p>Send us your inquiry. We're glad to help you out.</p>
					<div class="card-body">
						<form method="POST" action="contact" autocomplete="off">
							<div class="form-group">
								<input type="text" class="form-control" name="name" placeholder="Enter Your Full Name" required/>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="email" placeholder="Enter Your Email" required/>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" placeholder="Enter your message..." required></textarea>
							</div>
							<button class="btn btn-gs-red" type="submit">Send Message</button>
						</form>
					</div>
				</div>
            </div>
            
        </div>
        
    </div>
    
    <jsp:include page="WEB-INF/views/footer.jsp"/>
    
</body>
</html>