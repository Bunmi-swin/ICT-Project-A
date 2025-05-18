<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = 'localhost';
$dbname = 'aged_care';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Database connection failed']);
    exit();
}

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
    exit();
}

if (!isset($data['email'], $data['password'], $data['role'])) {
    echo json_encode(['status' => 'error', 'message' => 'Email, password and role are required']);
    exit();
}

$email = $data['email'];
$password = $data['password'];
$role = strtolower($data['role']);

$roleTableMap = [
    'resident' => 'resident_table',
    'admin' => 'staff_table',
    'familymember' => 'family_member_table'
];

if (!array_key_exists($role, $roleTableMap)) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid role']);
    exit();
}

$table = $roleTableMap[$role];

try {
    $stmt = $pdo->prepare("SELECT * FROM `$table` WHERE LOWER(email) = LOWER(:email) LIMIT 1");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
        exit();
    }

    // Plain-text password check (replace with password_verify() if hashed)
    if ($password === $user['password']) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Login successful',
            'role' => $role,
            'email' => $user['email'] ?? $email, // fallback to input if missing
            'username' => $user['full_name'] ?? $user['username'] ?? ''
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'An error occurred']);
}
