<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>Bu sayfayı görmek için giriş yapmalısınız.</p>";
    include 'includes/footer.php';
    exit;
}

$kullanici_id = $_SESSION['kullanici_id'];

$sql = "SELECT nftler.*, kategoriler.ad AS kategori_adi
        FROM favoriler
        JOIN nftler ON favoriler.nft_id = nftler.id
        JOIN kategoriler ON nftler.kategori_id = kategoriler.id
        WHERE favoriler.kullanici_id = :kullanici_id";

$stmt = $conn->prepare($sql);
$stmt->execute(['kullanici_id' => $kullanici_id]);
$favori_nftler = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="nft-container">
  <?php if (count($favori_nftler) > 0): ?>
    <?php foreach ($favori_nftler as $nft): ?>
      <a href="nft-detay.php?id=<?php echo $nft['id']; ?>" class="nft-card">
        <img src="/img/<?php echo htmlspecialchars($nft['resim']); ?>" alt="<?php echo htmlspecialchars($nft['ad']); ?>">
        <div class="nft-info">
          <h3><?php echo htmlspecialchars($nft['ad']); ?></h3>
          <p><?php echo htmlspecialchars($nft['aciklama']); ?></p>
          <span><?php echo htmlspecialchars($nft['fiyat']); ?> ETH</span>
        </div>
      </a>
    <?php endforeach; ?>
  <?php else: ?>
    <p style="padding: 40px; color: #8b949e;">Henüz favorilere eklediğiniz NFT bulunmuyor.</p>
  <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
