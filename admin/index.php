<?php
declare(strict_types=1);
require_once '../require_login.php';
require_once '../config.php';

$recipes = mysqli_fetch_all(
    mysqli_execute_query($conn, 'SELECT id, title, category, created_at FROM recipes ORDER BY created_at DESC'),
    MYSQLI_ASSOC
);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin — Recipes</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<header>
    <div class="container">
        <h1><a href="../index.php">The Cookbook</a></h1>
        <nav>
            <a href="../index.php">View site</a>
            <a href="../logout.php">Log out</a>
        </nav>
    </div>
</header>

<div class="container" style="padding-top:2.5rem; padding-bottom:5rem;">

    <div class="admin-header">
        <h2>Recipes</h2>
        <a href="add-recipe.php" class="btn">+ Add recipe</a>
    </div>

    <?php if (empty($recipes)): ?>
        <p style="color:var(--text-muted);">No recipes yet. <a href="add-recipe.php">Add the first one.</a></p>
    <?php else: ?>
    <table class="admin-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Category</th>
                <th>Added</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($recipes as $r): ?>
            <tr>
                <td><?= (int) $r['id'] ?></td>
                <td><?= htmlspecialchars($r['title']) ?></td>
                <td><?= htmlspecialchars($r['category'] ?? '—') ?></td>
                <td><?= htmlspecialchars(substr($r['created_at'] ?? '', 0, 10)) ?></td>
                <td>
                    <a href="../recipe.php?id=<?= (int) $r['id'] ?>">View</a>
                    <a href="edit-recipe.php?id=<?= (int) $r['id'] ?>">Edit</a>
                    <a href="delete-recipe.php?id=<?= (int) $r['id'] ?>"
                       class="delete-link"
                       onclick="return confirm('Delete this recipe? This cannot be undone.')">Delete</a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>

</div>

</body>
</html>