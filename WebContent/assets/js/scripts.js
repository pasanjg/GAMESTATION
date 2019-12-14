function checkSearch() {
	var query = document.getElementById('navSearchBar').value;
	if ((query == null) || (query == "")) {
		return false;
	} else {
		return true;
	}
}

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

function tabSelectAction() {
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
}

function openTab(evt, tabName, color) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
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

function imageUploadAction(hoverImg, fileInput, image) {
	$(document).ready(function() {
		$(hoverImg).click(function() {
			$(fileInput).trigger('click');
		});

		$(fileInput).change(function() {

			var file = this.files[0];
			var fileType = file["type"];
			var validImageTypes = [ "image/jpeg", "image/png" ];
			if ($.inArray(fileType, validImageTypes) < 0) {
				alert('Invalid file type. Only JPEG or PNG is allowed.');
				$('.resetBtn').trigger('click');
				file = null;
			}

			if (file != null) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$(image).attr('src', e.target.result);
				}
				reader.readAsDataURL(file);
				$("#uploadBtn").css("display", "inline");
			}

		});

		$(image).mouseenter(function() {
			$(hoverImg).toggle();
		});

		$(hoverImg).mouseleave(function() {
			$(hoverImg).toggle();
		});
	});
}

function editProfileAbout() {
	$(document).ready(function() {
		$("#profileAbout").toggle();
		$("#editAbout").toggle();
		$("#confirmAbout").toggle();
	});
}