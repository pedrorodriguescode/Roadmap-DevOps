<?php
include "connect.php";

$query = mysqli_query($mysqlicon, "SELECT COUNT(*) AS topicCount, SUM(status='Done') AS doneCount FROM topics");
$row = mysqli_fetch_array($query);
$topicCount = $row['topicCount'];
$doneCount = $row['doneCount'];

$query1 = mysqli_query($mysqlicon, "SELECT COUNT(*) AS categoryCount FROM categories");
$row = mysqli_fetch_array($query1);
$categoryCount = $row['categoryCount'];

for ($i = 1; $i <= $categoryCount; $i++) {
    $query2 = mysqli_query($mysqlicon, "SELECT COUNT(*) AS topicCount, SUM(status='Done') AS doneCount FROM topics WHERE category_id='$i'");
    $row2 = mysqli_fetch_array($query2);
    $categoryTopicCount[$i] = $row2['topicCount'];
    $categoryDoneCount[$i] = $row2['doneCount'];
}

echo json_encode(['topicCount' => $topicCount, 'doneCount' => $doneCount, 'categoryTopicCount' => $categoryTopicCount, 'categoryDoneCount' => $categoryDoneCount , 'categoryCount' => $categoryCount]);
?>
