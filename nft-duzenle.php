<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>Giriş yapmadan bu sayfaya erişemezsiniz.</p>";
    include 'includes/footer.php';
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "<p style='padding: 40px; color: red;'>Geçersiz NFT ID.</p>";
    include 'includes/footer.php';
    exit;
}

$nft_id = (int)$_GET['id'];
$kullanici_id = $_SESSION['kullanici_id'];

// NFT'yi ve sahibini kontrol et
$sql = "SELECT * FROM nftler WHERE id = :id AND sahip_id = :sahip_id";
$stmt = $conn->prepare($sql);
$stmt->execute(['id' => $nft_id, 'sahip_id' => $kullanici_id]);
$nft = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$nft) {
    echo "<p style='padding: 40px; color: red;'>NFT bulunamadı veya yetkiniz yok.</p>";
    include 'includes/footer.php';
    exit;
}

// Kategorileri çek
$kat_stmt = $conn->query("SELECT * FROM kategoriler");
$kategoriler = $kat_stmt->fetchAll(PDO::FETCH_ASSOC);

// Güncelleme işlemi
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ad = trim($_POST['ad']);
    $aciklama = trim($_POST['aciklama']);
    $fiyat = floatval($_POST['fiyat']);
    $kategori_id = intval($_POST['kategori_id']);

    // Görsel güncellenmişse işle
    if (!empty($_FILES['resim']['name'])) {
        $dosya_ad = basename($_FILES['resim']['name']);
        $hedef = __DIR__ . '/img/' . $dosya_ad;
        move_uploaded_file($_FILES['resim']['tmp_name'], $hedef);
    } else {
        $dosya_ad = $nft['resim'];
    }

    // Veritabanını güncelle
    $guncelle = "UPDATE nftler SET ad = :ad, aciklama = :aciklama, fiyat = :fiyat, kategori_id = :kategori_id, resim = :resim WHERE id = :id AND sahip_id = :sahip_id";
    $stmt = $conn->prepare($guncelle);
    $stmt->execute([
        'ad' => $ad,
        'aciklama' => $aciklama,
        'fiyat' => $fiyat,
        'kategori_id' => $kategori_id,
        'resim' => $dosya_ad,
        'id' => $nft_id,
        'sahip_id' => $kullanici_id
    ]);

    echo "<p style='padding: 20px; color: green;'>NFT başarıyla güncellendi.</p>";
    // Veriyi tekrar çek
    header("Location: profil.php");
    exit;
}
?>

<link rel="stylesheet" href="/css/form.css">

<div class="form-container">
  <h2>NFT Güncelle</h2>
  <form method="POST" enctype="multipart/form-data">
    <label>Ad:</label>
    <input type="text" name="ad" value="<?php echo htmlspecialchars($nft['ad']); ?>" required>

    <label>Açıklama:</label>
    <textarea name="aciklama" rows="4" required><?php echo htmlspecialchars($nft['aciklama']); ?></textarea>

    <label>Fiyat (ETH):</label>
    <input type="number" step="0.01" name="fiyat" value="<?php echo htmlspecialchars($nft['fiyat']); ?>" required>

    <label>Kategori:</label>
    <select name="kategori_id" required>
      <?php foreach ($kategoriler as $kategori): ?>
        <option value="<?php echo $kategori['id']; ?>" <?php if ($kategori['id'] == $nft['kategori_id']) echo 'selected'; ?>>
          <?php echo htmlspecialchars($kategori['ad']); ?>
        </option>
      <?php endforeach; ?>
    </select>

    <label>Yeni Resim (Opsiyonel):</label>
    <input type="file" name="resim" accept="image/*">

    <button type="submit">Güncelle</button>
  </form>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
