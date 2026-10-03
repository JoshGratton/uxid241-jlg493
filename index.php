<?php
declare(strict_types=1);

$site_title = 'My Cookbook';

// Sample recipes to search through
$recipes = [
  'Pancakes',
  'Chicken Tikka Masala',
  'Caesar Salad',
  'Spaghetti Carbonara',
  'Vegetable Stir Fry',
];

// GET form handling
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
    foreach ($recipes as $recipe) {
      if (str_contains(strtolower($recipe), strtolower($query))) {
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

  <h2>Search recipes</h2>
  <form action="index.php" method="get">
    <label for="q">Recipe name contains</label>
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
        <li><?= htmlspecialchars($recipe) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

</body>
</html>