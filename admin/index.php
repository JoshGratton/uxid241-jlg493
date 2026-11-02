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

// Fetch all recipes for the admin list
$result = mysqli_query($conn, 'SELECT id, title FROM recipes ORDER BY title');
$recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel – My Cookbook</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<header>
    <div class="container">
        <h1>Admin Panel</h1>
        <nav>
            <a href="../index.php">← View Site</a>
            <a href="../logout.php">Log out</a>
        </nav>
    </div>
</header>

<div class="container">
    <h2>Recipes</h2>
    <a href="add-recipe.php" class="btn">+ Add New Recipe</a>

    <table class="admin-table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($recipes as $recipe): ?>
            <tr>
                <td><?= htmlspecialchars($recipe['title']) ?></td>
                <td>
                    <a href="../recipe.php?id=<?= $recipe['id'] ?>">View</a>
                    <a href="delete-recipe.php?id=<?= $recipe['id'] ?>"
                       onclick="return confirm('Delete this recipe?')">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>