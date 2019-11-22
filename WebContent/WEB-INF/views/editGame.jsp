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
	String confirm = (String) request.getAttribute("confirmString");

	if (user == null || user.getType().equals("user")) {

		response.sendRedirect("index.jsp");
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
		if (confirm("Do you want to Proceed?")) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>

	<div class="container gs-top">
		<div class="row pt-5 mb-5">
			<div class="col-sm-12 col-md-3 mt-5 p-4" id="profile-details"
				style="height: 180px;">
				<div class="tablinks" style="color: gray; cursor: pointer;"
					onclick="openTab(this, 'add-games', 'green')" id="defaultOpen">
					<span style="font-size: 1.5rem;">
						<h6>
							<i class="fas fa-user-edit"></i> Add Games
						</h6>
					</span>
				</div>
				<hr>
				<div class="tablinks" style="color: gray; cursor: pointer;"
					onclick="openTab(this, 'update-games', 'blue')">
					<span style="font-size: 1.5rem;">
						<h6>
							<i class="fas fa-key"></i> Update Games
						</h6>
					</span>
				</div>
				<hr>
				<div class="tablinks" style="color: gray; cursor: pointer;"
					onclick="openTab(this, 'remove-games', 'red')">
					<span style="font-size: 1.5rem;">
						<h6>
							<i class="fas fa-minus-circle"></i> Remove Games
						</h6>
					</span>
				</div>
			</div>

			<div class="col-md-8 mx-4 mb-4 p-0" id="profile-main">
				<div id="top-bar" class="text-center px-3">
					<h3>Edit Games</h3>
				</div>
				<div class="row ml-0 mr-0 pb-4 px-3" style="min-height: 450px;">
					<%
						if (confirm != null) {
					%>
					<p class="w-100 text-center" style="color: green;" align="center">
						<br /><%=confirm%></p>
					<%
						}
					%>

					<div id="add-games" class="tabcontent-settings m-auto w-100 px-5">
						<!-- SECTION 01 -->
						<form name="add-game" method="POST" action="add-game">
							<table class="table table-borderless" align="center">
								<tr>
									<td colspan="2">
										<div class="form-group">
											<input type="text" name="gameName" class="form-control"
												placeholder="Game Name" required />
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<input type="text" name="codeTag" class="form-control"
												placeholder="Enter the game code" required>
										</div>
									</td>
									<td>
										<div class="form-group">
											<input type="text" name="tag" class="form-control"
												placeholder="Enter keywords. Seperate with a space" required>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group m-auto w-100 text-center">
											<label class="col-form-label col-12 pt-0">Select
												category of the game</label>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="action" name="category"
													value="Action" checked="checked"
													class="custom-control-input" required> <label
													class="custom-control-label" for="action">Action</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="racing" name="category"
													value="Racing" class="custom-control-input" required>
												<label class="custom-control-label" for="racing">Racing</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="sport" name="category" value="Sport"
													class="custom-control-input" required> <label
													class="custom-control-label" for="sport">Sport</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="puzzle" name="category"
													value="Puzzle" class="custom-control-input" required>
												<label class="custom-control-label" for="puzzle">Puzzle</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="other" name="category" value="Other"
													class="custom-control-input" required> <label
													class="custom-control-label" for="other">Other</label>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><input
										class="btn btn-gs-red" type="submit" value="Add game">
										<input class="btn btn-gs-red" type="reset" value="Reset">
									</td>
								</tr>
							</table>
						</form>
					</div>

					<div id="update-games"
						class="tabcontent-settings m-auto w-100 pt-4 px-5">
						<!-- SECTION 02 -->
						<form name="update-game" method="POST" action="update-game">
							<table class="table table-borderless" align="center">
								<tr>
									<td colspan="2">
										<div class="form-group">
											<input type="text" name="gameID" class="form-control"
												placeholder="Game ID" required />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group">
											<input type="text" name="gameName" class="form-control"
												placeholder="Game Name" required />
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group">
											<input type="text" name="gametag" class="form-control"
												placeholder="Enter keywords. Seperate with a space" required>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="form-group m-auto w-100 text-center">
											<label class="col-form-label col-12 pt-0">Select
												category of the game</label>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="action" name="gameCategory"
													value="Action" checked="checked"
													class="custom-control-input" required> <label
													class="custom-control-label" for="action">Action</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="racing" name="gameCategory"
													value="Racing" class="custom-control-input" required>
												<label class="custom-control-label" for="racing">Racing</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="sport" name="gameCategory"
													value="Sport" class="custom-control-input" required>
												<label class="custom-control-label" for="sport">Sport</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="puzzle" name="gameCategory"
													value="Puzzle" class="custom-control-input" required>
												<label class="custom-control-label" for="puzzle">Puzzle</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="other" name="gameCategory"
													value="Other" class="custom-control-input" required>
												<label class="custom-control-label" for="other">Other</label>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><input
										class="btn btn-gs-red" type="submit" value="Update game">
										<input class="btn btn-gs-red" type="reset" value="Reset">
									</td>
								</tr>
							</table>
						</form>
					</div>

					<div id="remove-games"
						class="tabcontent-settings m-auto w-100 pt-4 px-5">
						<!-- SECTION 03 -->
						<form name="remove-game" method="POST" action="remove-game">

							<table class="table table-borderless" align="center">
								<tr>
									<td colspan="2" style="text-align: center;"><font
										color="red"> <b>Note: You cannot recover games once deleted!</b><br> <br>
									</font></td>
								</tr>

								<tr>
									<td>
										<div class="form-group">
											<input type="text" name="gameID" class="form-control"
												placeholder="Enter game ID" required>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="form-group">
											<input type="text" name="gameName" class="form-control"
												placeholder="Enter game name" required>
										</div>
									</td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><input
										type="submit" class="btn btn-gs-red" value="Remove Game">
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

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>
</html>