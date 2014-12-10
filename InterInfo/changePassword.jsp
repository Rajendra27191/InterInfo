<%@ page language="java" contentType="text/html;"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/changePassword.js"></script>
<!-- 
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip({
			placement : 'right'
		});
	});
</script> -->
<%
	String resultMsg = String.valueOf(request.getAttribute("result"));
	System.out.println("result Msg: " + resultMsg);
%>
<script>
	window.onload = function() {
		onloadOperations('<%=resultMsg%>');
	}
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

		<form action="changePassword" method="post">
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


			<div class="row">
				<div class="col-md-3"></div>
				<label for="currPassword" class="col-md-2"> Current
					Password: </label>
				<div class="col-md-3">
					<input type="password" class="form-control" id="currPassword"
						name="objProfileBean.currentPassword" autofocus="autofocus"
						placeholder="Enter Current Password">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<label for="newPassword" class="col-md-2"> New Password: </label>
				<div class="col-md-3">
					<input type="password" class="form-control" id="newPassword"
						name="objProfileBean.newPassword" placeholder="Enter New Password">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<label for="comfPassword" class="col-md-2"> Comfirm
					Password: </label>
				<div class="col-md-3">
					<input type="password" class="form-control" id="comfPassword"
						name="objProfileBean.comfirmPassword"
						placeholder="Enter Comfirm Password">
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-2">
					<br>
					<button type="submit" class="btn btn-primary btn-block"
						onclick="return validateProfile();">Save</button>
				</div>
			</div>
		</form>

	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>