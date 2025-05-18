<?php
$successMessage = "";
$errorMessage = "";

// Handle POST request
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "aged_care";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        $errorMessage = "Database connection failed.";
    } else {
        // Get POST data
        $full_name = trim($_POST['full_name']);
        $email = trim($_POST['email']);
        $appointment_date = $_POST['appointment_date'];
        $time_slot = $_POST['time_slot'];
        $service = $_POST['service'];
        $notes = trim($_POST['notes']);

        // Validate input
        if (empty($full_name) || empty($email) || empty($appointment_date) || empty($time_slot) || empty($service)) {
            $errorMessage = "Please fill in all required fields.";
        } else {
            // Check if resident exists
            $stmt = $conn->prepare("SELECT email FROM resident_table WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();

            $residentExists = $result->num_rows > 0;
            $stmt->close();

            if (!$residentExists) {
                // Insert resident if not exists
                $insertResident = $conn->prepare("INSERT INTO resident_table (email, full_name, appointments) VALUES (?, ?, '')");
                $insertResident->bind_param("ss", $email, $full_name);
                $insertResident->execute();
                $insertResident->close();
            }

            // Insert appointment into appointment_table
            $insertAppointment = $conn->prepare("INSERT INTO appointment_table (resident_email, appointment_date, time_slot, service, notes) VALUES (?, ?, ?, ?, ?)");
            $insertAppointment->bind_param("sssss", $email, $appointment_date, $time_slot, $service, $notes);

            if ($insertAppointment->execute()) {
                // Format appointment summary
                $appointmentEntry = "$appointment_date at $time_slot for $service";

                // Fetch existing appointments string
                $getAppointments = $conn->prepare("SELECT appointments FROM resident_table WHERE email = ?");
                $getAppointments->bind_param("s", $email);
                $getAppointments->execute();
                $result = $getAppointments->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $existingAppointments = $row['appointments'];

                    // Append new appointment
                    $updatedAppointments = $existingAppointments ? $existingAppointments . "\n" . $appointmentEntry : $appointmentEntry;

                    // Update resident_table
                    $updateAppointments = $conn->prepare("UPDATE resident_table SET appointments = ? WHERE email = ?");
                    $updateAppointments->bind_param("ss", $updatedAppointments, $email);
                    $updateAppointments->execute();
                    $updateAppointments->close();
                }

                $getAppointments->close();
                $successMessage = "Appointment booked successfully!";
            } else {
                $errorMessage = "Error: " . $insertAppointment->error;
            }

            $insertAppointment->close();
        }

        $conn->close();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }

        .message {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            max-width: 500px;
        }

        .success {
            background-color: #e6ffed;
            border: 1px solid #34c759;
            color: #2e7d32;
        }

        .error {
            background-color: #ffe6e6;
            border: 1px solid #ff3b30;
            color: #c62828;
        }

        .back-button {
            display: inline-block;
            margin-top: 10px;
            background-color: #6c757d;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        form {
            max-width: 500px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<?php if (!empty($successMessage)): ?>
    <div class="message success">
        <?php echo $successMessage; ?>
        <br><br>
        <a href="../bookingwithoutlogin.html" class="back-button">Book Another Service</a>
    </div>
<?php endif; ?>

<?php if (!empty($errorMessage)): ?>
    <div class="message error">
        <?php echo $errorMessage; ?>
        <br><br>
        <a href="../bookingwithoutlogin.html" class="back-button">Book Another Service</a>
    </div>
<?php endif; ?>

</body>
</html>
