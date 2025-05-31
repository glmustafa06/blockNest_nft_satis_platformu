<?php
session_start();
include 'includes/db.php';

if (!isset($_SESSION['kullanici_id'])) {
    header("Location: giris.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['nft_id'])) {
    $kullanici_id = $_SESSION['kullanici_id'];
    $nft_id = (int) $_POST['nft_id'];

    // Aynı favori daha önce eklenmiş mi?
    $kontrol = $conn->prepare("SELECT * FROM favoriler WHERE kullanici_id = ? AND nft_id = ?");
    $kontrol->execute([$kullanici_id, $nft_id]);

    if ($kontrol->rowCount() === 0) {
        $ekle = $conn->prepare("INSERT INTO favoriler (kullanici_id, nft_id) VALUES (?, ?)");
        $ekle->execute([$kullanici_id, $nft_id]);
    }

    header("Location: nft-detay.php?id=$nft_id");
    exit;
}
?>
