<?php
declare(strict_types=1);
session_set_cookie_params(['httponly' => true, 'samesite' => 'Lax']);
session_start();
require_once 'config.php';

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
if ($id <= 0) {
    header('Location: index.php');
    exit;
}

// Load recipe
$recipe = mysqli_fetch_assoc(
    mysqli_execute_query($conn, 'SELECT * FROM recipes WHERE id = ?', [$id])
);
if ($recipe === null) {
    header('Location: index.php');
    exit;
}

// Load ingredients
$ingredients = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT * FROM ingredients WHERE recipe_id = ? ORDER BY id', [$id]),
    MYSQLI_ASSOC
);

// Load steps (including image column)
$steps = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT * FROM steps WHERE recipe_id = ? ORDER BY step_number', [$id]),
    MYSQLI_ASSOC
);

// Load tips
$tips = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT tip FROM tips WHERE recipe_id = ? ORDER BY id', [$id]),
    MYSQLI_ASSOC
);

// Site title
$row = mysqli_fetch_assoc(mysqli_execute_query($conn, "SELECT value FROM settings WHERE key_name = 'site_title'"));
$site_title = $row['value'] ?? 'The Cookbook';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($recipe['title']) ?> — <?= htmlspecialchars($site_title) ?></title>
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

<div class="recipe-detail">

    <a href="index.php" class="back-link">← All recipes</a>

    <div class="recipe-detail-header">
        <?php if (!empty($recipe['category'])): ?>
            <p class="recipe-detail-category"><?= htmlspecialchars($recipe['category']) ?></p>
        <?php endif; ?>

        <h1><?= htmlspecialchars($recipe['title']) ?></h1>

        <?php if (!empty($recipe['subtitle'])): ?>
            <p class="recipe-detail-subtitle"><?= htmlspecialchars($recipe['subtitle']) ?></p>
        <?php endif; ?>

        <p class="recipe-detail-meta">
            <?php if (!empty($recipe['servings'])): ?>
                Serves <?= (int) $recipe['servings'] ?>
            <?php endif; ?>
            <?php if (!empty($recipe['prep_time'])): ?>
                &nbsp;·&nbsp; <?= (int) $recipe['prep_time'] ?> min prep
            <?php endif; ?>
            <?php if (!empty($recipe['cook_time'])): ?>
                &nbsp;·&nbsp; <?= (int) $recipe['cook_time'] ?> min cook
            <?php endif; ?>
        </p>
    </div>

    <?php if (!empty($recipe['main_image'])): ?>
        <img src="<?= htmlspecialchars($recipe['main_image']) ?>"
             alt="<?= htmlspecialchars($recipe['title']) ?>"
             class="recipe-detail-image">
    <?php endif; ?>

    <?php if (!empty($recipe['description'])): ?>
        <p class="recipe-detail-description"><?= htmlspecialchars($recipe['description']) ?></p>
    <?php endif; ?>

    <?php if (!empty($tips)): ?>
        <?php foreach ($tips as $tip): ?>
        <div class="tip-box">
            <strong>Chef's tip</strong>
            <?= htmlspecialchars($tip['tip']) ?>
        </div>
        <?php endforeach; ?>
    <?php endif; ?>

    <hr class="recipe-divider">

    <div class="recipe-body">

        <!-- Ingredients column -->
        <div class="ingredients-col">
            <p class="recipe-section-title">Ingredients</p>
            <?php if (!empty($ingredients)): ?>
            <ul class="ingredients-list">
                <?php foreach ($ingredients as $ing): ?>
                <li>
                    <?php if (!empty($ing['quantity'])): ?>
                        <strong><?= htmlspecialchars($ing['quantity']) ?></strong>
                        <?= htmlspecialchars($ing['unit'] ?? '') ?>
                        &nbsp;
                    <?php endif; ?>
                    <?= htmlspecialchars($ing['name']) ?>
                </li>
                <?php endforeach; ?>
            </ul>
            <?php else: ?>
                <p style="color:var(--text-dim);font-size:0.9rem;">No ingredients listed.</p>
            <?php endif; ?>
        </div>

        <!-- Steps column -->
        <div class="steps-col">
            <p class="recipe-section-title">Instructions</p>
            <?php if (!empty($steps)): ?>
            <ol class="steps-list">
                <?php foreach ($steps as $step): ?>
                <li>
                    <div class="step-row">
                        <span class="step-number"><?= (int) $step['step_number'] ?></span>
                        <p><?= htmlspecialchars($step['instruction']) ?></p>
                    </div>
                    <?php if (!empty($step['image'])): ?>
                        <img src="<?= htmlspecialchars($step['image']) ?>"
                             alt="Step <?= (int) $step['step_number'] ?>"
                             class="step-image">
                    <?php endif; ?>
                </li>
                <?php endforeach; ?>
            </ol>
            <?php else: ?>
                <p style="color:var(--text-dim);font-size:0.9rem;">No steps listed.</p>
            <?php endif; ?>
        </div>

    </div><!-- /recipe-body -->

</div><!-- /recipe-detail -->

<footer>
    <a href="index.php"><?= htmlspecialchars($site_title) ?></a>
</footer>

</body>
</html>