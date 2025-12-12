<?php
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);

  include "../backend/connect.php";
  header('Content-Type: application/json');
  $found = false;
  $error = "Sorry, I didn't understand. Could you repeat the command?";

  if (isset($_POST['voiceToText'])) {

    $voiceToText = strtolower($_POST['voiceToText']);
    $words = ["mark","unmark","read"];
    $noword = true;

    foreach ($words as $word) {
      $pos = strpos($voiceToText, $word);
      if ($pos !== false) { 
        $voiceToTextEdited = substr($voiceToText, $pos);
        $noword = false;
      }
    }

    if ($noword) { echo json_encode(["message"=> $error]); exit; } 

    if (!empty($voiceToTextEdited)) {
      
      $voiceToTextRemoved = str_replace(["mark ","un","read ",],"", $voiceToTextEdited);
      preg_match('/(\d+)[\.\/](\d+)/', $voiceToTextRemoved, $matches);
      $voiceToTextRemoveddot = str_replace(".", "",$voiceToTextRemoved);
      $query1 = mysqli_query($mysqlicon, "SELECT name, id, description FROM topics WHERE LOWER(name)='$voiceToTextRemoveddot'");
      $row1 = mysqli_fetch_array($query1);

      if (!empty($matches[1]) && !empty($matches[2])) {
        $category_number = $matches[1];
        $topic_number = $matches[2] - 1;
      } else if ($row1 != 0){
        $topic_number = $row1["id"];
        $topic_name = $row1["name"];
        $topic_description = $row1["description"];
      } else {
        echo json_encode(["message"=> $error]);
        exit;
      }

      if (!empty($category_number) || !empty($topic_number)) {

        if (!empty($category_number)) {
          $query2 = mysqli_query($mysqlicon, "SELECT order_number, id FROM categories WHERE (order_number = '$category_number')");
          $row2 = mysqli_fetch_array($query2);
          if ($row2 != 0) {
            $query3 = mysqli_query($mysqlicon, "SELECT id, name, description FROM topics WHERE category_id ='". $row2['id'] ."' LIMIT 1 OFFSET $topic_number");
            $row3 = mysqli_fetch_array($query3);
            if ($row3 != 0) {
              $topic_number = $row3['id'];
              $topic_name = $row3['name'];
              $topic_description = $row3['description'];
            } else {
              echo json_encode(["message"=> $error]);
              exit;
            }
          } else {
            echo json_encode(["message"=> $error]);
            exit;
          }
        }

        if ($topic_number) {
          if (strpos ($voiceToTextEdited,"unmark") !== false) {
            mysqli_query($mysqlicon, "UPDATE topics SET status='To Do' WHERE id ='$topic_number'");
            echo json_encode(["message" => $topic_name . " has been unmarked"]);
            exit;
          } else if (strpos ($voiceToTextEdited,"mark") !== false) {
            mysqli_query($mysqlicon, "UPDATE topics SET status='Done' WHERE id ='$topic_number'");
            echo json_encode(["message" => $topic_name . " has been marked as done."]);
            exit;
          } else if (strpos ($voiceToTextEdited,"read") !== false) {
            mysqli_query($mysqlicon, "SELECT description,id FROM topics WHERE id ='$topic_number'");
            echo json_encode(["message" => $topic_description]);
            exit;
          }
        }

      }
    }
  }
?>
