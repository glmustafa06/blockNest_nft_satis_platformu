<?php
$servername = "localhost";
$username = "root";       // XAMPP kullanıyorsan genellikle root
$password = "";           // şifre genelde boş
$dbname = "blocknest_database";

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Bağlantı hatası: " . $e->getMessage();
  die();
}
?>
