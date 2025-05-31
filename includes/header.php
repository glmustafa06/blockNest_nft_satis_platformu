<?php if (session_status() === PHP_SESSION_NONE) { session_start(); } ?>
<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>BlockNest NFT Marketplace</title>

  <!-- FontAwesome (GÜNCELLENMİŞ CDN) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-RRy+hcgEhKCBHsn9g+YUJb+UsJXAi8cnI34x4ZxM/VcI7R1Yf54VHzElcbp6ts2KDutBgAqNKTpL7RJNDYxTig==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Ethers.js -->
  <script src="https://cdn.jsdelivr.net/npm/ethers@5.7.2/dist/ethers.umd.min.js"></script>

  <!-- CSS -->
  <link rel="stylesheet" href="/css/style.css" />
</head>

<body>

<header class="navbar">
  <div class="navbar-container">

    <!-- Sol: Logo -->
    <div class="logo">
      <a href="/index.php">Block<span>Nest</span></a>
    </div>

    <!-- Orta: Menü -->
    <nav class="nav-links">
      <a href="/index.php"><i class="fas fa-compass"></i> Keşfet</a>
      <?php if (isset($_SESSION['kullanici_id'])): ?>
        <a href="/favorilerim.php"><i class="fas fa-heart"></i> Favorilerim</a>
        <a href="/nft-yukle.php"><i class="fas fa-upload"></i> NFT Yükle</a>
        <a href="/profil.php"><i class="fas fa-user"></i> Profil</a>
      <?php endif; ?>
    </nav>

    <!-- Sağ: Cüzdan + Giriş -->
    <div class="nav-actions">
      <button class="wallet-btn">🔗 Cüzdanı Bağla</button>
      <?php if (isset($_SESSION['kullanici_id'])): ?>
        <span style="color: #58a6ff;">👤 <?php echo htmlspecialchars($_SESSION['kullanici_isim']); ?></span>
        <a href="/logout.php" class="auth-link">Çıkış Yap</a>
      <?php else: ?>
        <a href="/giris.php" class="auth-link">Giriş Yap</a>
        <a href="/kayit.php" class="auth-link">Kayıt Ol</a>
      <?php endif; ?>
    </div>

  </div>
</header>

<!-- Wallet bağlantı scripti (body sonuna alındı) -->
<script src="/js/wallet.js" defer></script>
