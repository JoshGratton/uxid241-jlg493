<?php
// Required at the top of every PHP file per assignment rules
declare(strict_types=1);

// Pulls in $db_host, $db_user, $db_pass, $db_name from config.php
require 'config.php';

$site_title = 'My Cookbook';

// Tells mysqli to throw exceptions on errors instead of silently failing
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Connect to the database using credentials from config.php
try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
  // Set character encoding so special characters display correctly
  mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
  exit('Connection failed: ' . $e->getMessage());
}

// Fetch all recipes for the "All recipes" list
// No user input here so mysqli_query is fine — no prepared statement needed
$result = mysqli_query($conn, 'SELECT id, title FROM recipes ORDER BY title');
// MYSQLI_ASSOC gives us each row as ['id' => 1, 'title' => 'Pasta', ...]
$db_recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Search variables
$query = '';
$results = [];
$searched = false;
$error = '';

// isset() checks if the form was submitted (q key exists in the URL)
if (isset($_GET['q'])) {
  $query = trim($_GET['q']);

  if ($query === '') {
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    // % wildcards let LIKE match anywhere in the title
    $like = '%' . $query . '%';
    // mysqli_execute_query is the prepared statement version
    // ? is a safe placeholder — prevents SQL injection
    $result = mysqli_execute_query(
      $conn,
      'SELECT id, title FROM recipes WHERE title LIKE ? ORDER BY title',
      [$like]
    );
    $results = mysqli_fetch_all($result, MYSQLI_ASSOC);
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
    <?php foreach ($db_recipes as $recipe) : ?>
      <li><?= htmlspecialchars($recipe['title']) ?></li>
    <?php endforeach; ?>
  </ul>

  <h2>Search recipes</h2>
  <!-- method="get" puts the search term in the URL as ?q=... -->
  <form action="index.php" method="get">
    <label for="q">I want to make some...</label>
    <!-- value= repopulates the box with what the user typed after submit -->
    <input type="search" id="q" name="q" value="<?= htmlspecialchars($query) ?>">
    <button type="submit">Search</button>
  </form>

  <!-- Only show error if there is one -->
  <?php if ($error !== '') : ?>
    <p><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <!-- Only show results if user actually searched -->
  <?php if ($searched) : ?>
    <p><?= htmlspecialchars((string) count($results)) ?> result(s) for "<?= htmlspecialchars($query) ?>"</p>
    <ul>
      <?php foreach ($results as $recipe) : ?>
        <li><?= htmlspecialchars($recipe['title']) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>