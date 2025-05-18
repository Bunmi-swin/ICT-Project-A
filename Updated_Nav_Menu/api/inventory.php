<?php
header("Content-Type: application/json");

// Replace these with your actual database credentials
$host = "localhost";
$dbname = "aged_care";
$username = "root";
$password = "";

try {
    // Create PDO connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query from 'products' table
    $stmt = $pdo->query("SELECT product_name, description, stock_quantity FROM products");

    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Add default category for each item (you can update this dynamically later)
    foreach ($results as &$item) {
        $item['category'] = 'Medical Supplies';
    }

    echo json_encode($results);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
?>
