<?php
  $dbhost = "localhost";
  $dbuser = "root";
  $dbpass = "joseph99";
  $dbname = "ezride";

  $conn = @mysql_connect($dbhost, $dbuser, $dbpass);
  mysql_select_db($dbname, $conn);
?>

