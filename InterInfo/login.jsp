<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<title>InterInfo:Login</title>
</head>
<body class="wrap" style="background: url('images/login.jpeg');">
	<div class="container">

		<!-- To Show customized Error/Alert messgaes -->
		<div class="row">
			<div class="col-sm-4"></div>
			<div style="display: none; margin-top: 4%;"
				class="alert alert-danger col-sm-4" role="alert" id="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Error:</span> <span
					id="alert-msg"></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<!-- ---- Admin Login ---- -->
			<div class="col-md-5">
				<form class="form-horizontal" role="form"
					style="margin-top: 25%; background-color: rgb(241, 240, 240);; padding: 2%; border-radius: 10px;">

					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<h4>
								<b>Admin Login</b>
							</h4>
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email" name="email"
								value="admin@interinfo.com" placeholder="Email" autofocus>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" value="admin@123">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
							<button type="button" class="btn btn-primary btn-block"
								onclick='return login();'>Sign in</button>
						</div>
					</div>
				</form>
			</div>

			<!-- ---- User Login ---- -->
			<div class="col-md-5">
				<form class="form-horizontal" role="form"
					style="margin-top: 25%; background-color: rgb(241, 240, 240); padding: 2%; border-radius: 10px;">

					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<h4>
								<b>User Login</b>
							</h4>
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="uemail"
								name="uemail" value="user@interinfo.com" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="upassword"
								value="user@123" name="upassword" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
							<button type="button" class="btn btn-primary btn-block"
								onclick='return userLogin();'>Sign in</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- ----------------- logo ---------------- -->
		<div class="row">
			<nav id="footernavbar" class="navbar navbar-fixed-bottom"
				role="navigation">
			<div class="col-md-12">
				<img src="images/logo.png" style="margin: 2%; float: right;">
			</div>
			</nav>
		</div>


	</div>
</body>

