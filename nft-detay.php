<?php include 'includes/db.php'; ?>
<?php include 'includes/header.php'; ?>
<link rel="stylesheet" href="css/style.css">

<?php
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "<p style='padding: 40px; color: red;'>Geçersiz NFT ID.</p>";
    exit;
}

$id = (int)$_GET['id'];

// NFT detayları
$sql = "SELECT nftler.*, kategoriler.ad AS kategori_adi, kullanicilar.isim AS sahip_adi
        FROM nftler
        JOIN kategoriler ON nftler.kategori_id = kategoriler.id
        JOIN kullanicilar ON nftler.sahip_id = kullanicilar.id
        WHERE nftler.id = :id";
$stmt = $conn->prepare($sql);
$stmt->execute(['id' => $id]);
$nft = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$nft) {
    echo "<p style='padding: 40px; color: red;'>NFT bulunamadı.</p>";
    exit;
}

// Kullanıcı favoride mi kontrolü
$favoride_mi = false;
if (isset($_SESSION['kullanici_id'])) {
    $kontrol = $conn->prepare("SELECT * FROM favoriler WHERE kullanici_id = ? AND nft_id = ?");
    $kontrol->execute([$_SESSION['kullanici_id'], $nft['id']]);
    $favoride_mi = $kontrol->rowCount() > 0;
}
?>

<div class="nft-detail-container">
  <div class="nft-detail-image">
    <img src="/img/<?php echo htmlspecialchars($nft['resim']); ?>" alt="<?php echo htmlspecialchars($nft['ad']); ?>">
  </div>
  <div class="nft-detail-info">
    <h1><?php echo htmlspecialchars($nft['ad']); ?></h1>
    <p class="nft-detail-desc"><?php echo htmlspecialchars($nft['aciklama']); ?></p>

    <div class="nft-detail-meta">
      <p><strong>Fiyat:</strong> <span class="fiyat"><?php echo htmlspecialchars($nft['fiyat']); ?> ETH</span></p>
      <p><strong>Kategori:</strong> <?php echo htmlspecialchars($nft['kategori_adi']); ?></p>
      <p><strong>Sahip:</strong> <?php echo htmlspecialchars($nft['sahip_adi']); ?></p>
      <p><strong>Yüklenme Tarihi:</strong> <?php echo htmlspecialchars($nft['tarih']); ?></p>
    </div>

    <?php if (isset($_SESSION['kullanici_id'])): ?>
      <form method="POST" action="<?php echo $favoride_mi ? '/favori-kaldir.php' : '/favori-ekle.php'; ?>">
        <input type="hidden" name="nft_id" value="<?php echo $nft['id']; ?>">
        <button type="submit" class="<?php echo $favoride_mi ? 'fav-btn remove' : 'fav-btn'; ?>">
          <i class="fas fa-heart"></i>
          <?php echo $favoride_mi ? 'Favorilerden Kaldır' : 'Favorilere Ekle'; ?>
        </button>
      </form>
    <?php endif; ?>
    
  </div>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
