<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = "localhost";
$dbname = "aged_care";
$user = "root";
$pass = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "DB connection failed: " . $e->getMessage()]);
    exit();
}

$data = json_decode(file_get_contents("php://input"), true);

$required = ['fullName', 'email', 'password', 'dob', 'gender', 'address', 'phone', 'familyName', 'emergencyContact', 'medicalConditions', 'medications', 'allergies', 'accessibility', 'role'];
foreach ($required as $field) {
    if (empty($data[$field])) {
        echo json_encode(["status" => "error", "message" => "Missing: $field"]);
        exit();
    }
}

$stmt = $pdo->query("SELECT MAX(CAST(SUBSTRING(`resident_id`, 2) AS UNSIGNED)) AS max_id FROM `resident table`");
$row = $stmt->fetch(PDO::FETCH_ASSOC);
$newId = 'R' . str_pad(($row['max_id'] + 1), 3, '0', STR_PAD_LEFT);

$sql = "INSERT INTO `resident table` (
    resident_id, full_name, email, password, gender, date_of_birth, contact_number, family_contact, medication, accessibility_requirements, address, family_member_name, medical_conditions, allergies
) VALUES (
    :resident_id, :full_name, :email, :password, :gender, :dob, :phone, :emergency_contact, :medications, :accessibility, :address, :family_member_name, :medical_conditions, :allergies
)";

$stmt = $pdo->prepare($sql);
try {
    $stmt->execute([
        ':resident_id' => $newId,
        ':full_name' => $data['fullName'],
        ':email' => $data['email'],
        ':password' => $data['password'],
        ':gender' => $data['gender'],
        ':dob' => $data['dob'],
        ':phone' => $data['phone'],
        ':emergency_contact' => $data['emergencyContact'],
        ':medications' => $data['medications'],
        ':accessibility' => $data['accessibility'],
        ':address' => $data['address'],
        ':family_member_name' => $data['familyName'], // ✅ corrected here
        ':medical_conditions' => $data['medicalConditions'],
        ':allergies' => $data['allergies']
    ]);
    echo json_encode(["status" => "success", "message" => "Registration successful!"]);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Insert failed: " . $e->getMessage()]);
}
?>
