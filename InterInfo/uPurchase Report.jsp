<%@ page language="java" contentType="text/html;"%>
<jsp:include page="uheader.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style1.css">


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="./css/drag-drop.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$(".source, .target").sortable({
			connectWith : ".connected"
		});
	});
</script>
<title>InterInfo: Purchase Report</title>
</head>
<body class="wrap">
	<div class="container">

		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
				<h4>
					<b>Purchase Report</b>
				</h4>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<select class="form-control">
					<option selected="selected" value="-1">Amount of payments</option>
					<option>2 Reports for 300$</option>
					<option>4 Reports for 500$</option>
					<option>6 Reports for 700$</option>
					<option>9 Reports for 1000$</option>
				</select>
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="row sideBySide">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<label>Available Reports</label>
				<div class="left">
					<ul class="source connected">
						<li>Report 1</li>
						<li>Report 2</li>
						<li>Report 3</li>
						<li>Report 4</li>
						<li>Report 5</li>
						<li>Report 6</li>
						<li>Report 7</li>
						<li>Report 8</li>
						<li>Report 9</li>
						<li>Report 10</li>
					</ul>
				</div>
			</div>
			
			
			<div class="col-md-3">
				<label>Selected Reports</label>
				<div class="right" id="droppable">
					<ul class="target connected" style="min-height: 200px;">
					</ul>
				</div>
				<div class="col-md-7">
					<button type="button" class="btn btn-primary btn-block">Purchase</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>