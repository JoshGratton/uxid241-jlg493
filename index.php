<?php


declare(strict_types=1);
require 'config.php';

$site_title = 'My Cookbook';

// Makes mysqli throw exceptions on errors instead of failing silently
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Connect to the database
try {
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
  mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
  exit('Connection failed: ' . $e->getMessage());
}

// Get all categories for the filter dropdown
$cat_result = mysqli_query($conn, 'SELECT id, name FROM categories ORDER BY name');
$categories = mysqli_fetch_all($cat_result, MYSQLI_ASSOC);

// Read search term and category filter from the URL
$query = isset($_GET['q']) ? trim($_GET['q']) : '';
$category_id = isset($_GET['cat']) ? (int) $_GET['cat'] : 0;
$error = '';

// Build the recipe query — always fetches something
// If search or filter is active, use a prepared statement (user input in SQL)
if ($query !== '' || $category_id > 0) {
  // Start with a base query and add WHERE clauses dynamically
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

  // Use prepared statement because user input is going into SQL
  $stmt = mysqli_prepare($conn, $sql);
  if ($params) {
    mysqli_stmt_bind_param($stmt, $types, ...$params);
  }
  mysqli_stmt_execute($stmt);
  $stmt_result = mysqli_stmt_get_result($stmt);
  $recipes = mysqli_fetch_all($stmt_result, MYSQLI_ASSOC);
  $searched = true;
} else {
  // No user input — mysqli_query is fine here
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
  <h1><a href="index.php"><?= htmlspecialchars($site_title) ?></a></h1>
  <nav>
    <a href="index.php">Home</a>
  </nav>
</header>

<div class="container">

  <!-- Search and filter form -->
  <!-- method="get" puts values in the URL so results are shareable/bookmarkable -->
  <form class="search-bar" action="index.php" method="get">
    <input type="search" name="q" placeholder="Search recipes..." value="<?= htmlspecialchars($query) ?>">

    <!-- Category filter dropdown — populated from the categories table -->
    <select name="cat">
      <option value="0">All categories</option>
      <?php foreach ($categories as $cat) : ?>
        <option value="<?= htmlspecialchars((string) $cat['id']) ?>"
          <?= $category_id === (int) $cat['id'] ? 'selected' : '' ?>>
          <?= htmlspecialchars($cat['name']) ?>
        </option>
      <?php endforeach; ?>
    </select>

    <button type="submit">Search</button>

    <?php if ($searched) : ?>
      <!-- Clear link resets both search and filter -->
      <a href="index.php" style="font-size:0.9rem; color:#555;">Clear</a>
    <?php endif; ?>
  </form>

  <?php if ($error !== '') : ?>
    <p class="error"><?= htmlspecialchars($error) ?></p>
  <?php endif; ?>

  <?php if ($searched) : ?>
    <p class="results-message">
      <?= htmlspecialchars((string) count($recipes)) ?> result(s)
      <?= $query !== '' ? 'for "' . htmlspecialchars($query) . '"' : '' ?>
    </p>
  <?php endif; ?>

  <!-- Recipe grid — each card links to the detail page -->
  <div class="recipe-grid">
    <?php foreach ($recipes as $recipe) : ?>
      <a href="recipe.php?id=<?= htmlspecialchars((string) $recipe['id']) ?>" class="recipe-card">
        <?php if (!empty($recipe['main_image'])) : ?>
          <img src="<?= htmlspecialchars($recipe['main_image']) ?>" alt="<?= htmlspecialchars($recipe['title']) ?>">
        <?php else : ?>
          <!-- Placeholder if no image exists yet -->
          <div style="height:180px; background:#e4e4e7; display:flex; align-items:center; justify-content:center; color:#999;">No image</div>
        <?php endif; ?>
        <div class="recipe-card-body">
          <h3><?= htmlspecialchars($recipe['title']) ?></h3>
          <span class="category"><?= htmlspecialchars($recipe['category'] ?? '') ?></span>
          <p class="meta">Serves <?= htmlspecialchars((string) ($recipe['servings'] ?? '')) ?></p>
        </div>
      </a>
    <?php endforeach; ?>
  </div>

</div>

<footer>
  <p>My Cookbook &mdash; UXID241 &mdash; Drexel University</p>
</footer>

</body>
</html>