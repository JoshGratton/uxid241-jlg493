<?php
// Enforces strict data types across the file
declare(strict_types=1);


require 'config.php';

$site_title = 'My Cookbook';


mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Connect to the database; exit with an error message if it fails
try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
  mysqli_set_charset($conn, 'utf8mb4'); // Ensures special characters display correctly
} catch (mysqli_sql_exception $e) {
  exit('Connection failed: ' . $e->getMessage());
}

// Fetch all recipes from the database, sorted alphabetically
$result = mysqli_query($conn, 'SELECT id, title FROM recipes ORDER BY title');

$db_recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Search variables — set defaults before checking if the form was submitted
$query = '';
$results = [];
$searched = false;
$error = '';

// checks if the 'q' key exists in the URL 
if (isset($_GET['q'])) {
  $query = trim($_GET['q']); // trim() strips whitespace from both ends of the input

  if ($query === '') {
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    $like = '%' . $query . '%'; 

    $result = mysqli_execute_query(
      $conn,
      'SELECT id, title FROM recipes WHERE title LIKE ? ORDER BY title',
      [$like] // Value that replaces the ?
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
  <!-- htmlspecialchars() escapes output to prevent XSS attacks -->
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
    
    <input type="search" id="q" name="q" value="<?= htmlspecialchars($query) ?>">
    <button type="submit">Search</button>
  </form>

  <!-- Only show if there's a validation error -->
  <?php if ($error !== '') : ?>
    <p><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <!-- Only show results section if the user actually searched -->
  <?php if ($searched) : ?>
    <!-- count() returns an int so (string) cast is needed for htmlspecialchars -->
    <p><?= htmlspecialchars((string) count($results)) ?> result(s) for "<?= htmlspecialchars($query) ?>"</p>
    <ul>
      <?php foreach ($results as $recipe) : ?>
        <li><?= htmlspecialchars($recipe['title']) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>