<?php
declare(strict_types=1);

require 'config.php';

$site_title = 'My Cookbook';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
  mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
  exit('Connection failed: ' . $e->getMessage());
}

$result = mysqli_query($conn, 'SELECT id, title FROM recipes ORDER BY title');
$db_recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);

$query = '';
$results = [];
$searched = false;
$error = '';

if (isset($_GET['q'])) {
  $query = trim($_GET['q']);

  if ($query === '') {
    $error = 'Please enter a search term.';
  } else {
    $searched = true;
    $like = '%' . $query . '%';
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
        <li><?= htmlspecialchars($recipe['title']) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>