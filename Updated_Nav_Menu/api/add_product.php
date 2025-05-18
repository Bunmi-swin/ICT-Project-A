<?php
header('Content-Type: application/json');

$host = 'localhost';
$db   = 'aged_care';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    echo json_encode(["success" => false, "error" => "Database connection failed."]);
    exit();
}

$product_name = $_POST['product_name'] ?? '';
$description = $_POST['description'] ?? '';
$stock_quantity = $_POST['stock_quantity'] ?? 0;

$stmt = $conn->prepare("INSERT INTO products (product_name, description, stock_quantity) VALUES (?, ?, ?)");
$stmt->bind_param("ssi", $product_name, $description, $stock_quantity);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "error" => $stmt->error]);
}

$stmt->close();
$conn->close();
