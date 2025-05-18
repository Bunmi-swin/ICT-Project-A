<?php

require 'cors.php';

$host = 'localhost';
$dbname = 'aged_care';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Placeholder sender and recipient IDs (adjust if needed)
    $sender_id = 1;
    $recipient_id = 1;

    try {
        $stmt = $pdo->prepare("INSERT INTO `contact us table` (sender_id, recipient_id, email, name, message_content) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$sender_id, $recipient_id, $email, $name, $message]);

        header("Location: ../Thankyou.html");
        exit();
    } catch (PDOException $e) {
        die("Error saving message: " . $e->getMessage());
    }
}
?>
