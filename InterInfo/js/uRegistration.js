$(function() {
	$('.datepicker').datepicker({
		/* showButtonPanel : true, */
		// dd-MM-yy
		dateFormat : 'yy-mm-dd'
	});
});

function onloadOperations(result, callFromAction, callFrom) {
	if (callFrom == undefined) {
		callFrom = callFromAction;
	}
	
	if (callFrom == "create" || callFromAction == "create") {
		$('#callFrom').val("create")
		$('#isActive').prop('checked', true);
	} else if (callFrom == "edit" || callFromAction == "edit") {
		$('#callFrom').val("edit")
		$('#userSelectDiv').show();
		$('#pageLabel').text("Update User");
		$('#submitBtn').text("Update");
	}
	
	if (callFromAction == "create") {
		callFrom = "create";
	}else if(callFromAction == "edit"){
		callFrom = "edit";
	}

	if (result == "created") {
		$('#alert').show();
		$('#alert-msg').text("User Created Successfully...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	}else if (result == "updated") {
		$('#alert').show();
		$('#alert-msg').text("User Updated Successfully...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	}else if (result == "present") {
		$('#alert').show();
		$('#alert-msg').text("User With Same Email Already Present...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	}
	
	$.ajax({
		url : "getCustomerList",
		type : 'post',
		data : "",
		dataType : 'json',
		success : function(customerListJson) {
			var optionsAsString = "";
			for (var i = 0; i < customerListJson.length; i++) {
				optionsAsString += "<option value='"
						+ customerListJson[i].customerID + "'>"
						+ customerListJson[i].customerName + "</option>";
			}
			$('#customerSelect').append(optionsAsString);
		}
	});
}

function getUserList() {
	if ($('#callFrom').val() == "edit") {
		clearAllFields();
		// ---------- Get User List Under Selected Customer -----------
		var customerID = $('#customerSelect').val();
		$.ajax({
			url : "getUserList",
			type : 'post',
			data : "customerID=" + customerID,
			dataType : 'json',
			success : function(userList) {
				var optionsAsString = "";
				for (var i = 0; i < userList.length; i++) {
					optionsAsString += "<option value='" + userList[i].userID
							+ "'>" + userList[i].name + "</option>";
				}
				$('#userSelect').append(optionsAsString);
			}
		});
	}
}

function clearAllFields(){
	$('#userSelect').find('option:gt(0)').remove();
	$('#userName').val("");
	$('#password').val("");
	$('#position').val("");
	$('#userEmail').val("");
	$('#userPhone').val("");
	$('#fromDatepicker').val("");
	$('#toDatepicker').val("");
}

function getUserDetails() {
	var custID = $('#customerSelect').val();
	var userID = $('#userSelect').val();
	// ---------- Get Details of selected user -----------
	$.ajax({
		url : "getUserDetail",
		type : 'post',
		data : "custID="+custID+"&userID="+userID,
		dataType : 'json',
		success : function(userBean) {
			$('#userName').val(userBean.name);
			$('#password').val(userBean.password);
			$('#position').val(userBean.position);
			$('#userEmail').val(userBean.email);
			$('#userPhone').val(userBean.phone);
			$('#fromDatepicker').val(userBean.fromDate);
			$('#toDatepicker').val(userBean.toDate);
			if (userBean.isActive == 1) {
				$('#isActive').prop('checked', true);
			} else {
				$('#isActive').prop('checked', false);
			}
		}
	});
}

function validateUserForm() {
	var custID = $('#customerSelect').val();
	var userName = $('#userName').val().trim();
	var password = $('#password').val().trim();
	var position = $('#position').val().trim();
	var userEmail = $('#userEmail').val().trim();
	var userPhone = $('#userPhone').val().trim();
	var fromDatepicker = $('#fromDatepicker').val();
	var toDatepicker = $('#toDatepicker').val();
	var callFrom = $('#callFrom').val();

	if ($('#isActive').prop('checked')) {
		$('#isActive').val("1");
	} else {
		$('#isActive').val("0");
	}
	
	if (custID == -1) {
		$('#alert').show();
		$('#alert-msg').text("Please Select Customer...!");
		$('#customerSelect').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}

	if (callFrom == "edit") {
		var userId = $('#userSelect').val();
		if (userId == -1) {
			$('#alert').show();
			$('#alert-msg').text("Please Select User...!");
			$('#userSelect').focus();
			setTimeout(function() {
				$('#alert').hide();
			}, 2000);
			return false;
		}
	}

	if (userName.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check User Name...!");
		$('#userName').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (password.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Password...!");
		$('#password').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}else if (position.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Position...!");
		$('#position').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (userEmail.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Email...!");
		$('#userEmail').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (userPhone.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Phone Number...!");
		$('#userPhone').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (fromDatepicker.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check From Date...!");
		$('#fromDatepicker').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (toDatepicker.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check To Date...!");
		$('#toDatepicker').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}
}