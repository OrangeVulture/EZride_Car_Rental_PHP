<?php
	session_start();
	include 'dbconfig/dbconfig.php';
	
	if (!isset($_SESSION['authentication'])) {
		echo "<script>window.location.href = 'index.php';</script>";
	}

	$carno = $_GET['carno'];
	$customerid = $_GET['customerid'];

	$deleteratingsql = mysqli_query($conn,"delete from carratings where customerid = '$customerid' and carno='$carno'") or die(mysqli_error($conn));

	$updateratingavg = mysqli_query($conn,"UPDATE cars SET carrating = (SELECT AVG(carrating) FROM carratings WHERE carratings.carno = '$carno') WHERE cars.carno = '$carno'") or die(mysqli_error($conn));
	echo "<script>window.location.href = 'cars.php';</script>";

?>