<?php
  $host = "localhost";
  $user = "root";
  $pass = "";
  $db = "roadmap.devops";
  
  $mysqlicon = mysqli_connect($host, $user,$pass,$db);

  if (mysqli_connect_errno()) {
      echo "Mysqli error: " . mysqli_connect_error(); 
  }
?>