<?php
declare(strict_types=1);

session_set_cookie_params([
    'httponly' => true,
    'samesite' => 'Lax',
]);
session_start();

// 1. Clear all session data
$_SESSION = [];

// 2. Destroy the server-side session
session_destroy();

header('Location: index.php');
exit;