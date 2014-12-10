<%@ page language="java" contentType="text/html;"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/myCss.css" rel="stylesheet">
<script src="js/customerRegistration.js"></script>
<title>InterInfo:Customer Registration</title>
</head>

<!-- --------------------------------------------- -->
<%
	String resultMsg = String.valueOf(request.getAttribute("result"));
	String callFromAction = String.valueOf(request
			.getAttribute("callFromAction"));
	String callFrom = request.getParameter("objCustomerBean.result");
	System.out.println("result Msg: " + resultMsg + "\t CallFrom : "
			+ callFrom + "\t CallFromAction : " + callFromAction);
%>
<script type="text/javascript">
	window.onload=function (){
		showAlert('<%=resultMsg%>', '<%=callFrom%>', '<%=callFromAction%>');
	}
</script>
<!-- --------------------------------------------- -->
<body class="wrap">
	<div class="container" style="width: 100%;">
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-4">
				<h4>
					<b id="pagelblel">New Customer</b>
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

		<!-- ------------- Show Select Box While Editing ------------- -->
		<div class="row">
			<div class="col-sm-10"></div>
			<div class="form-group" id="editCustDiv" style="display: none;">
				<div class="col-md-3">
					<select class="form-control" id="customerSelect"
						onchange="return setCustomerData();">
						<option selected="selected" value="-1">Select Customer</option>
					</select>
				</div>
			</div>
		</div>

		<form action="customerRegistration" method="post">
			<!-- --------------------------------------------- -->

			<input type="hidden" name="objCustomerBean.result" id="result">
			<input type="hidden" name="objCustomerBean.callFrom" id="callFrom">
			<input type="text" style="display: none;"
				name="objCustomerBean.customerID" id="customerID" value="">
			<input type="hidden" name="objBillingBean.seqNumber" id="seqNumber">
			<div
				style="border: 1px solid #C5C5C5; height: 90%; width: 100%; max-height: 75%; overflow-x: hidden; overflow-y: scroll; margin-top: 0%;">
				<!-- ------------------- Customer Info Form ---------------------------- -->
				<div class="row">
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-sm-8">
								<b>Customer Information</b>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="text" class="form-control" id="tradeName"
									autofocus="autofocus" name="objCustomerBean.tradeName"
									placeholder="Enter Trade Name">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="text" class="form-control" id="taxNumber"
									name="objCustomerBean.taxNumber" placeholder="Enter Tax Number">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="text" class="form-control" id="custName"
									name="objCustomerBean.customerName"
									placeholder="Enter Customer Name">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="text" class="form-control" id="position"
									name="objCustomerBean.position" placeholder="Enter Position">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="email" class="form-control" id="custEmail"
									name="objCustomerBean.email" placeholder="Enter Email Address">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<input type="text" class="form-control" id="custPhone"
									name="objCustomerBean.phone" placeholder="Enter Phone Number">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10">
								<textarea rows="5" class="form-control" id="custAddress"
									name="objCustomerBean.address" placeholder="Enter Address"
									style="max-width: 100%; max-height: 150px;"></textarea>
							</div>
						</div>
					</div>

					<!-- ----------- Billing Info Form --------- -->
					<div id="billingForm">
						<div class="col-md-4">

							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-sm-8">
									<b>Billing Information</b>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control" id="streetInfo"
										name="objBillingBean.streetNumber"
										placeholder="Enter street and number">
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="colonia"
													name="objBillingBean.colonia" placeholder="Enter colonia">
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="delegacion"
													name="objBillingBean.delegacian"
													placeholder="Enter delegacion">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										<input type="text" class="form-control" id="state"
											name="objBillingBean.state" placeholder="Enter State">
										<!-- <select class="form-control" name="objBillingBean.state"
											id="state">
											<option selected="selected" value="-1">Select State</option>
											<option>Aguascalientes</option>
											<option>Baja California</option>
											<option>Baja California Sur</option>
											<option>Campeche</option>

											<option>Chiapas</option>
											<option>Chihuahua</option>
											<option>Coahuila</option>
											<option>Colima</option>

											<option>Distrito Federal</option>
											<option>Durango</option>
											<option>Guanajuato</option>
											<option>Colima</option>

											<option>Guerrero</option>
											<option>Hidalgo</option>
											<option>Jalisco</option>
											<option>México</option>
										</select> -->
									</div>
									<div class="col-md-6">
										<input type="text" class="form-control" id="city"
											name="objBillingBean.city" placeholder="Enter City">

										<!-- <select class="form-control" id="city"
											name="objBillingBean.city">
											<option selected="selected" value="-1">Select City</option>
											<option>Aguascalientes</option>
											<option>Mexicali</option>
											<option>La Paz</option>
											<option>Campeche</option>

											<option>Saltillo</option>
											<option>Colima</option>
											<option>Tuxtla Gutiérrez</option>
											<option>Ciudad du México</option>

											<option>Chiapas</option>
											<option>Guadalajara</option>
											<option>Monterrey</option>
										</select> -->
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="zipCode"
													name="objBillingBean.zipcode" placeholder="Enter ZIP code">
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="paymentMethod"
													name="objBillingBean.paymentMethod"
													placeholder="Enter payment method">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="accNo"
													name="objBillingBean.accountNumber"
													onkeypress="return onlyNumbers(event);"
													placeholder="Enter account number">
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<div class="col-md-12" style="padding: 0;">
												<input type="text" class="form-control" id="contact"
													name="objBillingBean.contactNumber"
													placeholder="Enter contact">
											</div>
										</div>
									</div>
								</div>
							</div>






							<div class="form-group">
								<div class="col-md-12">
									<input type="email" class="form-control" id="mailOfContact"
										name="objBillingBean.mailOfContact"
										placeholder="Enter MAIL of contact">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<input type="text" class="form-control" id="telOfContact"
										name="objBillingBean.telOfContact"
										placeholder="Enter TEL of contact">
								</div>
							</div>

							<div class="col-md-12">
								<input type="text" class="form-control" id="amountOfPayment"
									name="objCustomerBean.amountOfPayment"
									placeholder="Amount of payments">
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-2">
											<label>Payment</label>
										</div>
										<div class="col-md-10">
											<div class="btn-group" data-toggle="radio">
												<div class="row">
													<div class="col-md-6">
														<label class="btn btn-default"> <input
															type="radio" name="objCustomerBean.paymentType"
															id="cardPayment" value="credit"> Credit
														</label>
													</div>

													<div class="col-md-6">
														<label class="btn btn-default"> <input
															type="radio" name="objCustomerBean.paymentType"
															id="cashPayment" value="cash"> Cash
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-2">
											<label>Invoice</label>
										</div>
										<div class="col-md-10">
											<div class="row">
												<div class="btn-group" data-toggle="radio">
													<div class="col-md-5">
														<label class="btn btn-default"> <input
															type="radio" name="objCustomerBean.invoiceNeeded"
															id="invoiceYes" value="yes"> Yes
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</label>

													</div>

													<div class="col-md-5">
														<label class="btn btn-default"> <input
															type="radio" name="objCustomerBean.invoiceNeeded"
															id="invoiceNo" value="no"> No &nbsp;&nbsp;&nbsp;
														</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- <div class="col-md-12">
								<div class="form-group">
									<div class="col-md-8">
										<button type="button" class="btn btn-primary btn-block">Register</button>
									</div>
								</div>
							</div> -->
						</div>
					</div>

					<div class="col-md-3"></div>
					<!-- ------------------- Service Contract Form ---------------------------- -->
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-sm-8">
								<b>Service Contract</b>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-11">
									<div class="col-md-12">
										<label class="btn btn-default col-md-7"> <input
											style="float: left;" type="checkbox"
											name="objCustomerBean.cnAvailable" id="natCommerce">
											National Commerce
										</label> <label class="btn btn-default col-md-7"> <input
											style="float: left;" type="checkbox"
											name="objCustomerBean.ciAvailable" id="interNatCommerce">
											International Commerce
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ------------------------------- -------------------------- -->
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-md-4"></div>
						<div class="col-md-3">
							<input type="submit" class="btn btn-primary btn-block"
								id="formBtn" value="Register"
								onclick="return customerValidation();">
						</div>
					</div>
				</div>
				<br>
			</div>
		</form>
	</div>
</body>