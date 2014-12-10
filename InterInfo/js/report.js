function onloadOperations(result, callFromAction, callFrom) {
	if (callFrom == undefined) {
		callFrom = callFromAction;
	}

	if (callFrom == "create" || callFromAction == "create") {
		$('#callFrom').val("create")
		$('#reportId').val("0");
		$('#nReport').prop('checked', true);
	} else if (callFrom == "edit" || callFromAction == "edit") {
		$('#callFrom').val("edit")
		$('#pageLabel').text("Update User");
		$('#submitBtn').text("Update Report");
		$('#reportName').hide();
		$('#reportListSelect').show();
		getReportList();
	}

	if (callFromAction == "create") {
		callFrom = "create";
	} else if (callFromAction == "edit") {
		callFrom = "edit";
	}

	if (result == "created") {
		$('#alert').show();
		$('#alert-msg').text("Report Created Successfully...!");
		$('#reportListSelect').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	} else if (result == "updated") {
		$('#callFrom').val("edit")
		$('#pageLabel').text("Update User");
		$('#submitBtn').text("Update Report");
		$('#reportName').hide();
		$('#reportListSelect').show();
		getReportList();
		$('#alert').show();
		$('#alert-msg').text("Report Updated Successfully...!");
		$('#reportListSelect').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	} else if (result == "present") {
		$('#alert').show();
		$('#alert-msg').text("Report With Same Name Already Present...!");
		$('#reportListSelect').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
	}

	// ----------- Set Day Select Box ----------
	var optionsAsString = "";
	for (var i = 1; i <= 31; i++) {
		optionsAsString += "<option value='" + i + "'>" + i + "</option>";
	}
	$('#date').append(optionsAsString);
	// ------------ Month Select Box -----------
	var months = new Array("January", "February", "March", "April", "May",
			"June", "July", "August", "September", "October", "November",
			"December");
	optionsAsString = "";
	for (var i = 0; i < months.length; i++) {
		optionsAsString += "<option value='" + months[i] + "'>" + months[i]+ "</option>";
	}
	$('#month').append(optionsAsString);
}

function getReportList() {
	$.ajax({
		url : "getReportList",
		type : 'post',
		data : "",
		dataType : 'json',
		success : function(ReportListJson) {
			var optionsAsString = "";
			for (var i = 0; i < ReportListJson.length; i++) {
				optionsAsString += "<option value='"
						+ ReportListJson[i].reportId + "'>"
						+ ReportListJson[i].reportName + "</option>";
			}
			$('#reportListSelect').append(optionsAsString);
		}
	});
}

function validateReportFrom() {
	var callFrom = $('#callFrom').val();
	var reportName = $('#reportName').val().trim();
	if (callFrom == "edit") {
		if ($('#reportListSelect').val() == -1) {
			$('#alert').show();
			$('#alert-msg').text("Please Select Report...!");
			$('#reportListSelect').focus();
			setTimeout(function() {
				$('#alert').hide();
			}, 2000);
			return false;
		}
		$('#reportId').val($('#reportListSelect').val());
	}
	var date = $('#date').val();
	var month = $('#month').val();
	var sqlText = $('#sqlText').val().trim();
	var isStandard = $('#isStandard').val();
	$('#reportName').val(reportName)
	$('#reportListSelect').val(reportName)
	if (reportName.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check Report Name...!");
		$('#reportName').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	} else if (sqlText.length == 0) {
		$('#alert').show();
		$('#alert-msg').text("Please Check SQL Text...!");
		$('#sqlText').focus();
		setTimeout(function() {
			$('#alert').hide();
		}, 2000);
		return false;
	}

	if ($('#isStandard').prop('checked')) {
		$('#isStandard').val("1");
	} else {
		$('#isStandard').val("0");
	}
}

function getReportDetails() {
	// ----------- Set Day Select Box ----------
	var optionsAsString = "";
	for (var i = 1; i <= 31; i++) {
		optionsAsString += "<option value='" + i + "'>" + i + "</option>";
	}
	$('#date').append(optionsAsString);
	// ------------ Month Select Box -----------
	var months = new Array("January", "February", "March", "April", "May",
			"June", "July", "August", "September", "October", "November",
			"December");
	optionsAsString = "";
	for (var i = 1; i <= months.length; i++) {
		optionsAsString += "<option value='" + months[i] + "'>" + months[i]
				+ "</option>";
	}
	$('#month').append(optionsAsString);

	var reportID = $('#reportListSelect').val();

	$.ajax({
		url : "getReportDetails",
		type : 'post',
		data : "reportID=" + reportID,
		dataType : 'json',
		success : function(reportBeanJson) {
			
			$('#reportID').val(reportBeanJson.reportId);
			$('#reportName').val(reportBeanJson.reportName);
			if (reportBeanJson.date == null) {
				$("#date option").filter(
						$('#date').val("all")
				).prop('selected', true);
				
				$("#month option").filter(
						$('#month').val("all")
				).prop('selected', true);
			}else{
				$("#date option").filter(
						$('#date').val(reportBeanJson.date)
				).prop('selected', true);
				
				$("#month option").filter(
						$('#month').val(reportBeanJson.month)
				).prop('selected', true);
			}
			
			$('#sqlText').val(reportBeanJson.sqlText);
			if (reportBeanJson.isStandard == 1) {
				$('#isStandard').prop('checked', true);
			}
			if (reportBeanJson.natOrInternat == "International Report") {
				$('#inReport').prop('checked', true);
			} else {
				$('#nReport').prop('checked', true);
			}
		}
	});
}