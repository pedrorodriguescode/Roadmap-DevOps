<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Roadmap DevOps</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  <script src="../js/topic-modal.js"></script>
  <script src="../js/recognition-speech.js"></script>
</head>
<body>
  <!-- User-Guide -->
  <div id="user-guide" class="container-fluid justify-content-center align-items-center d-flex">
    <h3>
      Press <kbd>Shift</kbd> and say a command like: <i>mark 1.1, unmark HTML, or read 1.1</i>
    </h3>
    <div class="container-circle text-center ms-3">
        <div class="circle">
            <span class="value">100%</span>
        </div>
    </div>
  </div>
  </div>
  <!-- Roadmap -->
  <div id="roadmap" class="container-fluid align-items-center justify-content-center d-flex h-100">
    <div class="row col-md-10 p-4">
      <?php
        include "../backend/connect.php";
        $categoriesSelect = mysqli_query($mysqlicon, "SELECT id, name, order_number FROM categories ORDER BY order_number ASC");
        while ($row = mysqli_fetch_array($categoriesSelect)) {
          if ($row != 0) {
            $topicsSelect = mysqli_query($mysqlicon, "SELECT id, name, status, category_id FROM topics WHERE (category_id='" .$row['id'] . "')");
            echo '<div class="col-md-4 m-2 p-2 d-flex flex-column border shadow rounded border-primary-subtle">
                    <div class="align-items-center justify-content-center d-flex">
                      <b class="text-center mb-1 border-primary-subtle">'. $row['order_number'] . '. ' . $row['name'] . '</b>
                      <div class="circle category-circle ms-2 mb-1" data-category-id="' . $row['id'] . '">
                      </div>
                    </div>
                    <ul class="m-0 p-0 w-100" style="list-style:none; display:grid; grid-template-columns:repeat(2,1fr); gap:0px;">';
            $topicCount = 0;
            while ($row1 = mysqli_fetch_array($topicsSelect)) {
              echo '<li style="font-size:13px;cursor: pointer;" data-topic-id="' . $row1['id'] . '" data-bs-toggle="modal" data-bs-target="#exampleModal" class="mb-1 px-1 mx-1 border rounded border-primary-subtle">';
              $topicCount++;
              if ($row1['status'] == 'Done') {
                echo '✅  ' . ($topicCount < 10 ? '0' : '') . $topicCount . '. ';
              } else {
                echo '📝  ' . ($topicCount < 10 ? '0' : '') . $topicCount . '. ';
              } 
              echo $row1['name'] .'</li>';
            }
            echo '</ul></div>';
          }
        }
      ?>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body"></div>
      </div>
    </div>
  </div>
</body>
</html>

<script src="../js/progress-circle.js"></script>