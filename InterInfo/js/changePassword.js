function onloadOperations(result){
	//alert(result)
	if (result == "invalid") {
		$('#alert').show();
		$('#alert-msg').text("Please Check Current Password...!");
		$('#currPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}else if (result == "error") {
		$('#alert').show();
		$('#alert-msg').text("Error While Changing Password...!");
		$('#currPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}else if (result == "updated") {
		$('#alert').show();
		$('#alert-msg').text("Password Changed Successfully...!");
		$('#currPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}
}

function validateProfile() {
	var currentPassword = $('#currPassword').val().trim();
	var newPassword = $('#newPassword').val().trim();
	var comfPassword = $('#comfPassword').val().trim();
	if (currentPassword.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Current Password...!");
		$('#currPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (newPassword.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check New Password...!");
		$('#newPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (comfPassword.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Comfirm Password...!");
		$('#comfPassword').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (newPassword != comfPassword) {
		$('#alert').show();
		$('#alert-msg').text("New and Comfirm Passwords Not Matching...!");
		$('#newPassword').focus();
		$('#newPassword').val("");
		$('#comfPassword').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}
}