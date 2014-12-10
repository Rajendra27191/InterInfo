function login() {
	var email = $('#email').val();
	var password = $('#password').val();

	if (email.trim().length == 0) {
		// alert("Please Check Email Address...!");
		$('#alert').show();
		$('#alert-msg').text("Please Check Email Address...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#email').focus();
		return false;
	} else if (!validateEmail(email)) {
		// alert("Please Enter Valid Email Address...!");
		$('#alert').show();
		$('#alert-msg').text("Please Enter Valid Email Address...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#email').focus();
		return false;
	} else if (password.trim().length == 0) {
		// alert("Please Check Password...!");
		$('#alert').show();
		$('#alert-msg').text("Please Check Password...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#password').val("");
		$('#password').focus();
		return false;
	} else {
		// window.location.assign("home.html");
		// -------- Check Login --------
		$
				.ajax({
					url : "login",
					type : 'post',
					timeout : 5000,
					data : "objBean.email=" + email + "&objBean.password="
							+ password,
					dataType : 'json',
					success : function(objBean) {
						var result = objBean.result;
						if (result == "invalidUser") {
							$('#alert').show();
							$('#alert-msg').text("Please Check Email...!");
							$('#email').focus();
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						} else if (result == "invalidPassword") {
							$('#alert').show();
							$('#alert-msg').text("Please Check Password...!");
							$('#password').focus();
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						} else if (objBean.isActive == "0") {
							$('#alert').show();
							$('#alert-msg')
									.text(
											"Your Account is De-activated,contact with Admin...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 4000);
						} else if (result == "success") {
							window.location.assign("home.jsp");
						}
					},

					error : function(jqXHR, textStatus, errorThrown) {
						if (textStatus === "timeout") {
							// Handle the timeout
							$('#alert').show();
							$('#alert-msg').text("Error In Connection...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						} else {
							$('#alert').show();
							$('#alert-msg')
									.text("Check Network Connection...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						}
					}
				})

	}
}

function userLogin() {
	var email = $('#uemail').val();
	var password = $('#upassword').val();

	if (email.trim().length == 0) {
		// alert("Please Check Email Address...!");
		$('#alert').show();
		$('#alert-msg').text("Please Check Email Address...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#uemail').focus();
		return false;
	} else if (!validateEmail(email)) {
		// alert("Please Enter Valid Email Address...!");
		$('#alert').show();
		$('#alert-msg').text("Please Enter Valid Email Address...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#uemail').focus();
		return false;
	} else if (password.trim().length == 0) {
		// alert("Please Check Password...!");
		$('#alert').show();
		$('#alert-msg').text("Please Check Password...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#upassword').val("");
		$('#upassword').focus();
		return false;
	} else {
		// window.location.assign("uHome.html");
		$
				.ajax({
					url : "login",
					type : 'post',
					timeout : 5000,
					data : "objBean.email=" + email + "&objBean.password="
							+ password,
					dataType : 'json',
					success : function(objBean) {
						var result = objBean.result;
						if (result == "invalidUser") {
							$('#alert').show();
							$('#alert-msg').text("Please Check Email...!");
							$('#uemail').focus();
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						} else if (result == "invalidPassword") {
							$('#alert').show();
							$('#alert-msg').text("Please Check Password...!");
							$('#upassword').focus();
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						} else if (objBean.isActive == "0") {
							$('#alert').show();
							$('#alert-msg')
									.text(
											"Your Account is De-activated,contact with Admin...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 4000);
						} else if (result == "success") {
							window.location.assign("uHome.jsp");
						}
					},

					error : function(jqXHR, textStatus, errorThrown) {
						if (textStatus === "timeout") {
							// Handle the timeout
							$('#alert').show();
							$('#alert-msg').text("Error In Connection...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 8000);
						} else {
							$('#alert').show();
							$('#alert-msg')
									.text("Check Network Connection...!");
							setTimeout(function() {
								$('#alert').hide();
							}, 3000);
						}
					}
				})
	}
}

// Function that validates email address through a regular expression.
function validateEmail(sEmail) {
	var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if (filter.test(sEmail)) {
		return true;
	} else {
		return false;
	}
}
/*
 * function dragStart(event) { //alert("Start") // Do anything when drag
 * start...! }
 * 
 * function dragEnd(event) { // Do anything when drag ends...! }
 * 
 * function allowDrop(event) { event.preventDefault(); }
 * 
 * function drop(event) { event.preventDefault(); }
 */