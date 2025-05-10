<?php
require_once 'cors.php'; // Include the CORS logic at the top

// Enable error reporting (for debugging only - remove in production)
ini_set('display_errors', 1);
error_reporting(E_ALL);

// DB Connection
$host = 'localhost';
$db = 'aged_care';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => 'DB connection failed: ' . $e->getMessage()]);
    exit;
}

// Get POST data
$full_name = $_POST['full_name'] ?? '';
$appointment_date = $_POST['appointment_date'] ?? '';
$time_slot = $_POST['time_slot'] ?? '';
$service_id = $_POST['service_id'] ?? '';
$notes = $_POST['notes'] ?? '';
$resident_id = 1; // Placeholder

if (!$full_name || !$appointment_date || !$time_slot || !$service_id) {
    echo json_encode(['success' => false, 'error' => 'Missing required fields.']);
    exit;
}

try {
    $stmt = $pdo->prepare("INSERT INTO `appointments table` 
        (resident_id, service_id, appointment_date, time_slot, status, assigned_staff_id) 
        VALUES (?, ?, ?, ?, 'Pending', NULL)");
    $stmt->execute([$resident_id, $service_id, $appointment_date, $time_slot]);

    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
