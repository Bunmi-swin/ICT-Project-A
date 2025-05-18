<?php
$conn = new mysqli("localhost", "root", "", "aged_care");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$product_id = $_POST['product_id'];
$quantity_add = isset($_POST['quantity_add']) ? (int)$_POST['quantity_add'] : 0;
$quantity_deduct = isset($_POST['quantity_deduct']) ? (int)$_POST['quantity_deduct'] : 0;

$net_change = $quantity_add - $quantity_deduct;

?>

<!DOCTYPE html>
<html>
<head>
    <title>Stock Update Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        .card {
            background-color: white;
            border: 1px solid #d0d7de;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            border-radius: 8px;
            padding: 30px;
            max-width: 500px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        .message {
            font-size: 18px;
            margin: 20px 0;
            color: #555;
        }
        .button {
            margin-top: 20px;
        }
        .button a {
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background-color 0.2s ease-in-out;
        }
        .button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Stock Update Result</h2>

    <div class="message">
        <?php
        if ($net_change != 0) {
            $sql = "UPDATE products SET stock_quantity = stock_quantity + ? WHERE product_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $net_change, $product_id);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                echo "✅ <strong>Stock updated successfully!</strong>";
            } else {
                echo "⚠️ <strong>Stock update failed. Please check the Product ID.</strong>";
            }
        } else {
            echo "ℹ️ <strong>No stock change requested.</strong>";
        }
        ?>
    </div>

    <div class="button">
        <a href="stockupdate.php">← Back to Stock Page</a>
    </div>
</div>

</body>
</html>

<?php
$conn->close();
?>
