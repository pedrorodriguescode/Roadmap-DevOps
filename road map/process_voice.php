<?php
include "connect.php";
header('Content-Type: application/json');

if (isset($_POST['voiceToText'])) {
    $voiceToText = $_POST['voiceToText'];
    $voiceToText = strtolower($voiceToText);
    if (strpos($voiceToText,"mark") !== false) {
        $voiceToText = str_ireplace(["mark", "as", "done",", ",".", "!", "?", ";", ":", "-", "_", "\"", "'"], "", $voiceToText);
        $voiceToText = implode(' ', array_filter(explode(' ', $voiceToText)));
        $query = mysqli_query($mysqlicon, "SELECT id, name FROM topics WHERE LOWER(name) = '$voiceToText'");
        while ($row = mysqli_fetch_array($query)) {
            if ($row != 0) {
                mysqli_query($mysqlicon, "UPDATE topics SET status='Done' WHERE (id ='" . $row['id'] . "')");
            }
        }
    } 




    echo json_encode([
        "recebido" => $voiceToText,
        "mensagem" => "PHP recebeu a fala com sucesso!"
    ]);
} else {
    echo json_encode([
        "erro" => true,
        "mensagem" => "Nada foi recebido"
    ]);
}
?>
