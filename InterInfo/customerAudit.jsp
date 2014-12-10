<%@ page language="java" contentType="text/html;"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<title>InterInfo:Customer Audit</title>
</head>
<body class="wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
				<h4>
					<b>Customer Audit</b>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<h4>
					<select class="form-control">
						<!-- <option selected="selected" value="-1">Select Customer</option> -->
						<option>Customer 1</option>
						<option>Customer 2</option>
						<option>Customer 3</option>
						<option>Customer 4</option>
					</select>
				</h4>
			</div>
			<div class="col-sm-2"></div>
		</div>


		<!-- ------------------------------- -->

		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="table-responsive">
					<table
						class="table table-condensed table-striped table-bordered table-hover no-margin">
						<thead>
							<tr>
								<th style="width: 5%" valign="top">No.</th>
								<th style="width: 8%" class="hidden-phone" valign="top">User Name</th>
								<th style="width: 12%" class="hidden-phone" ro>Custom Report Downloads</th>
								<th style="width: 10%" class="hidden-phone" ro>Standard Downloads</th>
								<th style="width: 8%" class="hidden-phone" ro>Total Downloads</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span class="name">1</span></td>
								<td class="hidden-phone">User 1</td>
								<td class="hidden-phone">250</td>
								<td class="hidden-phone">100</td>
								<td class="hidden-phone">350</td>
							</tr>
							<tr>
								<td><span class="name">2</span></td>
								<td class="hidden-phone">User 2</td>
								<td class="hidden-phone">200</td>
								<td class="hidden-phone">100</td>
								<td class="hidden-phone">300</td>
							</tr>
							<tr>
								<td><span class="name">3</span></td>
								<td class="hidden-phone">User 3</td>
								<td class="hidden-phone">180</td>
								<td class="hidden-phone">70</td>
								<td class="hidden-phone">250</td>
							</tr>
							<tr>
								<td><span class="name">4</span></td>
								<td class="hidden-phone">User 4</td>
								<td class="hidden-phone">110</td>
								<td class="hidden-phone">40</td>
								<td class="hidden-phone">150</td>
							</tr>
							<tr>
								<td><span class="name">5</span></td>
								<td class="hidden-phone">User 5</td>
								<td class="hidden-phone">90</td>
								<td class="hidden-phone">20</td>
								<td class="hidden-phone">110</td>
							</tr>
							<tr>
								<td class="hidden-phone" align="right" colspan="4">Total
									downloads of customer</td>
								<td class="hidden-phone">1310</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- ------------------------------- -->
	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>