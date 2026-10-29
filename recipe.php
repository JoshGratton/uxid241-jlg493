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

// Get the recipe ID from the URL  e.g. recipe.php?id=3
// (int) cast ensures it's always a whole number, never a string
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

// If no valid ID was given, send the user back to the homepage
if ($id <= 0) {
  header('Location: index.php');
  exit;
}

// Fetch the recipe row  prepared statement because $id came from the URL
$result = mysqli_execute_query(
  $conn,
  'SELECT r.id, r.title, r.subtitle, r.description, r.servings, r.main_image, c.name AS category
   FROM recipes r
   LEFT JOIN categories c ON r.category_id = c.id
   WHERE r.id = ?',
  [$id]
);
$recipe = mysqli_fetch_assoc($result);

// If no recipe was found for that ID, go back to homepage
if (!$recipe) {
  header('Location: index.php');
  exit;
}

// Fetch all ingredients for this recipe, in sort order
$ing_result = mysqli_execute_query(
  $conn,
  'SELECT full_text FROM ingredients WHERE recipe_id = ? ORDER BY sort_order',
  [$id]
);
$ingredients = mysqli_fetch_all($ing_result, MYSQLI_ASSOC);

// Fetch all cooking steps for this recipe, in step order
$steps_result = mysqli_execute_query(
  $conn,
  'SELECT step_number, step_title, instructions FROM steps WHERE recipe_id = ? ORDER BY step_number',
  [$id]
);
$steps = mysqli_fetch_all($steps_result, MYSQLI_ASSOC);

// Fetch the tip for this recipe (there's at most one per recipe)
$tip_result = mysqli_execute_query(
  $conn,
  'SELECT tip_title, tip_text FROM tips WHERE recipe_id = ?',
  [$id]
);
$tip = mysqli_fetch_assoc($tip_result);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= htmlspecialchars($recipe['title']) ?> &mdash; <?= htmlspecialchars($site_title) ?></title>
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

  <a href="index.php" class="back-link">&larr; Back to all recipes</a>

  <div class="recipe-detail">

    <h2><?= htmlspecialchars($recipe['title']) ?></h2>

    <?php if (!empty($recipe['subtitle'])) : ?>
      <p class="subtitle"><?= htmlspecialchars($recipe['subtitle']) ?></p>
    <?php endif; ?>

    <!-- Meta row: category and servings -->
    <div class="meta-row">
      <?php if (!empty($recipe['category'])) : ?>
        <span><strong>Category:</strong> <?= htmlspecialchars($recipe['category']) ?></span>
      <?php endif; ?>
      <?php if (!empty($recipe['servings'])) : ?>
        <span><strong>Serves:</strong> <?= htmlspecialchars((string) $recipe['servings']) ?></span>
      <?php endif; ?>
    </div>

    <?php if (!empty($recipe['main_image'])) : ?>
      <img class="dish-image" src="<?= htmlspecialchars($recipe['main_image']) ?>" alt="<?= htmlspecialchars($recipe['title']) ?>">
    <?php endif; ?>

    <?php if (!empty($recipe['description'])) : ?>
      <p><?= htmlspecialchars($recipe['description']) ?></p>
    <?php endif; ?>

    <!-- Tip box — shown if this recipe has a tip -->
    <?php if ($tip) : ?>
      <div class="tip-box">
        <h4><?= htmlspecialchars($tip['tip_title'] ?? 'Tip') ?></h4>
        <p><?= htmlspecialchars($tip['tip_text'] ?? '') ?></p>
      </div>
    <?php endif; ?>

    <!-- Ingredients list -->
    <?php if (!empty($ingredients)) : ?>
      <h3>Ingredients</h3>
      <ul class="ingredients-list">
        <?php foreach ($ingredients as $ing) : ?>
          <li><?= htmlspecialchars($ing['full_text']) ?></li>
        <?php endforeach; ?>
      </ul>
    <?php endif; ?>

    <!-- all the cooking steps -->
    <?php if (!empty($steps)) : ?>
      <h3>Instructions</h3>
      <ol class="steps-list">
        <?php foreach ($steps as $step) : ?>
          <li>
            <div class="step-number"><?= htmlspecialchars((string) $step['step_number']) ?></div>
            <div class="step-content">
              <?php if (!empty($step['step_title'])) : ?>
                <h4><?= htmlspecialchars($step['step_title']) ?></h4>
              <?php endif; ?>
              <p><?= htmlspecialchars($step['instructions'] ?? '') ?></p>
            </div>
          </li>
        <?php endforeach; ?>
      </ol>
    <?php endif; ?>

  </div>
</div>

<footer>
  <p>My Cookbook &mdash; UXID241 &mdash; Drexel University</p>
</footer>

</body>
</html>