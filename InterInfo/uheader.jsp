<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$('.nav li a').on('click', function() {
		$(this).parent().parent().find('.active').removeClass('active');
		$(this).parent().addClass('active');
	});
</script>
<body>
	<div class=" navbar navbar-default navbar-fixed-top my-nav">
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="uHome.jsp">Home</a></li>

			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Reports <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li role="presentation"><a href="uSeeReports.jsp">See
							Reports</a></li>
					<li class="divider"></li>
					<li role="presentation"><a href="uPurchase Report.jsp">Purchase
							Reports</a></li>
				</ul></li>


			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Profile <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li role="presentation"><a href="uChangePassword.jsp">Change
							Password</a></li>
				</ul></li>

			<li role="presentation" class="pull-right"><a href="login.jsp">Logout</a></li>
		</ul>
	</div>