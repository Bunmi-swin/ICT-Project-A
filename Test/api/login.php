<?php
ini_set('log_errors', 1);
ini_set('error_log', 'C:/Users/Torka/Documents/PHP/apache/logs/php_error.log');
ini_set('display_errors', 0);

require 'cors.php';
require 'db.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
error_log("Raw JSON payload: " . file_get_contents('php://input'));
error_log("Decoded data: " . print_r($data, true));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($data['email']) || !isset($data['password'])) {
        error_log("Missing email or password");
        echo json_encode(['status' => 'error', 'message' => 'Email and password are required']);
        exit();
    }

    $email = $data['email'];
    $password = $data['password'];

    // Fetch user including failed_attempts and lockout_time
    $stmt = $pdo->prepare('SELECT ID, LOWER(email) AS email, Username AS username, Role AS role, Password AS password, failed_attempts, lockout_time FROM users WHERE LOWER(email) = LOWER(:email)');
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $now = new DateTime();
        $lockedUntil = $user['lockout_time'] ? new DateTime($user['lockout_time']) : null;

        // Check if account is locked
        if ($lockedUntil && $now < $lockedUntil) {
            error_log("Account is locked until: " . $lockedUntil->format('Y-m-d H:i:s'));
            echo json_encode([
                'status' => 'locked',
                'message' => 'Account locked due to multiple failed attempts. Try again later.'
            ]);
            exit();
        }

        // Verify password
        if (password_verify($password, $user['password'])) {
            // Reset failed_attempts and lockout_time
            $reset = $pdo->prepare('UPDATE users SET failed_attempts = 0, lockout_time = NULL WHERE ID = :id');
            $reset->execute(['id' => $user['ID']]);

            error_log("Password verification successful");
            echo json_encode([
                'status' => 'success',
                'message' => 'Login successful',
                'role' => $user['role'],
                'username' => $user['username']
            ]);
        } else {
            $attempts = $user['failed_attempts'] + 1;
            $update = null;

            if ($attempts >= 3) {
                $lockTime = (new DateTime())->modify('+5 minutes')->format('Y-m-d H:i:s');
                $update = $pdo->prepare('UPDATE users SET failed_attempts = :attempts, lockout_time = :lock WHERE ID = :id');
                $update->execute(['attempts' => $attempts, 'lock' => $lockTime, 'id' => $user['ID']]);
                error_log("Account locked due to too many failed attempts");
                echo json_encode([
                    'status' => 'locked',
                    'message' => 'Account locked after 3 failed attempts. Try again in 5 minutes.'
                ]);
            } else {
                $update = $pdo->prepare('UPDATE users SET failed_attempts = :attempts WHERE ID = :id');
                $update->execute(['attempts' => $attempts, 'id' => $user['ID']]);
                error_log("Password incorrect. Attempt $attempts/3");
                echo json_encode([
                    'status' => 'error',
                    'message' => "Invalid credentials. Attempt $attempts of 3."
                ]);
            }
        }
    } else {
        error_log("No user found with email: $email");
        echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
    }
} else {
    error_log("Invalid request method");
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
