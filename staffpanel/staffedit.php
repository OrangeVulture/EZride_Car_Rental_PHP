<?php	
	if (!isset($_GET['staffid'])) {
		echo "<script>window.location='mdashboard.php'</script>";
	}
	session_start();

	include('../dbconfig/dbconfig.php');

	if (!$_SESSION['managerauth']) {
		echo "<script>window.location='../adminlogin.php'</script>";
	}

	$staffid = $_SESSION['staffid'];
	$username = $_SESSION['staffusername'];

	$getstaffsql = mysql_query("Select * from Staffs where staffid = '$staffid'");
	$rowgetstaff = mysql_fetch_assoc($getstaffsql);
	$staffname = $rowgetstaff['staffname'];
	$staffphoto = $rowgetstaff['staffphoto'];
	$officeid = $rowgetstaff['officeid'];

	$editstaffid = $_GET['staffid'];
	$geteditstaffsql = mysql_query("Select * from Staffs where staffid = '$editstaffid'");
	$rowgeteditstaff = mysql_fetch_assoc($geteditstaffsql);

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>EZride - Staff Registration</title>

		<!-- Bootstrap -->
		<link href="../style/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="../fa/css/font-awesome.min.css" rel="stylesheet">
		<!-- Site Logo -->
		<link href = "../images/design/logo.png" rel="icon" type="image/png">

		<!-- Custom Theme Style -->
		<link href="../style/custom.min.css" rel="stylesheet">
		<link href="../style/customstyle.css" rel="stylesheet">
		<!-- Sweet Alert -->
		<link rel="stylesheet" href="../style/sweetalert.css">
	</head>

	<body class="nav-md">
		<div class="container body">
			<div class="main_container">
				<div class="col-md-3 left_col">
					<div class="left_col scroll-view">
						<div class="navbar nav_title" style="border: 0;">
							<a href="mdashboard.php" class="site_title"><i class="fa fa-car"></i><span>EZride</span></a>
						</div>

						<div class="clearfix"></div>

						<!-- menu profile quick info -->
						<div class="profile clearfix">
							<div class="profile_pic">
								<img src="../images/staffphoto/<?php echo $staffphoto; ?>" alt="..." class="img-circle profile_img">
							</div>
							<div class="profile_info">
								<span>Welcome,</span>
								<h2><?php echo $staffname; ?></h2>
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- /menu profile quick info -->

						<br />

						<!-- sidebar menu -->
						<?php
							include ('misc/_sidebarmenu.php');
						?>
					</div>
				</div>

				<!-- top navigation -->
						<?php
							include('misc/_navigationbar.php');
						?>
				<!-- /top navigation -->

				<!-- page content -->
				<div class="right_col" role="main">
					<div class="">
						<div class="page-title">
							<div class="title_left">
								<h3>Edit Staff</h3>
							</div>
							<div class="pull-right"><a href="staffmanagement.php"><i class="fa fa-close"></i></a></div>
						</div>

						<div class="clearfix"></div>

						<div class="row">
							<div class="x_panel">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<form method="post" class="form-horizontal form-label-left" enctype="multipart/form-data">

										<div class="profile_img">
											<div id="crop-avatar">
											<!-- Current avatar -->
												<img class="img-circle avatar-view center-block" width="200px" height="200px" src="../images/staffphoto/<?php echo $rowgeteditstaff['staffphoto']; ?>" alt="Avatar"><br>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12" for="staffphoto">Change Photo
											</label>
											
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="file" name="staffphoto" class="form-control col-md-7 col-xs-12">
											</div>
										</div>

									<div class="form-group">
										<label for="staffusername" class="control-label col-md-3 col-sm-3 col-xs-12">Staff Username</label>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="staffusername" value="<?php echo $rowgeteditstaff['staffusername']; ?>" readonly required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>

									<div class="form-group">

										<label class="control-label col-md-3 col-sm-3 col-xs-12" for="staffname">Staff Name <span class="required">*</span>
										</label>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="staffname" value="<?php echo $rowgeteditstaff['staffname']; ?>" required="required" class="form-control col-md-7 col-xs-12">
										</div>

									</div>

									<div class="form-group">
										<label for="staffemail" class="control-label col-md-3 col-sm-3 col-xs-12">Staff Email</label>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="email" name="staffemail" value="<?php echo $rowgeteditstaff['staffemail']; ?>" required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12" for="officeid">Office
										</label>
										
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" value="<?php echo $rowgeteditstaff['officeid']; ?>" name="officeid" readonly class="form-control col-md-7 col-xs-12">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">Staff Role
										</label>

										<?php
											$staffrole = $rowgeteditstaff['staffrole'];
											if ($staffrole == 'staff') {
												$scheck = 'checked';
												$bmcheck = '';
											}
											else{
												$scheck = 'checked';
												$bmcheck = '';
											}
										?>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="radio" value="staff" <?php echo $scheck; ?> name="staffrole"> Staff
											<input type="radio" value="branchmanager" <?php echo $bmcheck; ?> name="staffrole"> Branch Manager
										</div>

										<div class="col-md-6 col-sm-6 col-xs-12">
										</div>
									</div>

									<div class="ln_solid"></div>

									<div class="form-group">
										<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
											<input type="submit" name="submit" value="Update" class="btn btn-success">
											<input type="reset" name="reset" value="Reset" class="btn btn-primary">
											<a href="staffmanagement.php"><button class="btn btn-danger" type="button">Cancel</button></a>
										</div>
									</div>

								</form>

							</div>
						</div>
						</div>
					</div>
				</div>
				<!-- /page content -->

				<!-- footer content -->
				<footer>
					<div class="pull-right">
						<!-- Xero - Online Car Rental by <a href="index.php">Xero</a> -->
					</div>
					<div class="clearfix"></div>
				</footer>
				<!-- /footer content -->
			</div>
		</div>

		<!-- jQuery -->
		<script src="../javascripts/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="../javascripts/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script src="../javascripts/fastclick.js"></script>
		
		<!-- Custom Theme Scripts -->
		<script src="../javascripts/custom.min.js"></script>
		<!-- SweetAlert -->
		<script src="../javascripts/sweetalert-dev.js"></script>

		<script>
			
		</script>

		<?php
			
			if (isset($_POST['submit'])):
				$staffname = $_POST['staffname'];
				$staffemail = $_POST['staffemail'];
				$staffrole = $_POST['staffrole'];

				$staffphoto = $_FILES['staffphoto']['name'];
				$tmp = $_FILES['staffphoto']['tmp_name'];

				if ($staffphoto) {
					$allowfiletype =  array('GIF','PNG' ,'JPG', 'gif', 'png', 'jpg');
					$ext = end((explode(".", $staffphoto)));
					if(!in_array($ext, $allowfiletype) ) {
					    echo "<script>swal({
					    title: 'Oops!',
					    text: 'Only Image Files (gif, png, jpg) are allowed!',
					    type: 'error',
					    timer: 1000,
					    showConfirmButton: false
					    });</script>";
					}
					else{
						move_uploaded_file($tmp, "../images/staffphoto/$staffphoto");
						mysql_query("UPDATE Staffs Set staffname = '$staffname', staffemail = '$staffemail', staffrole = '$staffrole', staffphoto = '$staffphoto' where staffid = '$editstaffid'");
							echo "<script>swal({
							title: 'Success!',
							text: 'Staff Information has been updated!',
							type: 'success',
							timer: 1000,
							showConfirmButton: false
							}, function(){
							window.location.href = 'staffmanagement.php';
							});</script>";
					}
				}
				else{
					mysql_query("UPDATE Staffs Set staffname = '$staffname', staffemail = '$staffemail', staffrole = '$staffrole' where staffid = '$editstaffid'");
					echo "<script>swal({
					title: 'Success!',
					text: 'Staff Information has been updated!',
					type: 'success',
					timer: 1000,
					showConfirmButton: false
					}, function(){
					window.location.href = 'staffmanagement.php';
					});</script>";
				}
			endif;
		?>
	</body>
</html>
