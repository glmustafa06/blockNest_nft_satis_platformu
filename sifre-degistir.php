<?php
session_start();
include 'includes/db.php';

if (!isset($_SESSION['kullanici_id'])) {
    echo "<p style='padding: 40px; color: red;'>Bu sayfayı görmek için giriş yapmalısınız.</p>";
    exit;
}

$hata = "";
$basari = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $eski_sifre = trim($_POST['eski_sifre'] ?? '');
    $yeni_sifre = trim($_POST['yeni_sifre'] ?? '');
    $yeni_sifre_tekrar = trim($_POST['yeni_sifre_tekrar'] ?? '');

    if ($yeni_sifre !== $yeni_sifre_tekrar) {
        $hata = "Yeni şifreler uyuşmuyor.";
    } elseif (strlen($yeni_sifre) < 6) {
        $hata = "Yeni şifre en az 6 karakter olmalıdır.";
    } else {
        // Eski şifreyi doğrudan karşılaştır
        $stmt = $conn->prepare("SELECT sifre_hash FROM kullanicilar WHERE id = :id");
        $stmt->execute(['id' => $_SESSION['kullanici_id']]);
        $kullanici = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$kullanici) {
            $hata = "Kullanıcı bulunamadı.";
        } elseif ($eski_sifre !== $kullanici['sifre_hash']) {
            $hata = "Eski şifre hatalı.";
        } else {
            // Şifreyi doğrudan güncelle (hash yok)
            $update = $conn->prepare("UPDATE kullanicilar SET sifre_hash = :yeni WHERE id = :id");
            $update->execute([
                'yeni' => $yeni_sifre,
                'id' => $_SESSION['kullanici_id']
            ]);
            $basari = "Şifreniz başarıyla güncellendi.";
        }
    }
}
?>

<?php include 'includes/header.php'; ?>
<link rel="stylesheet" href="css/form.css">

<div class="form-container">
  <h2>Şifre Değiştir</h2>

  <?php if ($hata): ?>
    <p class="form-error"><?php echo htmlspecialchars($hata); ?></p>
  <?php elseif ($basari): ?>
    <p class="form-success"><?php echo htmlspecialchars($basari); ?></p>
  <?php endif; ?>

  <form method="POST">
    <label for="eski_sifre">Mevcut Şifreniz</label>
    <input type="password" id="eski_sifre" name="eski_sifre" required>

    <label for="yeni_sifre">Yeni Şifre</label>
    <input type="password" id="yeni_sifre" name="yeni_sifre" required>

    <label for="yeni_sifre_tekrar">Yeni Şifre (Tekrar)</label>
    <input type="password" id="yeni_sifre_tekrar" name="yeni_sifre_tekrar" required>

    <button type="submit" class="btn">Şifreyi Güncelle</button>
  </form>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
