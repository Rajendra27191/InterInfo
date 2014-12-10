<%@ page language="java" contentType="text/html;"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<script src="js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style1.css">


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/report.js"></script>

<!-- <script>
	$('.dropdown-menu a').on(
			'click',
			function() {
				$('.dropdown-toggle').html(
						$(this).html() + '<span class="caret"></span>');
			})
</script> -->
<script>
	$(function() {
		$('#datepicker').datepicker({
			changeDay : true,
			changeMonth : true,
			/* showButtonPanel : true, */
			dateFormat : 'dd MM'
		});
	});
</script>
<style>
.ui-datepicker-year {
	display: none;
}
</style>
<%
	String resultMsg = String.valueOf(request.getAttribute("result"));
	String callFromAction = String.valueOf(request
			.getAttribute("callFromAction"));
	String callFrom = request.getParameter("callFrom");
	System.out.println("result Msg: " + resultMsg + "\t CallFrom : "
			+ callFrom + "\t CallFromAction : " + callFromAction);
%>

<script>
	window.onload = function() {
		onloadOperations('<%=resultMsg%>', '<%=callFromAction%>', '<%=callFrom%>');
	}
</script>
<title>InterInfo: Create Report</title>
</head>
<body class="wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
				<h4>
					<b id="pageLabel">New Report</b>
				</h4>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<!--------------- To Show customized Error/Alert messgaes --------------->
		<div class="row">
			<div class="col-sm-4"></div>
			<div style="display: none;" class="alert alert-danger col-sm-4"
				role="alert" id="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Error:</span> <span
					id="alert-msg"></span>
			</div>
		</div>

		<form role="form" action="reportOperation" method="post">
			<input type="hidden" name="objReportBean.callFrom" id="callFrom">
			<input type="hidden" name="objReportBean.reportId" id="reportId">
			<div class="row">
				<div class="col-md-3">
					<input type="text" class="form-control" id="reportName" autofocus="autofocus"
						placeholder="Enter Report Name" name="objReportBean.reportName">
					<select style="display: none;" class="form-control"
					 id="reportListSelect" name="objReportBean.reportName"
					 onchange="return getReportDetails();">
						<option selected="selected" value="-1">Select Report</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="col-md-1">
						<label>Refresh day</label>
					</div>
					<div class="col-md-2">
						<select class="form-control" name="objReportBean.date" id="date">
							<option selected="selected" value="all">All</option>
						</select>
					</div>
					<div class="col-md-2">
						<select class="form-control" id="month" name="objReportBean.month">
							<option selected="selected" value="all">All</option>
						</select>
					</div>

				</div>


			</div>

			<div class="row">
				<div class="col-md-12">
					<textarea placeholder="SQL Here" class="form-control" rows="15"
						style="max-height: 60%; max-width: 100%;" id="sqlText"
						name="objReportBean.sqlText"></textarea>
				</div>
			</div>

			<div class="checkbox">
				<label><input type="checkbox"
					name="objReportBean.isStandard" id="isStandard">Is Standard
					Report</label>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div data-toggle="radio">
						<label class="btn btn-default"><input type="radio"
							name="objReportBean.natOrInternat" id="nReport"
							value="National Report">National Report</label> <label
							class="btn btn-default"><input type="radio"
							name="objReportBean.natOrInternat" id="inReport"
							value="International Report">International Report</label>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-0"></div>
				<div class="col-md-2">
					<br>
					<button type="submit" id="submitBtn"
						class="btn btn-primary btn-block"
						onclick="return validateReportFrom();">Create Report</button>
				</div>
			</div>
		</form>

	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>