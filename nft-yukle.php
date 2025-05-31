<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>NFT yüklemek için giriş yapmalısınız.</p>";
    include 'includes/footer.php';
    exit;
}

// Kategorileri çek
$kategori_sorgu = $conn->query("SELECT * FROM kategoriler");
$kategoriler = $kategori_sorgu->fetchAll(PDO::FETCH_ASSOC);
?>

<link rel="stylesheet" href="/css/form.css">

<div class="upload-wrapper">
  <div class="upload-box">
    <h2>Yeni NFT Yükle</h2>
    <form action="nft-yukle-islem.php" method="POST" enctype="multipart/form-data">
      <div class="form-group">
        <label for="ad">NFT Adı</label>
        <input type="text" name="ad" id="ad" required>
      </div>

      <div class="form-group">
        <label for="aciklama">Açıklama</label>
        <textarea name="aciklama" id="aciklama" rows="4" required></textarea>
      </div>

      <div class="form-group">
        <label for="fiyat">Fiyat (ETH)</label>
        <input type="number" name="fiyat" id="fiyat" step="0.01" required>
      </div>

      <div class="form-group">
        <label for="kategori_id">Kategori</label>
        <select name="kategori_id" id="kategori_id" required>
          <option value="">Kategori Seçin</option>
          <?php foreach ($kategoriler as $kategori): ?>
            <option value="<?php echo $kategori['id']; ?>">
              <?php echo htmlspecialchars($kategori['ad']); ?>
            </option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="form-group">
        <label for="resim">NFT Görseli</label>
        <input type="file" name="resim" id="resim" accept="image/*" required>
      </div>

      <div class="form-group">
        <button type="submit" class="upload-btn">NFT'yi Yükle</button>
      </div>
    </form>
  </div>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
