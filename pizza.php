<?php
$nev = $_POST['nev'];
$email = $_POST['email'];
$telefon = $_POST['telefon'];
$pizza = $_POST['pizza'];
$meret = $_POST['meret'];
$extraSajt = isset($_POST['extraCheese']) ? $_POST['extraCheese'] : '';

$conn = new mysqli('localhost', 'root', '', 'pizza');
if ($conn->connect_error) {
    die('Connection Failed: ' . $conn->connect_error);
} else {
    $stmt = $conn->prepare("INSERT INTO pizza (nev, email, telefon, pizza, meret, extraSajt) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssss", $nev, $email, $telefon, $pizza, $meret, $extraSajt);
    if ($stmt->execute()) {
        echo "Rendelés sikeres";
    } else {
        echo "Hiba történt a rendelés során: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
}
?>
