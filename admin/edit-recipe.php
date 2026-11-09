<?php
declare(strict_types=1);
require_once '../require_login.php';
require_once '../config.php';

$errors = [];
$success = '';

// --- Get recipe id from query string ---
$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
if ($id <= 0) {
    header('Location: index.php');
    exit;
}

// --- Load existing recipe ---
$recipe = mysqli_fetch_assoc(
    mysqli_execute_query($conn, 'SELECT * FROM recipes WHERE id = ?', [$id])
);
if ($recipe === null) {
    header('Location: index.php');
    exit;
}

// --- Load existing ingredients and steps for this recipe ---
$ingredients = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT * FROM ingredients WHERE recipe_id = ? ORDER BY id', [$id]),
    MYSQLI_ASSOC
);
$steps = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT * FROM steps WHERE recipe_id = ? ORDER BY step_number', [$id]),
    MYSQLI_ASSOC
);

// --- Handle POST (form submission) ---
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verify CSRF token
    if (!isset($_POST['csrf_token']) ||
        !hash_equals($_SESSION['csrf_token'] ?? '', $_POST['csrf_token'])) {
        $errors[] = 'Invalid form submission. Please try again.';
    } else {
        // Collect and validate recipe fields
        $title       = trim($_POST['title'] ?? '');
        $description = trim($_POST['description'] ?? '');
        $category    = trim($_POST['category'] ?? '');
        $servings    = (int) ($_POST['servings'] ?? 0);
        $prep_time   = (int) ($_POST['prep_time'] ?? 0);
        $cook_time   = (int) ($_POST['cook_time'] ?? 0);
        $main_image  = trim($_POST['main_image'] ?? '');

        if ($title === '') {
            $errors[] = 'Title is required.';
        }
        if ($servings < 1) {
            $errors[] = 'Servings must be at least 1.';
        }

        // Collect ingredients (posted as parallel arrays)
        $ing_quantities = $_POST['ing_quantity'] ?? [];
        $ing_units      = $_POST['ing_unit']     ?? [];
        $ing_names      = $_POST['ing_name']     ?? [];

        // Collect steps (posted as parallel arrays)
        $step_instructions = $_POST['step_instruction'] ?? [];
        $step_images       = $_POST['step_image']       ?? [];

        if (empty($errors)) {
            // Update recipe row
            mysqli_execute_query(
                $conn,
                'UPDATE recipes
                 SET title = ?, description = ?, category = ?,
                     servings = ?, prep_time = ?, cook_time = ?, main_image = ?
                 WHERE id = ?',
                [$title, $description, $category,
                 $servings, $prep_time, $cook_time, $main_image, $id]
            );

            // Replace ingredients: delete then re-insert
            mysqli_execute_query($conn, 'DELETE FROM ingredients WHERE recipe_id = ?', [$id]);
            foreach ($ing_names as $i => $name) {
                $name = trim($name);
                if ($name === '') {
                    continue;
                }
                $qty  = trim($ing_quantities[$i] ?? '');
                $unit = trim($ing_units[$i] ?? '');
                mysqli_execute_query(
                    $conn,
                    'INSERT INTO ingredients (recipe_id, quantity, unit, name) VALUES (?, ?, ?, ?)',
                    [$id, $qty, $unit, $name]
                );
            }

            // Replace steps: delete then re-insert
            mysqli_execute_query($conn, 'DELETE FROM steps WHERE recipe_id = ?', [$id]);
            $step_num = 1;
            foreach ($step_instructions as $i => $instruction) {
                $instruction = trim($instruction);
                if ($instruction === '') {
                    continue;
                }
                $img = trim($step_images[$i] ?? '');
                mysqli_execute_query(
                    $conn,
                    'INSERT INTO steps (recipe_id, step_number, instruction, image) VALUES (?, ?, ?, ?)',
                    [$id, $step_num, $instruction, $img !== '' ? $img : null]
                );
                $step_num++;
            }

            $success = 'Recipe updated successfully.';

            // Reload updated data to show in form
            $recipe = mysqli_fetch_assoc(
                mysqli_execute_query($conn, 'SELECT * FROM recipes WHERE id = ?', [$id])
            );
            $ingredients = mysqli_fetch_all(
                mysqli_execute_query($conn, 'SELECT * FROM ingredients WHERE recipe_id = ? ORDER BY id', [$id]),
                MYSQLI_ASSOC
            );
            $steps = mysqli_fetch_all(
                mysqli_execute_query($conn, 'SELECT * FROM steps WHERE recipe_id = ? ORDER BY step_number', [$id]),
                MYSQLI_ASSOC
            );
        }
    }
}

// Generate CSRF token for the form
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Recipe — Admin</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<header>
    <div class="container">
        <h1><a href="../index.php">The Cookbook</a></h1>
        <nav>
            <a href="index.php">Admin</a>
            <a href="../logout.php">Log out</a>
        </nav>
    </div>
</header>

<div class="container" style="padding-top:2.5rem; padding-bottom:5rem;">

    <div class="admin-header">
        <h2>Edit Recipe</h2>
        <a href="index.php" class="btn btn-ghost">← Back to recipes</a>
    </div>

    <?php if ($success !== ''): ?>
        <p class="success"><?= htmlspecialchars($success) ?></p>
    <?php endif; ?>

    <?php if (!empty($errors)): ?>
        <ul class="errors">
            <?php foreach ($errors as $e): ?>
                <li><?= htmlspecialchars($e) ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <form method="post" class="admin-form" style="max-width:720px;">
        <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token']) ?>">

        <label for="title">Title *</label>
        <input type="text" id="title" name="title"
               value="<?= htmlspecialchars($recipe['title']) ?>" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3"><?= htmlspecialchars($recipe['description'] ?? '') ?></textarea>

        <label for="category">Category</label>
        <input type="text" id="category" name="category"
               value="<?= htmlspecialchars($recipe['category'] ?? '') ?>">

        <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:1rem;">
            <div>
                <label for="servings">Servings *</label>
                <input type="number" id="servings" name="servings" min="1"
                       value="<?= (int) ($recipe['servings'] ?? 2) ?>" required>
            </div>
            <div>
                <label for="prep_time">Prep time (min)</label>
                <input type="number" id="prep_time" name="prep_time" min="0"
                       value="<?= (int) ($recipe['prep_time'] ?? 0) ?>">
            </div>
            <div>
                <label for="cook_time">Cook time (min)</label>
                <input type="number" id="cook_time" name="cook_time" min="0"
                       value="<?= (int) ($recipe['cook_time'] ?? 0) ?>">
            </div>
        </div>

        <label for="main_image">Main image path</label>
        <input type="text" id="main_image" name="main_image"
               value="<?= htmlspecialchars($recipe['main_image'] ?? '') ?>"
               placeholder="images/Recipe_.../filename.jpg">

        <!-- ── Ingredients ── -->
        <hr style="border-color:var(--border);margin:1.5rem 0 0.5rem;">
        <p class="recipe-section-title" style="margin:0 0 1rem;">Ingredients</p>

        <div id="ingredients-list">
            <?php foreach ($ingredients as $ing): ?>
            <div class="ingredient-row" style="display:grid;grid-template-columns:120px 100px 1fr 32px;gap:0.5rem;margin-bottom:0.5rem;align-items:center;">
                <input type="text" name="ing_quantity[]"
                       value="<?= htmlspecialchars($ing['quantity'] ?? '') ?>"
                       placeholder="Qty" style="margin:0;">
                <input type="text" name="ing_unit[]"
                       value="<?= htmlspecialchars($ing['unit'] ?? '') ?>"
                       placeholder="Unit" style="margin:0;">
                <input type="text" name="ing_name[]"
                       value="<?= htmlspecialchars($ing['name']) ?>"
                       placeholder="Ingredient name" style="margin:0;">
                <button type="button" onclick="this.closest('.ingredient-row').remove()"
                        style="background:none;border:none;color:var(--text-dim);font-size:1.2rem;cursor:pointer;padding:0;">×</button>
            </div>
            <?php endforeach; ?>
        </div>
        <button type="button" class="btn btn-ghost" style="margin-top:0.5rem;" onclick="addIngredient()">+ Add ingredient</button>

        <!-- ── Steps ── -->
        <hr style="border-color:var(--border);margin:1.5rem 0 0.5rem;">
        <p class="recipe-section-title" style="margin:0 0 1rem;">Steps</p>

        <div id="steps-list">
            <?php foreach ($steps as $i => $step): ?>
            <div class="step-row-edit" style="margin-bottom:1rem;border:1px solid var(--border);padding:1rem;">
                <p style="font-family:system-ui;font-size:0.68rem;color:var(--text-dim);margin-bottom:0.5rem;text-transform:uppercase;letter-spacing:0.1em;">Step <?= $i + 1 ?></p>
                <textarea name="step_instruction[]" rows="3"
                          style="width:100%;margin-bottom:0.5rem;"><?= htmlspecialchars($step['instruction']) ?></textarea>
                <input type="text" name="step_image[]"
                       value="<?= htmlspecialchars($step['image'] ?? '') ?>"
                       placeholder="Step image path (optional)" style="width:100%;margin:0;">
                <button type="button" onclick="this.closest('.step-row-edit').remove()"
                        style="background:none;border:none;color:var(--text-dim);font-size:0.72rem;cursor:pointer;margin-top:0.5rem;font-family:system-ui;letter-spacing:0.08em;text-transform:uppercase;">Remove step</button>
            </div>
            <?php endforeach; ?>
        </div>
        <button type="button" class="btn btn-ghost" style="margin-top:0.5rem;" onclick="addStep()">+ Add step</button>

        <div style="margin-top:2rem;display:flex;gap:1rem;align-items:center;">
            <button type="submit" class="btn">Save changes</button>
            <a href="../recipe.php?id=<?= $id ?>" class="btn btn-ghost" target="_blank">View recipe ↗</a>
        </div>
    </form>
</div>

<script>
function addIngredient() {
    const row = document.createElement('div');
    row.className = 'ingredient-row';
    row.style.cssText = 'display:grid;grid-template-columns:120px 100px 1fr 32px;gap:0.5rem;margin-bottom:0.5rem;align-items:center;';
    row.innerHTML = `
        <input type="text" name="ing_quantity[]" placeholder="Qty" style="margin:0;">
        <input type="text" name="ing_unit[]" placeholder="Unit" style="margin:0;">
        <input type="text" name="ing_name[]" placeholder="Ingredient name" style="margin:0;">
        <button type="button" onclick="this.closest('.ingredient-row').remove()"
                style="background:none;border:none;color:var(--text-dim);font-size:1.2rem;cursor:pointer;padding:0;">×</button>
    `;
    document.getElementById('ingredients-list').appendChild(row);
}

function addStep() {
    const count = document.querySelectorAll('.step-row-edit').length + 1;
    const row = document.createElement('div');
    row.className = 'step-row-edit';
    row.style.cssText = 'margin-bottom:1rem;border:1px solid var(--border);padding:1rem;';
    row.innerHTML = `
        <p style="font-family:system-ui;font-size:0.68rem;color:var(--text-dim);margin-bottom:0.5rem;text-transform:uppercase;letter-spacing:0.1em;">Step ${count}</p>
        <textarea name="step_instruction[]" rows="3" style="width:100%;margin-bottom:0.5rem;"></textarea>
        <input type="text" name="step_image[]" placeholder="Step image path (optional)" style="width:100%;margin:0;">
        <button type="button" onclick="this.closest('.step-row-edit').remove()"
                style="background:none;border:none;color:var(--text-dim);font-size:0.72rem;cursor:pointer;margin-top:0.5rem;font-family:system-ui;letter-spacing:0.08em;text-transform:uppercase;">Remove step</button>
    `;
    document.getElementById('steps-list').appendChild(row);
}
</script>

</body>
</html>