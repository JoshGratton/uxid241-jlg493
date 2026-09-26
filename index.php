<?php
declare(strict_types=1);

$site_title = 'My Cookbook';
$php_version = phpversion();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($site_title) ?></title>
</head>
<body>
  <h1><?= htmlspecialchars($site_title) ?></h1>
  <p>Running PHP <?= htmlspecialchars($php_version) ?></p>
</body>
</html>