<?php include 'includes/db.php'; ?>
<?php include 'includes/header.php'; ?>
<link rel="stylesheet" href="css/style.css">

<!-- Üst tanıtım alanı -->
<div class="hero">
    <i class="fas fa-cube hero-icon"></i>
    <h1>Keşfet, Sahiplen, Ticaret Yap</h1>
    <p>Dijital dünyada nadir bulunan NFT koleksiyonlarını BlockNest ile keşfet.</p>
    <div class="hero-buttons">
        <a href="#" class="hero-btn primary"><i class="fas fa-search"></i> NFT'leri Keşfet</a>
        <?php if (isset($_SESSION['kullanici_id'])): ?>
  <a href="/favorilerim.php" class="hero-btn secondary">
    <i class="fas fa-star"></i> Favorilerim
  </a>
<?php else: ?>
  <a href="/giris.php" class="hero-btn secondary">
    <i class="fas fa-sign-in-alt"></i> Giriş Yap
  </a>
<?php endif; ?>

    </div>
</div>

<!-- Verileri çek -->
<?php
$sql = "SELECT nftler.id, nftler.ad, nftler.aciklama, nftler.resim, nftler.fiyat, kategoriler.ad AS kategori
        FROM nftler
        JOIN kategoriler ON nftler.kategori_id = kategoriler.id";
$stmt = $conn->query($sql);

$nftler_by_kategori = [];

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $kategori = $row['kategori'];
    $nftler_by_kategori[$kategori][] = $row;
}
?>

<!-- NFT'leri kategoriye göre gruplandırarak göster -->
<?php foreach ($nftler_by_kategori as $kategori_adi => $nft_listesi): ?>
    <h2 class="kategori-baslik"><?php echo htmlspecialchars($kategori_adi); ?></h2>
    <div class="nft-container">
        <?php foreach ($nft_listesi as $nft): ?>
            <a href="nft-detay.php?id=<?php echo $nft['id']; ?>" class="nft-card">
                <img src="/img/<?php echo htmlspecialchars($nft['resim']); ?>" alt="<?php echo htmlspecialchars($nft['ad']); ?>">
                <div class="nft-info">
                    <h3><?php echo htmlspecialchars($nft['ad']); ?></h3>
                    <p><?php echo htmlspecialchars($nft['aciklama']); ?></p>
                    <span><?php echo htmlspecialchars($nft['fiyat']); ?> ETH</span>
                </div>
            </a>
        <?php endforeach; ?>
    </div>
<?php endforeach; ?>

<?php include 'includes/footer.php'; ?>
</body>
</html>
