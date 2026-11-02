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

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

if ($id <= 0) {
    header('Location: index.php');
    exit;
}

// Verify the recipe actually exists before deleting
$result = mysqli_execute_query(
    $conn,
    'SELECT id, title FROM recipes WHERE id = ?',
    [$id]
);
$recipe = mysqli_fetch_assoc($result);

if (!$recipe) {
    header('Location: index.php');
    exit;
}

// Delete related rows first (ingredients, steps) then the recipe itself
// Foreign keys handle this automatically if your schema uses ON DELETE CASCADE,
// but we do it manually here to be safe
mysqli_execute_query($conn, 'DELETE FROM ingredients WHERE recipe_id = ?', [$id]);
mysqli_execute_query($conn, 'DELETE FROM steps WHERE recipe_id = ?', [$id]);
mysqli_execute_query($conn, 'DELETE FROM tips WHERE recipe_id = ?', [$id]);
mysqli_execute_query($conn, 'DELETE FROM recipe_tools WHERE recipe_id = ?', [$id]);
mysqli_execute_query($conn, 'DELETE FROM recipes WHERE id = ?', [$id]);

header('Location: index.php');
exit;