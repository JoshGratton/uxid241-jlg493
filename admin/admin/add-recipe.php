<?php
declare(strict_types=1);
require __DIR__ . '/../require_login.php';
require __DIR__ . '/../config.php';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
    mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
    exit('Connection failed: ' . $e->getMessage());
}

// Generate a CSRF token once per session to protect this form
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$errors = [];
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verify the CSRF token before doing anything
    $sent  = $_POST['csrf_token'] ?? '';
    $known = $_SESSION['csrf_token'] ?? '';
    if (!hash_equals($known, $sent)) {
        http_response_code(403);
        exit('Invalid CSRF token.');
    }

    $title       = trim($_POST['title'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $servings    = (int) ($_POST['servings'] ?? 0);
    $ingredients = trim($_POST['ingredients'] ?? '');
    $steps       = trim($_POST['steps'] ?? '');

    if ($title === '')       $errors[] = 'Title is required.';
    if ($servings <= 0)      $errors[] = 'Servings must be a positive number.';
    if ($ingredients === '') $errors[] = 'At least one ingredient is required.';
    if ($steps === '')       $errors[] = 'At least one step is required.';

    if (empty($errors)) {
        // Build a URL-friendly slug from the title
        $slug = strtolower(trim(preg_replace('/[^a-z0-9]+/i', '-', $title), '-'));

        // Insert the recipe row
        $result = mysqli_execute_query(
            $conn,
            'INSERT INTO recipes (title, slug, description, servings) VALUES (?, ?, ?, ?)',
            [$title, $slug, $description, $servings]
        );
        $recipe_id = mysqli_insert_id($conn);

        // Insert each ingredient (one per line)
        $ingredient_lines = array_filter(array_map('trim', explode("\n", $ingredients)));
        foreach ($ingredient_lines as $i => $line) {
            mysqli_execute_query(
                $conn,
                'INSERT INTO ingredients (recipe_id, full_text, sort_order) VALUES (?, ?, ?)',
                [$recipe_id, $line, $i + 1]
            );
        }

        // Insert each step (one per line)
        $step_lines = array_filter(array_map('trim', explode("\n", $steps)));
        foreach ($step_lines as $i => $line) {
            mysqli_execute_query(
                $conn,
                'INSERT INTO steps (recipe_id, step_number, instructions) VALUES (?, ?, ?)',
                [$recipe_id, $i + 1, $line]
            );
        }

        $success = 'Recipe "' . htmlspecialchars($title) . '" added successfully!';
    }
}

// Fetch categories for the dropdown
$cat_result = mysqli_query($conn, 'SELECT id, name FROM categories ORDER BY name');
$categories = mysqli_fetch_all($cat_result, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Recipe – Admin</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<header>
    <div class="container">
        <h1>Add Recipe</h1>
        <nav>
            <a href="index.php">← Admin Panel</a>
            <a href="../logout.php">Log out</a>
        </nav>
    </div>
</header>

<div class="container">
    <?php if ($success !== ''): ?>
        <p class="success"><?= $success ?></p>
    <?php endif; ?>

    <?php if (!empty($errors)): ?>
        <ul class="errors">
            <?php foreach ($errors as $e): ?>
                <li><?= htmlspecialchars($e) ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <form method="POST" action="add-recipe.php" class="admin-form">
        <!-- CSRF token hidden field -->
        <input type="hidden" name="csrf_token"
               value="<?= htmlspecialchars($_SESSION['csrf_token']) ?>">

        <label for="title">Recipe Title *</label>
        <input type="text" id="title" name="title" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3"></textarea>

        <label for="servings">Servings *</label>
        <input type="number" id="servings" name="servings" min="1" required>

        <label for="ingredients">Ingredients * <small>(one per line)</small></label>
        <textarea id="ingredients" name="ingredients" rows="8" required></textarea>

        <label for="steps">Steps * <small>(one per line)</small></label>
        <textarea id="steps" name="steps" rows="10" required></textarea>

        <button type="submit">Add Recipe</button>
    </form>
</div>
</body>
</html>