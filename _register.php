<?php

include 'dbconfig/dbconfig.php'; 
$customername = $_SESSION['customername'];
$customeremail = $_SESSION['customeremail'];
$customerusername = $_SESSION['customerusername'];
$customerpassword = $_SESSION['customerpassword'];
$confirmpassword = $_SESSION['confirmpassword'];
$customergender = $_SESSION['customergender'];
$customerdob = $_SESSION['customerdob'];

$customerpassword = md5($customerpassword);

$getlatestid = mysqli_query($conn,"SELECT customerid FROM customers WHERE SUBSTRING(customerid,4) = (SELECT MAX(CAST(SUBSTRING(customerid,4) AS SIGNED)) FROM customers)"); 
$queryrow = mysqli_num_rows($getlatestid);

if ($queryrow < 1){
	$customerid = 'cus1';
}

else{
	  while ($row = mysqli_fetch_assoc($getlatestid)):
	    $lastid =  $row['customerid'];
		$lastid = preg_replace("/[^0-9]/","",$lastid);
	  endwhile;
	  $lastid = $lastid + 1;
	  $customerid = 'cus'.$lastid;
}

$registersql = mysqli_query($conn,"insert into customers(customerid, customername, customerusername, customeremail, customerpassword, customergender, customerdob, customerphoto, signuptime) values('$customerid','$customername', '$customerusername', '$customeremail', '$customerpassword', '$customergender', '$customerdob', 'customer.png', NOW())") or die(mysqli_error($conn));
if (isset($_POST['paypal'])) {
	$paypalemail = $_POST['paypalemail'];
	$paypalpassword = $_POST['paypalpassword'];
	$paypalpassword = md5($paypalpassword);
	$registerpaypalsql = mysqli_query($conn,"insert into paypalserver(paypalemail, paypalpassword, customerid, balance) values('$paypalemail', '$paypalpassword', '$customerid', 10000)") or die(mysqli_error($conn));
	}

$_SESSION['authentication'] = true;
$_SESSION['customerusername'] = $customerusername;
$_SESSION['customerid'] = $customerid;
echo "<script>swal({
title: 'Success!',
text: 'Your account has been created!',
type: 'success',
timer: 1000,
showConfirmButton: false
}, function(){
window.location.href = 'profile.php';
});</script>";

?>