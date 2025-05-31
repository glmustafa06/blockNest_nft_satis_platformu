<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';
?>

<link rel="stylesheet" href="css/style.css">

<div class="form-container">
  <h2>Giriş Yap</h2>

  <?php
  if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $email = trim($_POST['email']);
      $sifre = trim($_POST['sifre']);

      if ($email && $sifre) {
          $stmt = $conn->prepare("SELECT * FROM kullanicilar WHERE email = ?");
          $stmt->execute([$email]);
          $kullanici = $stmt->fetch(PDO::FETCH_ASSOC);

          if ($kullanici && $kullanici['sifre_hash'] === $sifre) { // Düz metin şifre kontrolü
              $_SESSION['kullanici_id'] = $kullanici['id'];
              $_SESSION['kullanici_isim'] = $kullanici['isim'];
              header("Location: index.php");
              exit;
          } else {
              echo "<p style='color: red;'>E-posta veya şifre hatalı.</p>";
          }
      } else {
          echo "<p style='color: red;'>Lütfen tüm alanları doldurun.</p>";
      }
  }
  ?>

  <form method="POST">
    <label>E-posta</label>
    <input type="email" name="email" required>

    <label>Şifre</label>
    <input type="password" name="sifre" required>

    <button type="submit">Giriş Yap</button>
  </form>
</div>

<?php include 'includes/footer.php'; ?>
</body>
</html>
