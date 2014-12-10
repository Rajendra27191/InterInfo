<%@ page language="java" contentType="text/html;"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

<link href="./css/drag-drop.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery-ui.css">

<!-- <script src="js/jquery-ui.js"></script> -->
<link rel="stylesheet" href="css/style1.css">


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">

	<script src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".source, .target").sortable({
			connectWith : ".connected"
		});
	});
</script>



<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/assignReport.js"></script>


<title>InterInfo: Assign Report</title>
</head>
<body class="wrap">
	<div class="container">

		<div class="row">
			<div class="col-md-0"></div>
			<div class="col-md-3">
				<h4>
					<select class="form-control" id="customerSelect"
						onchange="return getUserList();">
						<option selected="selected" value="-1">Select Customer</option>
					</select>
				</h4>
			</div>
			<div class="col-md-3">
				<h4>
					<select class="form-control" id="userSelect">
						<option selected="selected" value="-1">Select User</option>
					</select>
				</h4>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row">
			<div class="btn-group" data-toggle="radio">
				<div class="col-md-5">
					<label class="btn btn-default"> <input type="radio"
						name="payment" id="inputWalls" checked="checked" onclick="return getNationalReports();" value="national">
						National &nbsp;&nbsp;&nbsp;
					</label>
				</div>

				<div class="col-md-7">
					<label class="btn btn-default"> <input type="radio" onclick="return getInternationalReports();"
						name="payment" id="inputWalls" value="international">
						International
					</label>
				</div>
			</div>
		</div>

		<div class="row sideBySide">
			<div class="col-md-3">
				<label>Available Reports</label>
				<div class="left">
					<ul class="source connected" id="sourceUL">
					</ul>
				</div>

			</div>
			<div class="col-md-3">
				<label>Assigned Reports</label>
				<div class="right">
					<ul class="target connected" style="min-height: 167px;">
					</ul>
				</div>
				<div class="col-md-7">
					<button type="button" class="btn btn-primary btn-block">Assign</button>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-3">

				<label>POP UP</label>
			</div>

			<div class="col-md-6" style="border: 1px solid;">
				<!-- ----------- National Time Frame ----------- -->
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-4"></div>
						<label>National Time Frame</label>
					</div>
				</div>
				<div class="row">
					<div class="btn-group col-md-12" data-toggle="radio">
						<div class="row">
							<div class="col-md-5">
								<label class="btn btn-default" style="width: 100%;"> <input
									type="radio" name="ntf" id="perInvent" checked="checked"
									style="margin-left: -42%;" value="credit"> Per Event
								</label>
							</div>
							<div class="col-md-5">
								<input type="number" class="form-control"
									placeholder="Number of consults">
							</div>
						</div>

						<div class="row">
							<div class="col-md-5">
								<label class="btn btn-default col-md-5" style="width: 100%;">
									<input type="radio" name="ntf" id="unlimited" value="cash"
									style="margin-left: -4%;"> Unlimited Consults
								</label>
							</div>
						</div>



						<!-- ------------- International Time Frame -------------- -->
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-3"></div>
								<label>International Time Frame</label>
							</div>
						</div>

						<div class="row">
							<div class="col-md-5">
								<label class="btn btn-default" style="width: 100%;"> <input
									type="radio" name="itf" id="perInvent" checked="checked"
									style="margin-left: -42%;" value="credit"> Per Event
								</label>
							</div>
							<div class="col-md-5">
								<input type="number" class="form-control"
									placeholder="Number of consults">
							</div>
						</div>

						<div class="row">
							<div class="col-md-5">
								<label class="btn btn-default col-md-5" style="width: 100%;">
									<input type="radio" name="itf" id="unlimited" value="cash"
									style="margin-left: -4%;"> Unlimited Consults
								</label>
							</div>
							<div class="col-md-5">
								<select class="form-control">
									<option selected="selected" value="-1">Select Type</option>
									<option>Chapter</option>
									<option>HSCODE</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>

		<div class="row"></div>
	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

