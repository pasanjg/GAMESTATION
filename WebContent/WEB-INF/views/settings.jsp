<%@page import="com.gamestation.model.User"%>
<jsp:include page="WEB-INF/views/header.jsp" />
<!DOCTYPE html>
<html>
<head>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	User user = (User) session.getAttribute("currentSessionUser");
	String error = (String) request.getAttribute("errorString");
	String delete_error = (String) request.getAttribute("delete_error");

	if (user == null) {

		response.sendRedirect("login.jsp");
	}
%>

<title>Edit | GameStation</title>

<style>
</style>

<script type="text/javascript">
	function checkPassword() {
		var password1 = document.getElementById('pass1').value;
		var password2 = document.getElementById('pass2').value;

		if ((password1 == null && password2 == null)
				|| (password1 == "" && password2 == "")) {
			document.getElementById('status').innerHTML = "Password cannot be empty!";
			return false;
		} else if (password1 == password2) {
			document.getElementById('status').innerHTML = "Passwords Match!";
			return true;
		} else {
			document.getElementById('status').innerHTML = "Passwords Do Not Match!";
			return false;
		}
	}

	function checkProceed() {
		if (confirm("You are trying to delete your account. It cannot be recovered again.")) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>

	<div class="container gs-top">
		<div class="row pt-5">
			<div class="col-sm-12 col-md-3 mt-5 p-4 h-auto" id="profile-details">
				<div class="tablinks" style="color: gray"
					onclick="openTab(this, 'edit-profile', 'green')" id="defaultOpen">
					<span style="font-size: 1.5rem;">
						<h5>
							<i class="fas fa-user-edit"></i> Edit Profile
						</h5>
					</span>
				</div>
				<hr>
				<div class="tablinks" style="color: gray"
					onclick="openTab(this, 'change-pass', 'blue')">
					<span style="font-size: 1.5rem;">
						<h5>
							<i class="fas fa-key"></i> Change Password
						</h5>
					</span>
				</div>
				<hr>
				<div class="tablinks" style="color: gray"
					onclick="openTab(this, 'delete-account', 'red')">
					<span style="font-size: 1.5rem;">
						<h5>
							<i class="fas fa-minus-circle"></i> Delete Account
						</h5>
					</span>
				</div>
			</div>
			<div class="col-md-8 mx-4 mb-4 p-0" id="profile-main">
				<div id="top-bar" class="text-center px-3">
					<h3>Settings</h3>
				</div>
				<div class="row ml-0 mr-0 pb-4 px-3">
					<div class="m-auto w-100 text-center">
						<%
							if (error != null) {
						%>
						<p style="color: red;">
							Action Failed!
							<%=error%></p>
						<%
							}
						%>

						<%
							if (delete_error != null) {
						%>
						<p style="color: red;">
							Action Failed!
							<%=delete_error%></p>
						<%
							}
						%>
					</div>

					<div id="edit-profile"
						class="tabcontent-settings m-auto w-100 pt-4 px-5">
						<!-- SECTION 01 -->
						<%
							if (user != null) {
						%>
						<form action="update-profile" method="POST">
							<table class="table table-borderless" align="center">
								<tr>
									<td>
										<div class="form-group">
											<input type="text" name="firstName" class="form-control"
												value="<%=user.getFirstName()%>" placeholder="First Name"
												required>
										</div>
									</td>
									<td>
										<div class="form-group">
											<input type="text" name="lastName" class="form-control"
												value="<%=user.getLastName()%>" placeholder="Last Name"
												required>
										</div>
									</td>
								</tr>
								<tr>
									<%
										if (user.getGender().equals("Male")) {
									%>
									<td>
										<div class="form-group m-auto w-100 text-center">
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="male" name="gender" value="Male"
													checked="checked" class="custom-control-input" required>
												<label class="custom-control-label" for="male">Male</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="female" name="gender" value="Female"
													class="custom-control-input" required> <label
													class="custom-control-label" for="female">Female</label>
											</div>
										</div>
									</td>
									<%
										} else {
									%>
									<td>
										<div class="form-group m-auto w-100 text-center">
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="male" name="gender" value="Male"
													class="custom-control-input" required> <label
													class="custom-control-label" for="male">Male</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="female" name="gender" value="Female"
													checked="checked" class="custom-control-input" required>
												<label class="custom-control-label" for="female">Female</label>
											</div>
										</div>
									</td>
									<%
										}
									%>

									<td>
										<div class="form-group">
											<input class="custom-select" list="country" name="country"
												placeholder="Select your country"
												value="<%=user.getCountry()%>" required>
											<datalist id="country">
												<option value="Sri Lanka">
												<option value="India">
												<option value="China">
												<option value="United States">
											</datalist>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<input class="custom-select" list="platform" name="platform"
												placeholder="Select one" value="<%=user.getPlatform()%>"
												required>
											<datalist id="platform">
												<option value="PC">
												<option value="PlayStation">
												<option value="Xbox">
											</datalist>
										</div>
									</td>

									<td>
										<div class="form-group">
											<input type="email" name="email" class="form-control"
												value="<%=user.getEmail()%>" required>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center;"><input
										class="btn btn-gs-red" type="submit" name="update"
										value="Update Profile"> <br />&emsp;</td>
								</tr>
							</table>
						</form>
						<%
							}
						%>
					</div>

					<div id="change-pass" class="tabcontent-settings m-auto w-100 px-5">
						<!-- SECTION 02 -->
						<form onsubmit="return checkPassword();" method="POST"
							action="update-password">
							<table class="table table-borderless" align="center">

								<tr>
									<td>
										<div class="form-group">
											<input type="password" name="currentPassword"
												class="form-control"
												placeholder="Type your current password" required>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="form-group">
											<input id="pass1" type="password" name="password1"
												class="form-control" placeholder="Type your new password"
												onKeyUp="checkPassword()" required>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="form-group">
											<input id="pass2" type="password" name="password2"
												class="form-control" placeholder="Retype new password"
												onKeyUp="checkPassword()" required>
										</div>
									</td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><span
										id="status" style="color: red;"></span></td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><input
										type="submit" class="btn btn-gs-red" value="Update Password">
										<br />&emsp;</td>
								</tr>

							</table>
						</form>
					</div>

					<div id="delete-account"
						class="tabcontent-settings m-auto w-100 p-5 px-5">
						<!-- SECTION 03 -->
						<form onSubmit="return checkProceed()" method="POST"
							action="delete-profile">

							<table class="table table-borderless" align="center">
								<tr>
									<td colspan="2" style="text-align: center;"><font
										color="red"> <b>Note: You cannot recover your
												account once deleted!</b><br> <br>
									</font></td>
								</tr>

								<tr>
									<td>
										<div class="form-group">
											<input type="password" name="password" class="form-control"
												placeholder="Type your current password" required>
										</div>
									</td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><span
										id="status-delete" style="color: red;"></span></td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><input
										type="submit" class="btn btn-gs-red" value="Delete Account">
										<br />&emsp;</td>
								</tr>
							</table>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script>
		function openTab(evt, tabName, color) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent-settings");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].style.color = "gray";
			}
			document.getElementById(tabName).style.display = "block";
			evt.style.color = "#000";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

	<jsp:include page="WEB-INF/views/scrolltop.jsp" />

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>
</html>