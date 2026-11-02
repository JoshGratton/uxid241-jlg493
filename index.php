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

$cat_result = mysqli_query($conn, 'SELECT id, name FROM categories ORDER BY name');
$categories = mysqli_fetch_all($cat_result, MYSQLI_ASSOC);

$query = isset($_GET['q']) ? trim($_GET['q']) : '';
$category_id = isset($_GET['cat']) ? (int) $_GET['cat'] : 0;
$error = '';

if ($query !== '' || $category_id > 0) {
  $sql = 'SELECT r.id, r.slug, r.title, r.main_image, r.servings, c.name AS category
          FROM recipes r
          LEFT JOIN categories c ON r.category_id = c.id
          WHERE 1=1';

  $params = [];
  $types = '';

  if ($query !== '') {
    $sql .= ' AND r.title LIKE ?';
    $params[] = '%' . $query . '%';
    $types .= 's';
  }

  if ($category_id > 0) {
    $sql .= ' AND r.category_id = ?';
    $params[] = $category_id;
    $types .= 'i';
  }

  $sql .= ' ORDER BY r.title';

  $stmt = mysqli_prepare($conn, $sql);
  if ($params) {
    mysqli_stmt_bind_param($stmt, $types, ...$params);
  }
  mysqli_stmt_execute($stmt);
  $stmt_result = mysqli_stmt_get_result($stmt);
  $recipes = mysqli_fetch_all($stmt_result, MYSQLI_ASSOC);
  $searched = true;
} else {
  $result = mysqli_query($conn, 'SELECT r.id, r.slug, r.title, r.main_image, r.servings, c.name AS category
                                  FROM recipes r
                                  LEFT JOIN categories c ON r.category_id = c.id
                                  ORDER BY r.title');
  $recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);
  $searched = false;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= htmlspecialchars($site_title) ?></title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
  <div class="container">
    <h1><a href="index.php"><?= htmlspecialchars($site_title) ?></a></h1>
    <nav>
      <a href="index.php">Home</a>
      <a href="login.php">Admin</a>
    </nav>
  </div>
</header>

<div class="search-bar">
  <div class="container">
    <form action="index.php" method="get">
      <input type="text" name="q" placeholder="Search recipes..." value="<?= htmlspecialchars($query) ?>">

      <select name="cat">
        <option value="0">All categories</option>
        <?php foreach ($categories as $cat): ?>
          <option value="<?= htmlspecialchars((string)$cat['id']) ?>"
            <?= $category_id === (int)$cat['id'] ? 'selected' : '' ?>>
            <?= htmlspecialchars($cat['name']) ?>
          </option>
        <?php endforeach; ?>
      </select>

      <button type="submit">Search</button>

      <?php if ($searched): ?>
        <a href="index.php">Clear</a>
      <?php endif; ?>
    </form>
  </div>
</div>

<div class="container">

  <div class="page-hero">
    <h2>All Recipes</h2>
    <?php if ($searched): ?>
      <p><?= htmlspecialchars((string)count($recipes)) ?> result(s)
        <?= $query !== '' ? 'for "' . htmlspecialchars($query) . '"' : '' ?></p>
    <?php else: ?>
      <p>Browse the collection</p>
    <?php endif; ?>
  </div>

  <?php if ($error !== ''): ?>
    <p class="error"><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <div class="recipe-grid">
    <?php foreach ($recipes as $recipe): ?>
    <a href="recipe.php?id=<?= $recipe['id'] ?>" class="recipe-card">
      <?php if ($recipe['main_image']): ?>
        <img src="<?= htmlspecialchars($recipe['main_image']) ?>"
             alt="<?= htmlspecialchars($recipe['title']) ?>">
      <?php else: ?>
        <div class="recipe-card-placeholder">🍽️</div>
      <?php endif; ?>
      <div class="recipe-card-body">
        <?php if ($recipe['category']): ?>
          <div class="recipe-card-category"><?= htmlspecialchars($recipe['category']) ?></div>
        <?php endif; ?>
        <h3><?= htmlspecialchars($recipe['title']) ?></h3>
        <div class="recipe-card-meta">Serves <?= htmlspecialchars((string)$recipe['servings']) ?></div>
      </div>
    </a>
    <?php endforeach; ?>

    <?php if (empty($recipes)): ?>
      <p class="no-results">No recipes found.</p>
    <?php endif; ?>
  </div>

</div>

<footer>
  <p>My Cookbook &mdash; UXID241 &mdash; Drexel University</p>
</footer>

</body>
</html>