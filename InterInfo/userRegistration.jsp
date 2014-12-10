<%@ page language="java" contentType="text/html;"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style1.css">


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="./css/drag-drop.css" rel="stylesheet">
<script type="text/javascript" src="js/uRegistration.js"></script>

<%
	String resultMsg = String.valueOf(request.getAttribute("result"));
	String callFromAction = String.valueOf(request
			.getAttribute("callFromAction"));
	String callFrom = request.getParameter("objUserBean.result");
	System.out.println("result Msg: " + resultMsg + "\t CallFrom : "
			+ callFrom + "\t CallFromAction : " + callFromAction);
%>

<script>
	window.onload = function() {
		onloadOperations('<%=resultMsg%>', '<%=callFromAction%>', '<%=callFrom%>');
	}
</script>
<title>InterInfo:User Registration</title>
</head>
<body class="wrap">
	<div class="container">

		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-4">
				<h4>
					<b id="pageLabel">New User</b>
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
		<!-- ------------------- Form ---------------------------- -->
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form role="form" action="userOperation" method="post">

					<input type="hidden" name="objUserBean.callFrom" id="callFrom">

					<div class="form-group">
						<label for="userName" class="col-md-2"> Customer: </label>
						<div class="col-md-10">
							<select class="form-control" id="customerSelect"
								autofocus="autofocus" name="objUserBean.customerID"
								onchange="return getUserList();">
								<option selected="selected" value="-1">Select Customer</option>
							</select>
						</div>
					</div>

					<!-- ----------- While Edit User Show User Select Box ----------- -->
					<div class="form-group" style="display: none;" id="userSelectDiv">
						<label for="userName" class="col-md-2"> User: </label>
						<div class="col-md-10">
							<select class="form-control" id="userSelect"
								onchange="return getUserDetails();" name="objUserBean.userID">
								<option selected="selected" value="-1">Select user</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="userName" class="col-md-2"> Name: </label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="userName"
								name="objUserBean.name" placeholder="Enter User Name">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-md-2"> Password: </label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="password"
								name="objUserBean.password" placeholder="Enter Password">
						</div>
					</div>

					<div class="form-group">
						<label for="position" class="col-md-2"> Position: </label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="position"
								name="objUserBean.position" placeholder="Enter Position">
						</div>
					</div>
					<div class="form-group">
						<label for="userEmail" class="col-md-2"> Email: </label>
						<div class="col-md-10">
							<input type="email" class="form-control" id="userEmail"
								name="objUserBean.email" placeholder="Enter Email Address">
						</div>
					</div>
					<div class="form-group">
						<label for="userPhone" class="col-md-2"> Phone: </label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="userPhone"
								name="objUserBean.phone" placeholder="Enter Phone Number">
						</div>
					</div>
						<div>
							<div class="col-md-2"></div>
							<label style="margin-left: 3%;"><input type="checkbox"
								name="objUserBean.isActive" id="isActive">Is Active</label>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-4">
								<input type="text" id="fromDatepicker" style="margin-left: 7%;"
									name="objUserBean.fromDate" placeholder="From Date"
									class="form-control datepicker" readonly="readonly">
							</div>
							<div class="col-md-4">
								<input type="text" id="toDatepicker" name="objUserBean.toDate"
									placeholder="To Date" class="form-control datepicker"
									readonly="readonly">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-2"></div>
						<div class="col-md-5">
							<button type="submit" class="btn btn-primary btn-block"
								id="submitBtn" onclick="return validateUserForm();">Create</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
		<!-- --------------------------------------------------------- -->
	</div>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>