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
	
</script>

</head>
<body
	onload="tabSelectAction();imageUploadAction('.addPhotoCamera', '.addImgFile', '.addImage');imageUploadAction('.updatePhotoCamera', '.updateImgFile', '.updateImage');">

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

					<div id="add-games" class="tabcontent m-auto w-100 px-5">
						<!-- SECTION 01 -->
						<form name="add-game" method="POST" action="add-game"
							enctype="multipart/form-data">
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
									<td colspan="2">
										<p>Upload Image</p>
										<div class="row border p-3 text-center">
											<div class="col">
												<img class="addPhotoCamera over" src="images/photo-camera.png"
													style="height: 150px; width: 250px; object-fit: cover; display: none;" />
												<img class="addImage under" src="images/game-default.png"
													style="height: 150px; width: 250px; object-fit: cover;" />
												<input type="file" class="addImgFile" name="image"
													accept="image/*" style="display: none" required />

												<button class="resetBtn btn btn-gs-red" type="reset"
													name="reset" value="" style="display: none">Reset
													Image</button>
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

					<div id="update-games" class="tabcontent m-auto w-100 pt-4 px-5">
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
												<input type="radio" id="new-action" name="gameCategory"
													value="Action" checked="checked"
													class="custom-control-input" required> <label
													class="custom-control-label" for="new-action">Action</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="new-racing" name="gameCategory"
													value="Racing" class="custom-control-input" required>
												<label class="custom-control-label" for="new-racing">Racing</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="new-sport" name="gameCategory"
													value="Sport" class="custom-control-input" required>
												<label class="custom-control-label" for="new-sport">Sport</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="new-puzzle" name="gameCategory"
													value="Puzzle" class="custom-control-input" required>
												<label class="custom-control-label" for="new-puzzle">Puzzle</label>
											</div>
											<div
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" id="new-other" name="gameCategory"
													value="Other" class="custom-control-input" required>
												<label class="custom-control-label" for="new-other">Other</label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<p>Upload Image</p>
										<div class="row border p-3 text-center">
											<div class="col">
												<img class="updatePhotoCamera over" src="images/photo-camera.png"
													style="height: 150px; width: 250px; object-fit: cover; display: none;" />
												<img class="updateImage under" src="images/game-default.png"
													style="height: 150px; width: 250px; object-fit: cover;" />
												<input type="file" class="updateImgFile" name="image"
													accept="image/*" style="display: none" required />

												<button class="resetBtn btn btn-gs-red" type="reset"
													name="reset" value="" style="display: none">Reset
													Image</button>
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

					<div id="remove-games" class="tabcontent m-auto w-100 pt-4 px-5">
						<!-- SECTION 03 -->
						<form name="remove-game" method="POST" action="remove-game">

							<table class="table table-borderless" align="center">
								<tr>
									<td colspan="2" style="text-align: center;"><font
										color="red"> <b>Note: You cannot recover games once
												deleted!</b><br> <br>
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
		
	</script>

	<jsp:include page="WEB-INF/views/footer.jsp" />

</body>
</html>