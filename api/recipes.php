<?php
declare(strict_types=1);

// Set content type before any output
header('Content-Type: application/json');

// Bootstrap session and DB
session_set_cookie_params(['httponly' => true, 'samesite' => 'Lax']);
session_start();
require_once '../config.php';

$method = $_SERVER['REQUEST_METHOD'];

// GET /api/recipes  list all recipes (public)
if ($method === 'GET') {
    $rows = mysqli_fetch_all(
        mysqli_execute_query(
            $conn,
            'SELECT id, title, category, servings, prep_time, cook_time, main_image, description
             FROM recipes ORDER BY created_at DESC'
        ),
        MYSQLI_ASSOC
    );

    // Cast numeric strings to real numbers so JSON is correct
    foreach ($rows as &$r) {
        $r['id']        = (int) $r['id'];
        $r['servings']  = $r['servings']  !== null ? (int) $r['servings']  : null;
        $r['prep_time'] = $r['prep_time'] !== null ? (int) $r['prep_time'] : null;
        $r['cook_time'] = $r['cook_time'] !== null ? (int) $r['cook_time'] : null;
    }
    unset($r);

    http_response_code(200);
    echo json_encode($rows);
    exit;
}

// POST /api/recipes  create a new recipe (auth required)
if ($method === 'POST') {
    // Auth gate: writes require a logged-in session
    if (!isset($_SESSION['user_id'])) {
        http_response_code(401);
        echo json_encode(['error' => 'Login required']);
        exit;
    }

    // Read and decode JSON body
    $raw  = file_get_contents('php://input');
    $data = json_decode($raw, true);

    if ($data === null) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid JSON']);
        exit;
    }

    // Pull fields with null fallback
    $title       = $data['title']       ?? null;
    $description = $data['description'] ?? null;
    $category    = $data['category']    ?? null;
    $servings    = $data['servings']    ?? null;

    // Validate required fields
    $errors = [];
    if (!is_string($title) || trim($title) === '') {
        $errors[] = 'title is required and must be a non-empty string';
    }
    if ($servings !== null && (!is_int($servings) || $servings < 1)) {
        $errors[] = 'servings must be a positive integer';
    }

    if (!empty($errors)) {
        http_response_code(422);
        echo json_encode(['errors' => $errors]);
        exit;
    }

    // Insert the new recipe
    mysqli_execute_query(
        $conn,
        'INSERT INTO recipes (title, description, category, servings) VALUES (?, ?, ?, ?)',
        [trim($title), $description, $category, $servings]
    );

    $new_id = mysqli_insert_id($conn);

    // Return the new recipe
    $new_recipe = mysqli_fetch_assoc(
        mysqli_execute_query($conn, 'SELECT * FROM recipes WHERE id = ?', [$new_id])
    );
    $new_recipe['id']       = (int) $new_recipe['id'];
    $new_recipe['servings'] = $new_recipe['servings'] !== null ? (int) $new_recipe['servings'] : null;

    http_response_code(201);
    echo json_encode($new_recipe);
    exit;
}

// Unsupported method 
http_response_code(405);
echo json_encode(['error' => 'Method not allowed']);