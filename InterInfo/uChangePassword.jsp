<%@ page language="java" contentType="text/html;"%>
<jsp:include page="uheader.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip({
			placement : 'right'
		});
	});
</script>
<title>InterInfo: Change Password</title>
</head>
<body class="wrap">
	<div class="container">

		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
				<h4>
					<b>Change Password</b>
				</h4>
			</div>
			<div class="col-sm-2"></div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<label for="currPassword" class="col-md-2"> Current Password:
			</label>
			<div class="col-md-3">
				<input type="text" class="form-control" id="currPassword"
					placeholder="Enter Current Password">
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<label for="newPassword" class="col-md-2"> New Password: </label>
			<div class="col-md-3">
				<input type="text" class="form-control" id="newPassword"
					placeholder="Enter New Password">
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<label for="comfPassword" class="col-md-2"> Comfirm Password:
			</label>
			<div class="col-md-3">
				<input type="text" class="form-control" id="comfPassword"
					placeholder="Enter Comfirm Password">
			</div>
		</div>

		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-2">
				<br>
				<button type="button" class="btn btn-primary btn-block">Save</button>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>