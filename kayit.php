<?php include 'includes/db.php'; ?>
<?php include 'includes/header.php'; ?>
<link rel="stylesheet" href="css/style.css">

<div class="form-container">
  <h2>Kayıt Ol</h2>

  <?php
  if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $isim = trim($_POST['isim']);
      $email = trim($_POST['email']);
      $sifre = trim($_POST['sifre']);

      if ($isim && $email && $sifre) {
          $stmt = $conn->prepare("INSERT INTO kullanicilar (isim, email, sifre_hash, kayit_tarihi) VALUES (?, ?, ?, NOW())");
          $stmt->execute([$isim, $email, $sifre]); // Şifreyi hash'lemiyoruz
          echo "<p style='color: #2ea043;'>Kayıt başarılı! <a href='giris.php'>Giriş yap</a></p>";
      } else {
          echo "<p style='color: red;'>Lütfen tüm alanları doldurun.</p>";
      }
  }
  ?>

  <form method="POST">
    <label>İsim</label>
    <input type="text" name="isim" required>

    <label>Email</label>
    <input type="email" name="email" required>

    <label>Şifre</label>
    <input type="password" name="sifre" required>

    <button type="submit">Kayıt Ol</button>
  </form>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
