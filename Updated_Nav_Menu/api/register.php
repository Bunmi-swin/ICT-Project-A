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

// Validate required fields
$required = ['fullName', 'email', 'password', 'dob', 'gender', 'address', 'phone',
             'familyName', 'familyEmail', 'familyPassword', 'emergencyContact',
             'medicalConditions', 'medications', 'allergies', 'accessibility'];

foreach ($required as $field) {
    if (empty($data[$field])) {
        echo json_encode(["status" => "error", "message" => "Missing: $field"]);
        exit();
    }
}

// Check if family member already exists
$familyEmail = $data['familyEmail'];
$stmt = $pdo->prepare("SELECT id FROM family_member_table WHERE email = :email");
$stmt->execute([':email' => $familyEmail]);
$family = $stmt->fetch(PDO::FETCH_ASSOC);

// If not exists, insert into family_member_table
if (!$family) {
    $stmt = $pdo->query("SELECT MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)) AS max_id FROM family_member_table");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $newFamilyId = 'F' . str_pad(($row['max_id'] + 1), 3, '0', STR_PAD_LEFT);

    $stmt = $pdo->prepare("INSERT INTO family_member_table (id, name, email, password)
                           VALUES (:id, :name, :email, :password)");
    $stmt->execute([
        ':id' => $newFamilyId,
        ':name' => $data['familyName'],
        ':email' => $data['familyEmail'],
        ':password' => $data['familyPassword']
    ]);

    $familyId = $newFamilyId;
} else {
    $familyId = $family['id'];
}

// Generate resident ID
$stmt = $pdo->query("SELECT MAX(CAST(SUBSTRING(resident_id, 2) AS UNSIGNED)) AS max_id FROM resident_table");
$row = $stmt->fetch(PDO::FETCH_ASSOC);
$newResidentId = 'R' . str_pad(($row['max_id'] + 1), 3, '0', STR_PAD_LEFT);

// Insert resident with linked family details
$sql = "INSERT INTO resident_table (
    resident_id, full_name, email, password, gender, date_of_birth, contact_number,
    family_contact, medication, accessibility_requirements, address,
    family_member_name, medical_conditions, allergies, appointments, family_member_email
) VALUES (
    :resident_id, :full_name, :email, :password, :gender, :dob, :phone,
    :family_contact, :medications, :accessibility, :address,
    :family_name, :medical_conditions, :allergies, NULL, :family_email
)";

$stmt = $pdo->prepare($sql);
try {
    $stmt->execute([
        ':resident_id' => $newResidentId,
        ':full_name' => $data['fullName'],
        ':email' => $data['email'],
        ':password' => $data['password'],
        ':gender' => $data['gender'],
        ':dob' => $data['dob'],
        ':phone' => $data['phone'],
        ':family_contact' => $data['emergencyContact'],
        ':medications' => $data['medications'],
        ':accessibility' => $data['accessibility'],
        ':address' => $data['address'],
        ':family_name' => $data['familyName'],
        ':medical_conditions' => $data['medicalConditions'],
        ':allergies' => $data['allergies'],
        ':family_email' => $data['familyEmail'],
        // appointments is set to NULL by default here
    ]);
    echo json_encode(["status" => "success", "message" => "Registration successful!"]);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Insert failed: " . $e->getMessage()]);
}
?>
