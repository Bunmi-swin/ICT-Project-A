<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$host = 'localhost';
$dbname = 'aged_care';
$username = 'root';
$password = '';

if (!isset($_GET['email'])) {
    echo json_encode(['status' => 'error', 'message' => 'Email parameter missing']);
    exit();
}

$family_email = $_GET['email'];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT resident_id, full_name, email, gender, date_of_birth, contact_number, 
                                  family_contact, medication, accessibility_requirements, address, 
                                  family_member_name, medical_conditions, allergies, appointments 
                           FROM resident_table WHERE LOWER(family_member_email) = LOWER(:email)");
    $stmt->execute(['email' => $family_email]);
    $residents = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['status' => 'success', 'residents' => $residents]);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
}
?>
