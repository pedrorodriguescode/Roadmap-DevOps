<?php
  include "../backend/connect.php";
  header('Content-Type: application/json');
  if (isset($_POST['topic_id'])) {
    $topic_id = intval($_POST['topic_id']);
    $result = mysqli_query($mysqlicon, "SELECT name, description FROM topics WHERE id = $topic_id");
    if ($row = mysqli_fetch_assoc($result)) {
      echo json_encode([
        'name' => $row['name'],
        'description' => $row['description']
      ]);
    }
  }
?>