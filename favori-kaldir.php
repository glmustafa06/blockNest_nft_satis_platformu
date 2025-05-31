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

    $sil = $conn->prepare("DELETE FROM favoriler WHERE kullanici_id = ? AND nft_id = ?");
    $sil->execute([$kullanici_id, $nft_id]);

    header("Location: nft-detay.php?id=$nft_id");
    exit;
}
?>
