<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>Profil sayfasını görmek için giriş yapmalısınız.</p>";
    include 'includes/footer.php';
    exit;
}

$kullanici_id = $_SESSION['kullanici_id'];

// Kullanıcı bilgilerini çek
$sql = "SELECT isim, email, kayit_tarihi FROM kullanicilar WHERE id = :id";
$stmt = $conn->prepare($sql);
$stmt->execute(['id' => $kullanici_id]);
$kullanici = $stmt->fetch(PDO::FETCH_ASSOC);

// Kullanıcının yüklediği NFT'leri çek
$sql_nft = "SELECT * FROM nftler WHERE sahip_id = :id";
$stmt_nft = $conn->prepare($sql_nft);
$stmt_nft->execute(['id' => $kullanici_id]);
$nftler = $stmt_nft->fetchAll(PDO::FETCH_ASSOC);
?>

<link rel="stylesheet" href="/css/profil.css">

<div class="profil-container">
  <h2>Profil Bilgileri</h2>
  <p><strong>İsim:</strong> <?php echo htmlspecialchars($kullanici['isim']); ?></p>
  <p><strong>E-posta:</strong> <?php echo htmlspecialchars($kullanici['email']); ?></p>
  <p><strong>Kayıt Tarihi:</strong> <?php echo htmlspecialchars($kullanici['kayit_tarihi']); ?></p>

  <?php if (!empty($_SESSION['wallet_address'])): ?>
    <p><strong>Cüzdan Adresi:</strong> <?php echo htmlspecialchars($_SESSION['wallet_address']); ?></p>
  <?php endif; ?>

  <a href="sifre-degistir.php" class="btn">Şifreyi Değiştir</a>
</div>

<div class="profil-nftler">
  <h2>Yüklediğim NFT'ler</h2>
  <?php if (count($nftler) > 0): ?>
    <div class="nft-container">
      <?php foreach ($nftler as $nft): ?>
        <div class="nft-card">
          <img src="/img/<?php echo htmlspecialchars($nft['resim']); ?>" alt="<?php echo htmlspecialchars($nft['ad']); ?>">
          <div class="nft-info">
            <h3><?php echo htmlspecialchars($nft['ad']); ?></h3>
            <p><?php echo htmlspecialchars($nft['aciklama']); ?></p>
            <span><?php echo htmlspecialchars($nft['fiyat']); ?> ETH</span>
            <div class="nft-actions">
              <a href="nft-duzenle.php?id=<?php echo $nft['id']; ?>" class="btn small">Düzenle</a>
              <a href="nft-sil.php?id=<?php echo $nft['id']; ?>" class="btn small danger" onclick="return confirm('NFT silinsin mi?');">Sil</a>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  <?php else: ?>
    <p>Henüz NFT yüklemediniz.</p>
  <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
