function customerValidation() {
	var callFrom = $('#callFrom').val();
	if (callFrom == "edit") {
		if ($('#customerSelect').val() == -1) {
			$('#alert').show();
			$('#alert-msg').text("Please Select Customer...!");
			$('#customerSelect').focus();
			setTimeout(function() {
				$('#alert').hide();
			}, 2000);
			return false;
		}
	}
	
	var tradeName = $('#tradeName').val().trim();
	var taxNumber = $('#taxNumber').val().trim();
	var custName = $('#custName').val().trim();
	var position = $('#position').val().trim();
	var custEmail = $('#custEmail').val().trim();
	var custPhone = $('#custPhone').val().trim();
	var custAddress = $('#custAddress').val().trim();

	var streetInfo = $('#streetInfo').val().trim();
	var colonia = $('#colonia').val().trim();
	var delegacion = $('#delegacion').val().trim();
	var state = $("#state").val().trim();
	var city = $("#city").val().trim();
	var zipCode = $('#zipCode').val().trim();
	var paymentMethod = $('#paymentMethod').val().trim();
	var accNo = $('#accNo').val().trim();
	var contact = $('#contact').val().trim();
	var mailOfContact = $('#mailOfContact').val().trim();
	var telOfContact = $('#telOfContact').val().trim();
	var amountOfPayment = $('#amountOfPayment').val().trim();
	
	//alert($('#cardPayment').val())

	if (tradeName.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Trade Name...!");
		$('#tradeName').focus();
		$('#tradeName').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (taxNumber.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Tax Number...!");
		$('#taxNumber').focus();
		$('#taxNumber').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (custName.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Customer Name...!");
		$('#custName').focus();
		$('#custName').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (position.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Position...!");
		$('#position').focus();
		$('#position').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (custEmail.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Customer Email...!");
		$('#custEmail').focus();
		$('#custEmail').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (!validateEmail(custEmail)) {
		// alert("Please Enter Valid Email Address...!");
		$('#alert').show();
		$('#alert-msg').text("Please Enter Valid Email Address...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 3000);
		$('#custEmail').focus();
		return false;
	} else if (custPhone.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Customer Phone...!");
		$('#custPhone').focus();
		$('#custPhone').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (custAddress.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Customer Address...!");
		$('#custAddress').focus();
		$('#custAddress').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (streetInfo.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Street Information...!");
		$('#streetInfo').focus();
		$('#streetInfo').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (colonia.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Colonia...!");
		$('#colonia').focus();
		$('#colonia').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (delegacion.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Delegacion...!");
		$('#delegacion').focus();
		$('#delegacion').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (state.length == 0) { // -------- Billing Validations -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check State...!");
		$('#state').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (city.length == 0) { // -------- Billing Validations -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check City...!");
		$('#city').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (zipCode.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check ZIPCODE...!");
		$('#zipCode').focus();
		$('#zipCode').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (paymentMethod.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Payment Method..!");
		$('#paymentMethod').focus();
		$('#paymentMethod').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (accNo.length == 0) { // -------- Billing Validations -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Account Number...!");
		$('#accNo').focus();
		$('#accNo').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (contact.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Contact Number...!");
		$('#contact').focus();
		$('#contact').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (mailOfContact.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Mail Of Contact...!");
		$('#mailOfContact').focus();
		$('#mailOfContact').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (telOfContact.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check TEL Of Contact...!");
		$('#telOfContact').focus();
		$('#telOfContact').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (amountOfPayment.length == 0) { // -------- Billing Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Amount Of Payment...!");
		$('#amountOfPayment').focus();
		$('#amountOfPayment').val("");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (!$('#natCommerce').prop('checked')
			&& !$('#interNatCommerce').prop('checked')) { // -------- Service
		// Contract
		// Validations
		// -----------
		$('#alert').show();
		$('#alert-msg').text("Please Check Service Contract...!");
		$('#natCommerce').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}
	
	//------------ Set Values of service Contract -----------
	//alert($('#natCommerce').prop('checked')+" $$$ "+$('#interNatCommerce').prop('checked'))
	if ($('#natCommerce').prop('checked')) {
		$('#natCommerce').val("yes");
	}else {
		$('#natCommerce').val("no");
	}
	if ($('#interNatCommerce').prop('checked')) {
		$('#interNatCommerce').val("yes");
	} else {
		$('#interNatCommerce').val("no");
	}
	
	if ($('#cashPayment').prop('checked')) {
		$('#cashPayment').val("cash");
	} else {
		$('#cashPayment').val("no");
	}
	
	if ($('#cardPayment').prop('checked')) {
		$('#cardPayment').val("card");
	} else {
		$('#cardPayment').val("no");
	}
}

function showAlert(result, callFrom, callFromAction) {
	if (callFrom == undefined) {
		//alert("Call From = Undefined. CallFromAction = "+callFromAction)
		callFrom = callFromAction;
	}
	
	if (callFrom == "create" || callFromAction == "create") {
		$('#callFrom').val("create");
		$('#invoiceYes').prop('checked', true);
		$('#cardPayment').prop('checked', true);
		
	} else {
		$('#invoiceYes').prop('checked', true);
		//$('#cashPayment').prop('checked', true);
		$('#pagelblel').text('Update Customer');
		$('#formBtn').val('Save Updates');
		$('#callFrom').val("edit");
		$('#editCustDiv').show();

		getCustomerList();
	}

	if (result == "created") {
		$('#alert').show();
		$('#alert-msg').text("Customer Created Successfully...!");
		$('#callFrom').val("create");
		$('#invoiceYes').prop('checked', true);
		$('#cardPayment').prop('checked', true);
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		
	} else if (result == "error") {
		$('#alert').show();
		$('#alert-msg').text("Error While Creating Customer...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	} else if (result == "present") {
		$('#alert').show();
		$('#alert-msg').text("Customer With Same Name Already Present...!");
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	}else if(result == "updated"){
		$('#alert').show();
		$('#alert-msg').text("Customer Updated Successfully...!");
		$('#invoiceYes').prop('checked', true);
		$('#cashPayment').prop('checked', true);
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	} else {
		// Do Nothing First time on Page so result == null.
	}
}

function getCustomerList() {
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
			$( '#customerSelect' ).append( optionsAsString );
		}
	});
}

function setCustomerData(){
	var CustID = $('#customerSelect').val();
	$('#objCustomerBean.customerID').val(CustID);
	$.ajax({
		url : "getCustomerDetails",
		type : 'post',
		data : "custID="+CustID,
		dataType : 'json',
		success : function(customerBean) {
			//----------- Set values to Form -------------
			$('#tradeName').val(customerBean.tradeName);
			$('#taxNumber').val(customerBean.taxNumber);
			$('#custName').val(customerBean.customerName);
			$('#position').val(customerBean.position);
			$('#custEmail').val(customerBean.email);
			$('#custPhone').val(customerBean.phone);
			$('#custAddress').val(customerBean.address);
			$('#streetInfo').val(customerBean.objBillingBeans[0].streetNumber);
			$('#colonia').val(customerBean.objBillingBeans[0].colonia);
			$('#delegacion').val(customerBean.objBillingBeans[0].delegacian);
			$('#state').val(customerBean.objBillingBeans[0].state);
			$('#city').val(customerBean.objBillingBeans[0].city);
			$('#zipCode').val(customerBean.objBillingBeans[0].zipcode);
			$('#paymentMethod').val(customerBean.objBillingBeans[0].paymentMethod);
			$('#accNo').val(customerBean.objBillingBeans[0].accountNumber);
			$('#contact').val(customerBean.objBillingBeans[0].contactNumber);
			$('#mailOfContact').val(customerBean.objBillingBeans[0].mailOfContact);
			$('#telOfContact').val(customerBean.objBillingBeans[0].telOfContact);
			$('#amountOfPayment').val(customerBean.amountOfPayment);
			$('#customerID').val(customerBean.customerID);
			$('#seqNumber').val(customerBean.objBillingBeans[0].seqNumber);
			if (customerBean.paymentType == "credit") {
				$('#cardPayment').prop('checked', true);
			}else{
				$('#cashPayment').prop('checked', true);
			}
			
			if (customerBean.invoiceNeeded == "yes") {
				$('#invoiceYes').prop('checked', true);
			}else{
				$('#invoiceNo').prop('checked', true);
			}
			
			//alert(customerBean.ciAvailable)
			if (customerBean.cnAvailable == "yes") {
				$('#natCommerce').prop('checked', true);
			}
			if(customerBean.ciAvailable == "yes"){
				$('#interNatCommerce').prop('checked', true);
			}
		}
	});
	
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

// ------ Accept only and only Numbers ---------
function onlyNumbers(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}
	return true;
}
