<?php
  include "connect.php";
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['categories'])) {
      if (!empty($_POST['name']) && !empty($_POST['description'])) {
        $name = $_POST ['name'];
        $description = $_POST ['description'];
        mysqli_query($mysqlicon, "INSERT INTO categories (name, description) VALUES ('$name', '$description')");
      }
    } else if (isset($_POST['topics'])) {
      if (!empty($_POST['name']) && !empty($_POST['description']) && !empty($_POST['category'])) {
        $name = $_POST ['name'];
        $description = $_POST ['description'];
        $category = $_POST['category'];
        mysqli_query($mysqlicon, "INSERT INTO topics (name, description, category_id) VALUES ('$name', '$description', '$category')");
      }
    }
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  <style>
    html, body {
      height: 100%;
      margin: 0;
    }
  </style>
</head>
<body>
  <div id="manage" class="container-fluid d-flex h-100 align-items-center justify-content-center">
    <div id="row" class="col-md-10 d-flex justify-content-center border shadow rounded border-primary-subtle">
      <div id="categories" class="col-md-6">
        <form class="m-3 p-3" method="post">
          <h1>Categories</h1>
          <div class="mb-3">
            <label for="name" class="name">Name</label>
            <input name="name" class="form-control" id="name" required>
          </div>
          <div class="mb-3">
            <label for="description" class="description">Description</label>
            <input name="description" type="text" class="form-control" id="description" required>
          </div>
          <button type="submit" name="categories" class="btn btn-primary">Create</button>
        </form>
      </div>
      <div id="topics" class="col-md-6">
        <form class="m-3 p-3" method="post">
          <h1>Topics</h1>
          <div class="mb-3">
            <label for="name" class="name">Name</label>
            <input name="name" type="name" class="form-control" id="name" required>
          </div>
          <div class="mb-3">
            <label for="description" class="description">Description</label>
            <input name="description" type="name" class="form-control" id="description" required>
          </div>
          <div class="mb-3">
            <label for="category" class="category">Category</label>
            <select name="category" id="category" class="form-control" required>
              <option value="" disabled selected>--Select--</option>
                <?php
                  $categoriesSelect = mysqli_query($mysqlicon,"SELECT id, name FROM categories");
                  while ($row = mysqli_fetch_array($categoriesSelect)) {
                    if ($row != 0) {
                      echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                    }
                  }
                ?>
            </select>
          </div>
          <button type="submit" name="topics" class="btn btn-primary">Create</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>