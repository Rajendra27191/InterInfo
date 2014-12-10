$(window).load(function() {
      //--------- Get Customer List ----------
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
	getNationalReports();
});

function getUserList(){
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

function getNationalReports(){
	$.ajax({
		url : "getNationalReports",
		type : 'post',
		data : "",
		dataType : 'json',
		success : function(natReportBean) {
			$("#sourceUL").empty();
			for (var i = 0; i < natReportBean.length; i++) {
				$("#sourceUL").append('<li value="'+natReportBean[i].reportId+'" onclick="alert("onclick");" ondragstart="alert("askdjhg");myFunction(event)" draggable="true" ondrop="return drop(event);">'+natReportBean[i].reportName+'</li>');
			}
		}
	});
}

function getInternationalReports(){
	$.ajax({
		url : "getInternationalReports",
		type : 'post',
		data : "",
		dataType : 'json',
		success : function(InReportBean) {
			$("#sourceUL").empty();
			for (var i = 0; i < InReportBean.length; i++) {
				$("#sourceUL").append('<li value="'+InReportBean[i].reportId+'">'+InReportBean[i].reportName+'</li>');
			}
		}
	});
	
	$("html").on("drop", function(event) {
		alert("hiii")
	    event.preventDefault();  
	    event.stopPropagation();
	    alert("Dropped!");
	});
}

function myFunction(event){
	alert("s")
}

function drop(event){
	alert("hiii")
    event.preventDefault();  
    event.stopPropagation();
    alert("Dropped!");
}

$(".source li").draggable({
	  addClasses: false,
	  appendTo: "body",
	  helper: "clone"
	});
	 
	$(".target").droppable({
	  addClasses: false,
	  activeClass: "listActive",
	  accept: ":not(.ui-sortable-helper)",
	  drop: function(event, ui) {
	    $(this).find(".placeholder").remove();
	    var link = $("<a href='#' class='dismiss'>x</a>");
	    var list = $("<li></li>").text(ui.draggable.text());
	    $(list).append(link);
	    $(list).appendTo(this);
	    updateValues();
	  }
	}).sortable({
	  items: "li:not(.placeholder)",
	  sort: function() {
	    $(this).removeClass("listActive");
	  },
	  update: function() {
	    updateValues();
	  }
	}).on("click", ".dismiss", function(event) {
	  event.preventDefault();
	  $(this).parent().remove();
	  updateValues();
	});