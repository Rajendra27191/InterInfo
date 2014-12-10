<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">

/* var url = window.location.href;
var menuString = url.substring(url.lastIndexOf("/")+1,url.length);

$(".nav li") */

	$('.nav li a').on('click', function() {
		$(this).parent().parent().find('.active').removeClass('active');
		$(this).parent().addClass('active');
	});
	
	/* $('.nav li ul li  a').on('click', function() {
		//alert("hiiii")
		//$(this).parent().parent().find('.active').removeClass('active');
		//$(this).parent().addClass('active');
		
		//$(this).parent().parent().parent().parent().addClass('active');
	}); */
</script>
<body>
	<div class=" navbar navbar-default navbar-fixed-top my-nav">
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="home.jsp">Home</a></li>
			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Registration <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<!-- <li role="presentation"><a href="cRegistration.jsp?objCustomerBean.result=create">Customer</a></li>
					<li class="divider"></li>
					<li role="presentation"><a href="userRegistration.jsp">User</a></li> -->
					<li class="dropdown-submenu">
                    <a href="#">Customer</a>
                    <ul class="dropdown-menu">
                        <li><a href="cRegistration.jsp?objCustomerBean.result=create">Create Customer</a></li>
                    	<li><a href="cRegistration.jsp?objCustomerBean.result=edit">Edit Customer</a></li>
                    </ul></li>
                    	<!-- <li role="presentation">
                    	<a href="userRegistration.jsp">User</a>
                    </li> -->
                    <li class="dropdown-submenu">
                    <a href="#">User</a>
                    <ul class="dropdown-menu">
                        <li><a href="userRegistration.jsp?objUserBean.result=create">Create User</a></li>
                    	<li><a href="userRegistration.jsp?objUserBean.result=edit">Edit User</a></li>
                    </ul></li>
				</ul></li>

			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Reports <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<!-- <li role="presentation"><a href="createReport.jsp">Create
							Report</a></li>
					<li class="divider"></li> -->
					<li class="dropdown-submenu">
                    <a href="#">Report</a>
                    <ul class="dropdown-menu">
                        <li><a href="createReport.jsp?callFrom=create">Create Report</a></li>
                    	<li><a href="createReport.jsp?callFrom=edit">Edit Report</a></li>
                    </ul></li>
					<li role="presentation"><a href="assignReport.jsp">Assign
							Report</a></li>
				</ul></li>

			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Audit <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li role="presentation"><a href="customerAudit.jsp">Customer
							Audit</a></li>
					<li class="divider"></li>
					<li role="presentation"><a href="reportAudit.jsp">Report
							Audit</a></li>
				</ul></li>

			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">Profile <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li role="presentation"><a href="changePassword.jsp">Change
							Password</a></li>
				</ul></li>

			<li role="presentation" class="pull-right"><a href="login.jsp">Logout</a></li>
		</ul>
	</div>