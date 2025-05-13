<?php
$conn = new mysqli("localhost", "root", "", "test"); // "test" is your DB name

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form input values
$product_id = $_POST['product_id'];
$quantity_add = isset($_POST['quantity_add']) ? (int)$_POST['quantity_add'] : 0;
$quantity_deduct = isset($_POST['quantity_deduct']) ? (int)$_POST['quantity_deduct'] : 0;

// Calculate the final stock change
$net_change = $quantity_add - $quantity_deduct;

if ($net_change != 0) {
    $sql = "UPDATE products SET stock_quantity = stock_quantity + ? WHERE product_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $net_change, $product_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Stock updated successfully!<br><br>";
        echo '<a href="../stockupdate.html"><button>← Back to Stock Page</button></a>';
    } else {
        echo "Stock update failed.<br><br>";
        echo '<a href="../stockupdate.html"><button>← Try Again</button></a>';
    }
} else {
    echo "No stock change requested.<br><br>";
    echo '<a href="../stockupdate.html"><button>← Back to Stock Page</button></a>';
}

$conn->close();
?>

