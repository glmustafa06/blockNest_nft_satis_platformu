<?php
session_start();
include 'includes/db.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>NFT silmek için giriş yapmalısınız.</p>";
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "<p style='padding: 40px; color: red;'>Geçersiz NFT ID.</p>";
    exit;
}

$nft_id = (int)$_GET['id'];
$kullanici_id = $_SESSION['kullanici_id'];

// NFT'nin sahibine ait olup olmadığını kontrol et
$sql = "SELECT resim FROM nftler WHERE id = :id AND sahip_id = :sahip_id";
$stmt = $conn->prepare($sql);
$stmt->execute(['id' => $nft_id, 'sahip_id' => $kullanici_id]);
$nft = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$nft) {
    echo "<p style='padding: 40px; color: red;'>NFT bulunamadı veya silme yetkiniz yok.</p>";
    exit;
}

// Dosya sisteminden resmi sil (isteğe bağlı)
$resim_yolu = __DIR__ . '/img/' . $nft['resim'];
if (file_exists($resim_yolu)) {
    unlink($resim_yolu);
}

// Veritabanından NFT'yi sil
$delete_sql = "DELETE FROM nftler WHERE id = :id AND sahip_id = :sahip_id";
$delete_stmt = $conn->prepare($delete_sql);
$delete_stmt->execute(['id' => $nft_id, 'sahip_id' => $kullanici_id]);

// Favoriler tablosundan da sil
$conn->prepare("DELETE FROM favoriler WHERE nft_id = :nft_id")->execute(['nft_id' => $nft_id]);

// Yönlendir
header("Location: profil.php");
exit;
?>
