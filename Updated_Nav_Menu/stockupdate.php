<?php
$conn = new mysqli("localhost", "root", "", "aged_care");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch all products for reference table
$sql = "SELECT product_id, product_name FROM products ORDER BY product_id ASC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <link href="sitepath.css" rel="stylesheet" type="text/css">
    <title>Stock Update</title>
    <style>
        /* Sidebar Navigation */
.sidebar {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 100;
  top: 0;
  left: 0;
  background-color: #2c3e50;
  box-shadow: 2px 0 10px rgba(0,0,0,0.3);
  overflow-x: hidden;
  transition: 0.3s;
  padding-top: 70px;
}

.sidebar a {
  padding: 18px 28px;
  text-decoration: none;
  font-size: 18px;
  color: white;
  font-weight: 500;
  display: block;
  transition: all 0.2s ease-out;
  white-space: nowrap;
  border-left: 4px solid transparent;
  margin: 5px 0;
}

.sidebar a:hover {
  background-color: rgba(255, 255, 255, 0.1);
  border-left: 4px solid #3498db;
  padding-left: 35px; /* Makes it larger on hover */
  transform: scale(1.05);
}

.sidebar a.active {
  background-color: rgba(255, 255, 255, 0.15);
  border-left: 4px solid #3498db;
}

.sidebar .close-btn {
  position: absolute;
  top: 15px;
  right: 20px;
  font-size: 42px;
  cursor: pointer;
  color: white;
  transition: all 0.4s;
}

.sidebar .close-btn:hover {
  color: #e74c3c;
  transform: scale(1.3);
}

.sidebar .close-btn:hover::after {
  content: "Leave Menu";
  position: absolute;
  background-color: #e74c3c;
  color: white;
  padding: 5px 10px;
  border-radius: 2px;
  font-size: 14px;
  right: 35px;
  top: 11px;
  white-space: nowrap;
}

/* Menu Button */
.menu-btn {
  position: fixed;
  top: 80px;
  left: 20px;
  z-index: 99;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 35px;
  height: 26px;
  transition: all 0.3s;
  padding: 10px;
  border-radius: 5px;
  background-color: rgba(255, 255, 255, 0.9);
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.menu-btn:hover::after {
  content: "Navigation Menu";
  position: absolute;
  background-color: #2c3e50;
  color: white;
  padding: 5px 10px;
  border-radius: 4px;
  font-size: 14px;
  left: 60px;
  top: 10px;
  white-space: nowrap;
  opacity: 1;
}

.menu-btn span {
  display: block;
  height: 3px;
  width: 100%;
  background-color: #2c3e50;
  border-radius: 3px;
  transition: all 0.3s;
}

/* Menu button animation */
.menu-btn.open span:nth-child(1) {
  transform: translateY(9px) rotate(45deg);
}

.menu-btn.open span:nth-child(2) {
  opacity: 0;
}

.menu-btn.open span:nth-child(3) {
  transform: translateY(-9px) rotate(-45deg);
}

/* Main content area - Remove margin transition to prevent dynamic resizing */
#main {
  padding: 16px;
  padding-top: 70px;
  /* No transition for margin-left */
}

/* Accessibility controls adjustments */
#accessibility-controls {
  position: fixed;
  top: 15px;
  right: 20px;
  z-index: 98;
  background-color: transparent;
  padding: 10px;
}

/* Media queries for responsive design */
@media screen and (max-width: 600px) {
  .sidebar {
    padding-top: 50px;
  }
  .sidebar a {
    padding: 12px 20px;
    font-size: 16px;
  }
}

/* Overlay when sidebar is open */
.overlay {
  position: fixed;
  display: none;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.3);
  z-index: 90;
  cursor: pointer;
}

/* Accessibility menu styling */
#accessibility-menu {
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.2);
}

#accessibility-menu button {
  margin: 5px;
  padding: 8px 12px;
  border: none;
  background-color: #3498db;
  color: white;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

#accessibility-menu button:hover {
  background-color: #2980b9;
}

#accessibility-controls > button {
  padding: 8px 15px;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  transition: background-color 0.2s;
}

#accessibility-controls > button:hover {
  background-color: #2980b9;
}

.elderly-mode {
  font-size: 20px;
  background-color: #fef9e7;
  color: #000;
}
.elderly-mode nav {
  background-color: #ffeb99;
}
.elderly-mode nav a {
  font-size: 22px;
  color: #000;
}
.elderly-mode h1 {
  font-size: 32px;
}
.elderly-mode p, .elderly-mode li {
  font-size: 20px;
}


        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            padding: 30px;
            background-color: #f7f9fc;
        }
        h2, h3 {
            text-align: center;
            color: #2c3e50;
            font-size: 2em;
        }
        .container {
            display: flex;
            gap: 50px;
            flex-wrap: wrap;
        }
        .form-section, .table-section {
            flex: 1;
            min-width: 300px;
        }
        input[type="number"], input[type="submit"] {
            padding: 8px;
            margin: 5px 0 15px 0;
            width: 100%;
            box-sizing: border-box;
        }
        form label {
            display: block;
            margin-top: 10px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #4a90e2;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4a90e2;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #eef3fb;
        }
    </style>
</head>
<body>
    <!-- Site Path Navigation -->
    <div class="sitepath">
        <a href="staffpage.html">Profile</a> &gt; <a href="stockupdate.php">Stock Update</a>
    </div>

    <!-- Menu Button -->
    <div class="menu-btn" onclick="toggleNav()">
        <span></span>
        <span></span>
        <span></span>
    </div>

    <!-- Overlay & Sidebar Navigation -->
    <div id="overlay" class="overlay"></div>
    <div id="mySidebar" class="sidebar">
        <span class="close-btn" onclick="closeNav()" title="Leave Menu">&times;</span>
        <a class="active" href="homepage.html">Home</a>
        <a href="about_us.html">About Us</a>
        <a href="service.html">Services</a>
        <a href="staff_roster.html">Roster</a>
      <a href="inventory.html" class="active">Inventory</a>
        <a href="stockupdate.php">Update Stock</a>
        <!-- <a href="booking_button.html">Book Services</a> -->
        <a href="registerlogin.html" onclick="handleLogout()">Logout</a>
    </div>

    <!-- Accessibility Controls -->
    <div id="accessibility-controls">
        <button onclick="toggleAccessibilityMenu()">Accessibility</button>
        <div id="accessibility-menu" style="display: none; margin-top: 10px;">
            <button onclick="increaseTextSize()">A+</button>
            <button onclick="decreaseTextSize()">A-</button>
            <button onclick="toggleDarkMode()">Dark Mode</button>
            <button onclick="toggleElderlyMode()">Elderly Mode</button>
            <button onclick="resetDefaults()">Set to Default</button>
        </div>
    </div>

<h2>Stock Update Page</h2>

<div class="container">
    <!-- Left Column: Reference Table -->
    <div class="table-section">
        <h3>Product ID and Name Reference</h3>
        <?php
        if ($result->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Product ID</th><th>Product Name</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr><td>" . htmlspecialchars($row["product_id"]) . "</td><td>" . htmlspecialchars($row["product_name"]) . "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "No products found in the database.";
        }
        ?>
    </div>

    <!-- Right Column: Form -->
    <div class="form-section">
        <h3>Update Stock</h3>
        <form action="update_stock.php" method="post">
            <label for="product_id">Product ID:</label>
            <input type="number" name="product_id" id="product_id" required>

            <label for="quantity_add">Quantity to Add:</label>
            <input type="number" name="quantity_add" id="quantity_add" value="0">

            <label for="quantity_deduct">Quantity to Deduct:</label>
            <input type="number" name="quantity_deduct" id="quantity_deduct" value="0">

            <input type="submit" value="Update Stock">
        </form>
    </div>
</div>
<!-- JavaScript & Data Fetching -->
    <script src="timeout.js"></script>
    <script src="accessibility.js"></script>
    <script src="js/sidebar-navigation.js"></script>

</body>
</html>

<?php $conn->close(); ?>
