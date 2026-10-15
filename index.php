<?php
declare(strict_types=1); // if not an integer, it corrects

require 'config.php';

$site_title = 'My Cookbook';

// Connect to the database
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT); // Tells MySQL to throw exceptions when something goes wrong

try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name); // Opens a connection to your MySQL database, $conn is the connnection object
  mysqli_set_charset($conn, 'utf8mb4'); // special characters display correctly
} catch (mysqli_sql_exception $e) {
  exit('Connection failed: ' . $e->getMessage());
}

// added incredients to the select, also grabbing the info from the ingredients column
$result = mysqli_query($conn, 'SELECT id, title, ingredients FROM recipes ORDER BY title');
$db_recipes = mysqli_fetch_all($result, MYSQLI_ASSOC); // MYSQLI_ASSOC means each row is an associative array, can access columns

// GET search form
$query = '';
$results = [];
$searched = false;
$error = '';

if (isset($_GET['q'])) { // contains anything submitted in the URL
  $query = trim($_GET['q']);

  if ($query === '') {
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    foreach ($db_recipes as $recipe) {
      if (str_contains(strtolower($recipe['title']), strtolower($query))) { // converts both the recipe title and the search term to lowercase first
        $results[] = $recipe;
      }
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($site_title) ?></title>
</head>
<body>
  <h1><?= htmlspecialchars($site_title) ?></h1>
  <p>Using PHP for this site. Yay!</p>

  <h2>All recipes</h2>
  <ul>
    <?php foreach ($db_recipes as $recipe) : ?> <!-- loop that runs once for each recipe -->
      <li><?= htmlspecialchars($recipe['title']) ?></li>
    <?php endforeach; ?>
  </ul>

  <h2>Search recipes</h2>
  <form action="index.php" method="get">
    <label for="q">I want to make some...</label>
    <input type="search" id="q" name="q" value="<?= htmlspecialchars($query) ?>">
    <button type="submit">Search</button>
  </form>

  <?php if ($error !== '') : ?>
    <p><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <?php if ($searched) : ?>
    <p><?= htmlspecialchars((string) count($results)) ?> result(s) for "<?= htmlspecialchars($query) ?>"</p>
    <ul>
      <?php foreach ($results as $recipe) : ?> 
        <li>
          <?= htmlspecialchars($recipe['title']) ?>
          <p><?= nl2br(htmlspecialchars((string) ($recipe['ingredients'] ?? ''))) ?></p> <!--pull ingredient text out of array --><!-- ?? is the null coalescing operator.. if ingredients is empty, page wont crash-->
        </li> <!-- the nl2br converts the newline characters (\n) in the ingredients text into HTML <br> tags, so each ingredient appears on its own line instead of running together -->
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>