<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$host = 'localhost';
$dbname = 'aged_care';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Database connection failed']);
    exit();
}

$email = $_GET['email'] ?? '';
$role = $_GET['role'] ?? '';

if (!$email || !$role) {
    echo json_encode(['status' => 'error', 'message' => 'Missing email or role']);
    exit();
}

$table = $role === 'resident' ? 'resident_table' : ($role === 'admin' ? 'staff_table' : null);

if (!$table) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid role']);
    exit();
}

try {
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE email = :email LIMIT 1");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        echo json_encode(['status' => 'success', 'data' => $user]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'User not found']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Query failed']);
}
