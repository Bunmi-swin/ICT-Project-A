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

    // List of tables to check, with their column mappings
    $tables = [
        [
            'name' => 'users',
            'columns' => [
                'id' => 'ID',
                'email' => 'email',
                'username' => 'Username',
                'role' => 'Role',
                'password' => 'Password',
                'failed_attempts' => 'failed_attempts',
                'lockout_time' => 'lockout_time'
            ]
        ],
        [
            'name' => 'resident table',
            'columns' => [
                'id' => 'resident_id',
                'email' => 'email',
                'username' => 'full_name',
                'role' => "'resident'", // static value
                'password' => 'password'
            ]
        ],
        [
            'name' => 'staff table',
            'columns' => [
                'id' => 'staff_id',
                'email' => 'email',
                'username' => 'full_name',
                'role' => "'staff'",
                'password' => 'password'
            ]
        ],
        [
            'name' => 'family_member table',
            'columns' => [
                'id' => 'family_member_id',
                'email' => 'email',
                'username' => 'full_name',
                'role' => "'familymember'",
                'password' => 'password'
            ]
        ]
    ];

    $user = null;
    $sourceTable = null;
    $columns = null;

    foreach ($tables as $table) {
        $cols = $table['columns'];
        // Build SELECT statement
        $select = [];
        foreach ($cols as $alias => $col) {
            $select[] = (strpos($col, "'") === 0 ? "$col AS $alias" : "$col AS $alias");
        }
        $sql = "SELECT " . implode(", ", $select) . " FROM `{$table['name']}` WHERE LOWER(email) = LOWER(:email) LIMIT 1";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['email' => $email]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            $user = $result;
            $sourceTable = $table['name'];
            $columns = $cols;
            break;
        }
    }

    if ($user) {
        // Only users table has lockout/attempts logic
        if ($sourceTable === 'users') {
            $now = new DateTime();
            $lockedUntil = $user['lockout_time'] ? new DateTime($user['lockout_time']) : null;

            if ($lockedUntil && $now < $lockedUntil) {
                error_log("Account is locked until: " . $lockedUntil->format('Y-m-d H:i:s'));
                echo json_encode([
                    'status' => 'locked',
                    'message' => 'Account locked due to multiple failed attempts. Try again later.'
                ]);
                exit();
            }
        }

        // Verify password
        if (password_verify($password, $user['password'])) {
            // Reset failed_attempts and lockout_time for users table
            if ($sourceTable === 'users') {
                $reset = $pdo->prepare('UPDATE users SET failed_attempts = 0, lockout_time = NULL WHERE ID = :id');
                $reset->execute(['id' => $user['id']]);
            }

            error_log("Password verification successful for $sourceTable");
            echo json_encode([
                'status' => 'success',
                'message' => 'Login successful',
                'role' => $user['role'],
                'username' => $user['username']
            ]);
        } else {
            // Only users table tracks failed attempts/lockout
            if ($sourceTable === 'users') {
                $attempts = isset($user['failed_attempts']) ? $user['failed_attempts'] + 1 : 1;
                if ($attempts >= 3) {
                    $lockTime = (new DateTime())->modify('+5 minutes')->format('Y-m-d H:i:s');
                    $update = $pdo->prepare('UPDATE users SET failed_attempts = :attempts, lockout_time = :lock WHERE ID = :id');
                    $update->execute(['attempts' => $attempts, 'lock' => $lockTime, 'id' => $user['id']]);
                    error_log("Account locked due to too many failed attempts");
                    echo json_encode([
                        'status' => 'locked',
                        'message' => 'Account locked after 3 failed attempts. Try again in 5 minutes.'
                    ]);
                } else {
                    $update = $pdo->prepare('UPDATE users SET failed_attempts = :attempts WHERE ID = :id');
                    $update->execute(['attempts' => $attempts, 'id' => $user['id']]);
                    error_log("Password incorrect. Attempt $attempts/3");
                    echo json_encode([
                        'status' => 'error',
                        'message' => "Invalid credentials. Attempt $attempts of 3."
                    ]);
                }
            } else {
                // Other tables: just generic error
                error_log("Password incorrect for $sourceTable");
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Invalid credentials.'
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
