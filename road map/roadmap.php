<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Roadmap</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  <style>
    html, body { height: 100%; margin: 0; }
    #roadmap .row > div { 
      transition: transform 0.3s ease;
    }
    #roadmap .row > div:nth-child(1) { transform: translateY(0px); }
    #roadmap .row > div:nth-child(2) { transform: translateY(-50px); }
    #roadmap .row > div:nth-child(3) { transform: translateY(-100px); }
    #roadmap .row > div:nth-child(4) { transform: translateY(-50px); }
    #roadmap .row > div:nth-child(5) { transform: translateY(0px); }
    #roadmap .row > div:nth-child(6) { transform: translateY(50px); }
    #roadmap .row > div:nth-child(7) { transform: translateY(100px); }
    #roadmap .row > div:nth-child(8) { transform: translateY(50px); }
    #roadmap .row.col-md-10 {
      min-height: 800px; 
      display: flex;
      flex-wrap: wrap; 
      gap: 3rem; 
      align-items: center;
    }
    #roadmap .row.col-md-10::after {
      content: '';
      position: absolute;
      top: 50%;             
      left: 0%;           
      width: 400rem;          
      height: 1px;          
      background-color: #9ec5fe;
    }
    #roadmap .row.col-md-10 > div {
      position: relative;
      z-index: 10;
      background-color: white;
    }
    li.border-primary-subtle {          
      border-style: solid;            
      transition: border-width 0.3s ease; 
      box-sizing: border-box;
    }           
    li.border-primary-subtle:hover {
      transform: translateY(-3px);
    }
  </style>
</head>
<body>
  <div id="roadmap" class="container-fluid align-items-center justify-content-center d-flex h-100">
    <div class="row col-md-10 p-4">
      <?php
        include "connect.php";
        $categoriesSelect = mysqli_query($mysqlicon, "SELECT id, name, order_number FROM categories ORDER BY order_number ASC");
        while ($row = mysqli_fetch_array($categoriesSelect)) {
          if ($row != 0) {
            $topicsSelect = mysqli_query($mysqlicon, "SELECT name, status, category_id FROM topics WHERE (category_id='" .$row['id'] . "')");
            echo '<div class="col-md-3 m-2 p-2 d-flex flex-column border shadow rounded border-primary-subtle"><b class="text-center w-100 d-block mb-1">'. $row['order_number'] . '. ' . $row['name'] . '</b><ul class="m-0 p-0 w-100" style="list-style:none; display:grid; grid-template-columns:repeat(2,1fr); gap:0px;">';
            while ($row1 = mysqli_fetch_array($topicsSelect)) {
              echo '<li style="font-size:14px;cursor: pointer;" class="mb-1 px-1 mx-1 border rounded border-primary-subtle shadow">'. $row1['name'] .'</li>';
            }
            echo '</ul></div>';
          }
        }
      ?>
    </div>
  </div>
</body>
</html>