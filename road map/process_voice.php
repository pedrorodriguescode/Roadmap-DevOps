<?php
include "connect.php";
header('Content-Type: application/json');
$found = false;

if (isset($_POST['voiceToText'])) {
    $voiceToText = strtolower($_POST['voiceToText']);
    if (strpos($voiceToText,"mark") !== false) {
        preg_match('/(\d+)[\.\/](\d+)/', $voiceToText, $matches);
        if (!isset($matches[1]) || !isset($matches[2])) {
            echo json_encode([
                "message" => "Sorry, I didn't understand. Could you repeat the command?"
            ]);
            exit;
        }
        $query = mysqli_query($mysqlicon, "SELECT order_number, id FROM categories WHERE (order_number = '". $matches[1] ."')");
        while ($row = mysqli_fetch_array($query)) {
            if ($row != 0) {
                $offset = $matches[2] - 1;
                $query2 = mysqli_query($mysqlicon, "SELECT id, name FROM topics WHERE category_id ='". $row['id'] ."' LIMIT 1 OFFSET $offset");
                $row1 = mysqli_fetch_array($query2);
                if ($row1 != 0) {
                    mysqli_query($mysqlicon, "UPDATE topics SET status='Done' WHERE id ='". $row1['id'] . "'");
                    echo json_encode([
                        "message" => $row1['name'] . " has been marked as done.",
                        "reload" => true
                    ]);
                } else {
                    echo json_encode([
                        "message" => "Sorry, I didn't understand. Could you repeat the command?"
                    ]);
                }
                $found = true;
            }
        }
        if (!$found) {
            echo json_encode([
                "message" => "Sorry, I didn't understand. Could you repeat the command?"
            ]);
        }
    }
}
?>
