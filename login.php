<?php
declare(strict_types=1);
require 'config.php';

// Harden the session cookie BEFORE session_start()
session_set_cookie_params([
    'httponly' => true,   // JS can't read the cookie
    'samesite' => 'Lax',  // Limits cross-site sending
]);
session_start();

// If already logged in, go straight to admin
if (isset($_SESSION['user_id'])) {
    header('Location: admin/index.php');
    exit;
}

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
    mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
    exit('Connection failed: ' . $e->getMessage());
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $plain = $_POST['password'] ?? '';

    // Look up by email only — password is NEVER in the SQL WHERE clause
    $result = mysqli_execute_query(
        $conn,
        'SELECT id, password_hash FROM users WHERE email = ?',
        [$email]
    );
    $user = mysqli_fetch_assoc($result);

    
    if ($user !== null && password_verify($plain, $user['password_hash'])) { //It takes the password the user typed and the hash from the database and checks if they match
        // Swap to a fresh session id to prevent session fixation
        session_regenerate_id(true); //This gives the user a brand new session ID the moment they successfully log in

        // Store ONLY the user id — look everything else up when needed
        $_SESSION['user_id'] = $user['id'];

        header('Location: admin/index.php');
        exit;
    }

    // One vague message for both wrong email and wrong password
    // (so attackers can't tell which emails are registered)
    $error = 'Invalid email or password.';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login – My Cookbook</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <div class="container">
        <h1>My Cookbook</h1>
        <nav><a href="index.php">← Back to site</a></nav>
    </div>
</header>

<div class="container">
    <h2>Admin Login</h2>

    <?php if ($error !== ''): ?>
        <p class="error"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>

    <form method="POST" action="login.php" class="login-form">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Log in</button>
    </form>
</div>
</body>
</html>