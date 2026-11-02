<?php
// Include this at the top of every admin page.
// If the user isn't logged in, they get sent to login.php.
declare(strict_types=1);

session_set_cookie_params([
    'httponly' => true,
    'samesite' => 'Lax',
]);
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: ../login.php');
    exit; // exit is mandatory — header() alone doesn't stop execution
}