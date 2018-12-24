<?php

	//to use session
	session_start();

	//for mysql database connection
	include('dbconfig/dbconfig.php');
	
	if (!isset($_SESSION['authentication'])) {
		echo "<script>window.location.href = 'index.php';</script>";
	}
	

	if (!isset($_GET['bookingid'])) {
		echo "<script>window.location.href = 'reservation.php';</script>";
	}

	$bookingid = $_GET['bookingid'];

	$getbookingsql = mysql_query("select * from bookings where bookingid = '$bookingid'") or die(mysql_error());
	$rowbooking = mysql_fetch_assoc($getbookingsql);

	$carid = $rowbooking['carid'];
	$durationinhours = $rowbooking['durationinhours'];
	$driver = $rowbooking['driverid'];

	$getcarsql = mysql_query("SELECT c.*, oc.carid FROM Cars c, OfficeCars oc
												WHERE c.carno = oc.carno
												AND oc.carid = '$carid'") or die(mysql_error());
	$rowgetcar = mysql_fetch_assoc($getcarsql);

	$carcost = $rowgetcar['carcost']/6 * $durationinhours;
	$rowbooking['carcost'] = $carcost;

	if ($driver == 'nodriver') {
		$drivercost = 0;
		$rowbooking['drivercost'] = 0;
	}
	else{
		$driverid = $rowbooking['driverid'];
		$getdriversql = mysql_query("SELECT * FROM Drivers where driverid = '$driverid'") or die(mysql_error());
		$rowgetdriver = mysql_fetch_assoc($getdriversql);
		$drivercost = $rowgetdriver['drivercost']/24 * $durationinhours;
		$rowbooking['drivercost'] = $drivercost;
	}



	$customerusername = $_SESSION['customerusername'];
	$getcustomer = mysql_query("SELECT * FROM Customers where customerusername = '$customerusername'");
	$rowgetcustomer = mysql_fetch_assoc($getcustomer);

	$customerid = $rowgetcustomer['customerid'];
	$rowbooking['customerid'] = $customerid;
	$currentpage = 'reservation';


	

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Xero | Booking Detail</title>

		<!-- Bootstrap -->
		<link href="style/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="fa/css/font-awesome.min.css" rel="stylesheet">
		<!-- Sweet Alert -->
		<link rel="stylesheet" href="style/sweetalert.css">
		<!-- Custom Style -->
		<link href="style/customstyle.css" rel="stylesheet">
		<!-- Site Logo -->
		<link href = "images/design/logo.png" rel="icon" type="image/png">

	</head>

	<body class="other">

		<?php include '_navigationbar.php'; ?> <!-- navigation bar -->

		<div class="container adjustnavpositon">
			<div class="row">
				<a href="reservation.php" style="color: yellow">
					<i class="fa fa-close fa-2x pull-right"></i>
				</a>

				<div class="col-md-8 booking-detail">
						<div class="col-md-4 col-sm-4 col-xs-12 profile_left">
							<h4>Booking Detail</h4>

							<ul class="list-unstyled user_data">
								<li><i class="fa fa-home user-profile-icon"></i> Pickup from <?php echo $rowbooking['pickuplocation']; ?>
								</li>

								<li>
									<i class="fa fa-map-marker user-profile-icon"></i> Return to <?php echo $rowbooking['returnlocation']; ?>
								</li>

								<li><i class="fa fa-clock-o user-profile-icon"></i> From <?php echo $rowbooking['pickuptime']; ?>
								</li>
								
								<li><i class="fa fa-clock-o user-profile-icon"></i> to <?php echo $rowbooking['returntime']; ?>
								</li>
							</ul>

							<?php
							if ($driver == 'nodriver'): ?>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-12 profile_left">
							<?php else: echo '<hr>'; endif; ?>

							<h4>Customer Detail</h4>
							<div class="profile_img">
								<div id="crop-avatar">
								<!-- Current avatar -->
									<img class="img-circle avatar-view" width="200px" height="200px" src="images/customerphoto/<?php echo $rowgetcustomer['customerphoto']; ?>" alt="Avatar">
								</div>
							</div>
							<h4><?php echo $rowgetcustomer['customername']; ?></h4>

							<ul class="list-unstyled user_data">
								<li><i class="fa fa-user-circle-o user-profile-icon"></i> <?php echo $rowgetcustomer['customerusername']; ?>
								</li>

								<li>
								<i class="fa fa-envelope user-profile-icon"></i> <?php echo $rowgetcustomer['customeremail']; ?>
								</li>

								<li>
								<i class="fa fa-male user-profile-icon"></i> <?php echo $rowgetcustomer['customergender']; ?>
								</li>

								<li>
								<i class="fa fa-calendar user-profile-icon"></i> <?php echo $rowgetcustomer['customerdob']; ?>
								</li>
							</ul>

							<?php
							if ($driver == 'nodriver'): ?>
								</div>
								<div>
							<?php endif; ?>

						</div>

						<div class="col-md-4 col-sm-4 col-xs-12 profile_left">
							<h4 align="center">Car Detail</h4>
							<div class="profile_img">
								<div id="crop-avatar">
								<!-- Current avatar -->
									<img class="img-responsive img-circle avatar-view"  src="images/carphoto/<?php echo $rowgetcar['carphoto']; ?>" alt="Avatar">
								</div>
							</div>
							<h4><?php echo $rowgetcar['carname']; ?></h4>

							<ul class="list-unstyled user_data">
								<li><i class="fa fa-car user-profile-icon"></i> <?php echo $rowgetcar['carname']; ?>
								</li>

								<li>
									<i class="fa fa-bus user-profile-icon"></i> <?php echo $rowgetcar['carclass']; ?>
								</li>

								<li><i class="fa fa-cog user-profile-icon"></i> <?php echo $rowgetcar['cartransmission']; ?>
								</li>
								
								<li><i class="fa fa-car user-profile-icon"></i> <?php echo $rowgetcar['cartype']; ?>
								</li>
								
								<li id="passengerqty"><i class="fa fa-users user-profile-icon"></i> <?php echo $rowgetcar['carcapacity']; ?> Persons
								</li>
								
								<li><i class="fa fa-bolt user-profile-icon"></i> <?php echo $rowgetcar['carairbag']; ?>
								</li>
								
								<li><i class="fa fa-info user-profile-icon"></i> <?php echo $rowgetcar['carotherdescription']; ?>
								</li>
							</ul>
						</div>


						<?php

							if ($driver == 'nodriver'):
								$rowbooking['driverid'] = 'nodriver';
							else:

						?>
						<div class="col-md-4 col-sm-4 col-xs-12 profile_left">
								<h4 align="center">Driver Detail</h4>
								<div class="profile_img">
									<div id="crop-avatar">
									<!-- Current avatar -->
										<img class="img-responsive img-circle avatar-view"  src="images/driverphoto/<?php echo $rowgetdriver['driverphoto']; ?>" alt="Avatar">
									</div>
								</div>
								<h4><?php echo $rowgetdriver['drivername']; ?></h4>

								<ul class="list-unstyled user_data">
									<li><i class="fa fa-user-circle-o user-profile-icon"></i> <?php echo $rowgetdriver['driverusername']; ?>
									</li>

									<li>
									<i class="fa fa-envelope user-profile-icon"></i> <?php echo $rowgetdriver['driveremail']; ?>
									</li>

									<li>
									<i class="fa fa-male user-profile-icon"></i> <?php echo $rowgetdriver['drivergender']; ?>
									</li>

									<li>
									<i class="fa fa-drivers-license-o user-profile-icon"></i> <?php echo $rowgetdriver['driverstatus']; ?>
									</li>

									<li>
									<i class="fa fa-money user-profile-icon"></i> <?php echo $rowgetdriver['drivercost']; ?> per Hour
									</li>

									<li>
									<i class="fa fa-star user-profile-icon"></i> <?php echo $rowgetdriver['driverrating']; ?> Stars
									</li>
								</ul>
						</div>
						<?php
							endif;
						?>
					
				</div>

				<div class="col-md-3 col-md-offset-1 calculate-fees">
					<h3>Fees</h3><hr>
					<ul class="list-unstyled user_data" style="text-align: center; font-size: 1.2em; color: #efc;">
						<li><i class="fa fa-car"></i> Car Cost : $<?php echo $carcost; ?></li><hr>
						<li><i class="fa fa-male"></i> Driver Cost : $<?php echo $drivercost; ?></li><hr>
						<li><i class="fa fa-clock-o"></i> Duration in Hours : <?php echo $durationinhours; ?></li>
						<hr>
						<li><i class="fa fa-credit-card"></i> Total Cost : $<?php echo $totalcost = $carcost + $drivercost; $rowbooking['totalcost'] = $totalcost; ?></li><hr>
						<li><i class="fa fa-money"></i> Payment Method : <?php echo $rowbooking['paymentmethod']; ?></li>
					</ul>
				</div>
			</div>
		</div>

	<?php
	?>
			
	</body>

	<!-- jQuery -->
	<script src="javascripts/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="javascripts/bootstrap.min.js"></script>
	<!-- SweetAlert -->
	<script src="javascripts/sweetalert-dev.js"></script>
	<script>
	</script>
</html>