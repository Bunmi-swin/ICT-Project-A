<?php
ini_set('log_errors', 1);
ini_set('error_log', 'C:/Users/Torka/Documents/PHP/apache/logs/php_error.log'); // Adjust the path if needed
ini_set('display_errors', 0);

require 'cors.php';
require 'db.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
error_log("Raw JSON payload: " . file_get_contents('php://input'));
error_log("Decoded data: " . print_r($data, true));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Validate the incoming data
        if (!isset($data['email']) || !isset($data['password'])) {
            error_log("Missing email or password");
            echo json_encode(['status' => 'error', 'message' => 'Email and password are required']);
            exit();
        }

    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    error_log("Email: " . $email);
    error_log("Plain-text password: " . $password);

    // Prepare and execute the query with column aliases
    $stmt = $pdo->prepare('SELECT ID, LOWER(email) AS email, Username AS username, Role AS role, Password AS password FROM users WHERE LOWER(email) = LOWER(:email)');
    $stmt->execute(['email' => $email]);
    
    // Log the number of rows returned
    error_log("Number of rows returned: " . $stmt->rowCount());

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    
    if ($user) {
        error_log("User found: " . print_r($user, true));
        // Log the hashed password from the database
        error_log("Hashed password from DB: " . $user['password']);
     if (password_verify($password, $user['password'])) {
        error_log("Password verification successful");
        echo json_encode([
            'status' => 'success',
            'message' => 'Login successful',
            'role' => $user['role'],
            'username' => $user['username']
            ]);
    } else {
        error_log("Password verification failed");
        echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
    }
} else {
    error_log("No user found with email: $email");
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
} 
} else {
    error_log("Invalid request method");
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>