<?php
// Required at the top of every PHP file per assignment rules
declare(strict_types=1);

// Pulls in $db_host, $db_user, $db_pass, $db_name from config.php
// config.php is gitignored so credentials never hit GitHub
require 'config.php';

$site_title = 'My Cookbook';

// Tells mysqli to throw exceptions on errors instead of silently failing
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Connect to the database using credentials from config.php
// Wrapped in try/catch so we get a readable error if connection fails
try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
  // Set character encoding to utf8mb4 so special characters display correctly
  mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
  // Stop the page and show the error message if connection fails
  exit('Connection failed: ' . $e->getMessage());
}

// Fetch ALL recipes for the "All recipes" list at the top of the page
// This query has no user input so mysqli_query is fine here (no prepared statement needed)
$result = mysqli_query($conn, 'SELECT id, title, ingredients FROM recipes ORDER BY title');
// MYSQLI_ASSOC means each row comes back as an associative array like ['title' => 'Pasta', ...]
$db_recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Set up variables for the search section
$query = '';     // what the user typed
$results = [];   // recipes that matched
$searched = false; // did the user actually submit a search?
$error = '';     // validation error message if they submitted empty

// isset() checks if the 'q' key exists in the URL (i.e. the form was submitted)
if (isset($_GET['q'])) {
  // trim() strips whitespace from both ends of the input
  $query = trim($_GET['q']);

  if ($query === '') {
    // User submitted the form but left it blank
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    // Wrap the search term in % wildcards for SQL LIKE matching
    // % means "anything before" and "anything after" — so 'chicken' matches 'Ancho-Orange Chicken'
    $like = '%' . $query . '%';
    // mysqli_execute_query is the prepared statement version
    // The ? is a placeholder — MySQL fills it in safely, no SQL injection possible
    // The third argument is an array of values to bind to the placeholders in order
    $result = mysqli_execute_query(
      $conn,
      'SELECT id, title, ingredients FROM recipes WHERE title LIKE ? ORDER BY title',
      [$like]
    );
    // Fetch the matching rows as an associative array
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
  <!-- htmlspecialchars() on every output prevents XSS attacks
       e.g. if $site_title contained <script>alert(1)</script> it would be escaped to plain text -->
  <p>Using PHP for this site. Yay!</p>

  <h2>All recipes</h2>
  <ul>
    <!-- foreach with colon/endforeach syntax mixes cleanly with HTML -->
    <?php foreach ($db_recipes as $recipe) : ?>
      <li><?= htmlspecialchars($recipe['title']) ?></li>
    <?php endforeach; ?>
  </ul>

  <h2>Search recipes</h2>
  <!-- method="get" puts the search term in the URL as ?q=... -->
  <!-- action="index.php" submits back to this same page -->
  <form action="index.php" method="get">
    <label for="q">I want to make some...</label>
    <!-- value= repopulates the input with what the user typed after submit -->
    <input type="search" id="q" name="q" value="<?= htmlspecialchars($query) ?>">
    <button type="submit">Search</button>
  </form>

  <!-- Only show the error if there is one -->
  <?php if ($error !== '') : ?>
    <p><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <!-- Only show results section if user actually searched -->
  <?php if ($searched) : ?>
    <!-- (string) cast needed because count() returns int and htmlspecialchars expects string -->
    <p><?= htmlspecialchars((string) count($results)) ?> result(s) for "<?= htmlspecialchars($query) ?>"</p>
    <ul>
      <?php foreach ($results as $recipe) : ?>
        <li>
          <?= htmlspecialchars($recipe['title']) ?>
          <!-- nl2br converts newline characters \n into <br> tags for display -->
          <!-- ?? '' is the null coalescing operator — fallback to empty string if ingredients is null -->
          <p><?= nl2br(htmlspecialchars((string) ($recipe['ingredients'] ?? ''))) ?></p>
        </li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>