<?php
require_once 'cors.php';

$host = 'localhost';
$db = 'aged_care';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sender_id = $_POST['sender'] ?? '';
    $recipient_id = $_POST['recipient'] ?? ''; 
    $message = $_POST['message'] ?? '';

    if (!$sender_id || !$message) {
        echo json_encode(['success' => false, 'error' => 'Missing sender or message.']);
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO `messages table` (sender_id, recipient_id, message_content, timestamp) VALUES (?, ?, ?, NOW())");
    $stmt->execute([$sender_id, $recipient_id, $message]);

    echo json_encode(['success' => true]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
