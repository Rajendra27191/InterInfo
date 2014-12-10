<%@ page language="java" contentType="text/html;"%>
<jsp:include page="uheader.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<link href="./css/bootstrap.css" rel="stylesheet" media="screen">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('#example1').dataTable();
	});
</script>
<title>InterInfo:See Reports</title>
</head>
<body class="wrap" style="margin-bottom: 5%;">
	<div class="container">
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
				<h4>
					<b>Allotted Report</b>
				</h4>
			</div>
		</div>

		<table id="example1" class="table table-striped table-bordered"
			cellspacing="0" width="100%"
			style="max-height: 70%; overflow-y: scroll;">
			<thead>
				<tr>
					<th>No.</th>
					<th>Report Name</th>
					<th>Report Type</th>
					<th>Total Downloads</th>
					<th>Remaining Downloads</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody style="font-size: 90%;">
				<tr>
					<td>1</td>
					<td>Report 1</td>
					<td>Custom</td>
					<td>28</td>
					<td>8</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>2</td>
					<td>Report 2</td>
					<td>Custom</td>
					<td>17</td>
					<td>6</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>3</td>
					<td>Report 3</td>
					<td>Standard</td>


					<td>50</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td>Report 4</td>
					<td>Custom</td>
					<td>45</td>
					<td>40</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>Report 5</td>
					<td>Custom</td>
					<td>14</td>
					<td>7</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>6</td>
					<td>Report 6</td>
					<td>Standard</td>
					<td>35</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>7</td>
					<td>Report 7</td>
					<td>Custom</td>
					<td>40</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>8</td>
					<td>Report 8</td>
					<td>Standard</td>


					<td>12</td>
					<td>2</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>9</td>
					<td>Report 9</td>
					<td>Custom</td>
					<td>16</td>
					<td>0</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>10</td>
					<td>Report 10</td>
					<td>Custom</td>
					<td>10</td>
					<td>1</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>11</td>
					<td>Report 11</td>
					<td>Custom</td>
					<td>64</td>
					<td>4</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>12</td>
					<td>Report 12</td>
					<td>Custom</td>
					<td>25</td>
					<td>12</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>13</td>
					<td>Report 13</td>
					<td>Standard</td>
					<td>80</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>14</td>
					<td>Report 14</td>
					<td>Custom</td>
					<td>33</td>
					<td>15</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>15</td>
					<td>Report 15</td>
					<td>Custom</td>
					<td>65</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>16</td>
					<td>Report 16</td>
					<td>Standard</td>
					<td>32</td>
					<td>28</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>17</td>
					<td>Report 17</td>
					<td>Custom</td>
					<td>12</td>
					<td>28</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>18</td>
					<td>Report 18</td>
					<td>Standard</td>
					<td>30</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>19</td>
					<td>Report 19</td>
					<td>Custom</td>
					<td>52</td>
					<td>30</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>20</td>
					<td>Report 20</td>
					<td>Custom</td>
					<td>19</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>21</td>
					<td>Report 21</td>
					<td>Custom</td>
					<td>46</td>
					<td>12</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>22</td>
					<td>Report 22</td>
					<td>Custom</td>
					<td>89</td>
					<td>56</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
				<tr>
					<td>23</td>
					<td>Report 23</td>
					<td>Custom</td>
					<td>54</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>24</td>
					<td>Report 24</td>
					<td>Standard</td>
					<td>39</td>
					<td>0</td>
					<td></td>
				</tr>
				<tr>
					<td>25</td>
					<td>Report 25</td>
					<td>Custom</td>
					<td>120</td>
					<td>20</td>
					<td><button type="button" class="btn btn-primary btn-xs">Download</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>