<?php
	session_start();
	$driverid = $_SESSION['driverid'];
	include('../dbconfig/dbconfig.php');
	$sql = mysqli_query($conn,"update drivers set lastlogin = NOW() where driverid = '$driverid'");
	session_destroy();
	header("location: ../driverlogin.php");
?>