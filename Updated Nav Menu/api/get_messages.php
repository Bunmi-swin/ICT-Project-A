<?php
require_once 'cors.php'; // Ensure CORS headers

$host = 'localhost';
$db = 'aged_care';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get all messages ordered by timestamp
    $stmt = $pdo->query("SELECT sender_id, recipient_id, message_content, timestamp FROM `messages table` ORDER BY timestamp ASC");

    $messages = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $messages[] = [
            'sender' => $row['sender_id'], 
            'recipient' => $row['recipient_id'],
            'message' => $row['message_content'],
            'timestamp' => $row['timestamp']
        ];
    }

    echo json_encode($messages);

} catch (PDOException $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
